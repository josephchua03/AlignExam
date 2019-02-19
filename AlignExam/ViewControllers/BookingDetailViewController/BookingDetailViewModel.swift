//
//  BookingDetailViewModel.swift
//  AlignExam
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UserNotifications

class BookingDetailViewModel {
    var dateStart = ""
    var dateEnd = ""
    var seatIndex = 0
    var desk_id = 0
    var seatList = Array<String>()
    var seatListValues = [DeskItem]()
    var isNewBooking = false
    var id = 0
    
    func getParameters() -> [String:Any]{
        return ["booking[desk_id]":desk_id,
                "booking[booked_at]":"",
                "booking[booked_from]":dateStart.getFormatDateFromStringForSubmit(),
                "booking[booked_to]":dateEnd.getFormatDateFromStringForSubmit()]
    }
    
    func callAddOrUpdate(completion:@escaping () -> Void,
                                serviceError:@escaping (_ message:String) -> Void) {
        //Validate not changed
        if desk_id == 0 {
            desk_id = seatListValues[seatIndex].id
        }
        
        if isNewBooking {
            callAddBookingService(parameter: getParameters(),
                                  completion: {(response:Any) in
                completion()
            },serviceError: {(errorMessage:String) in
                serviceError(errorMessage)
            })
        }
        else{
            callUpdateBookingService(id:id,parameter: getParameters(),completion: {(response:Any) in
                completion()
            },serviceError: {(errorMessage:String) in
                serviceError(errorMessage)
            })
        }
    }
    func callGetDesk(completion:@escaping () -> Void,
                                serviceError:@escaping (_ message:String) -> Void) {
        callGetDeskService(completion: {(response:Any) in
            let res = response as! Data
            //TODO: Move this to a class
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([DeskItem].self, from: res)
                self.seatListValues = response
                for (index, element) in response.enumerated() {
                    self.seatList.append(element.label)
                    if element.id == self.desk_id {
                        self.seatIndex = index
                    }
                }
                
                completion()
            
            } catch {
                serviceError(error.localizedDescription.description)
            
            }
            
            },serviceError: {(errorMessage:String) in
                serviceError(errorMessage)
        })
    }
}

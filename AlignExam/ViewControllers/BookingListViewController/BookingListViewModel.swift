//
//  BookingListViewModel.swift
//  AlignExam
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
class BookingListViewModel {
    var showAll = true
    var listItems = Array<BookingListItem>()
    var filterListItems = Array<BookingListItem>()
    
    func callBookingList(completion:@escaping () -> Void,
                         serviceError:@escaping (_ message:String) -> Void){
        callBookingListService(completion: {(response:Any) in
            let res = response as! Data
            //TODO: Move this to a class
            do {
                self.listItems.removeAll()
                let list = try JSONDecoder()
                    .decode([BookingListItem].self, from: res)
                
                self.listItems.append(contentsOf: list)
                self.getFilterList()
                completion()
            } catch {
                serviceError(error.localizedDescription.description)
                
            }
            
        },serviceError: {(errorMessage:String) in
            serviceError(errorMessage)
        })
    }
    
    func getFilterList(){
        
        self.filterListItems.removeAll()
        if showAll {
            filterListItems.append(contentsOf: listItems)
        }
        else{
            let userID = getLoggedInUserID()
            for obj in listItems {
                if obj.user_id == userID {
                    filterListItems.append(obj)
                }
            }
        }
    }
    
    func updateShowAll(value:Int){
        if  value == 0 {
            showAll = true
        }
        else{
            showAll = false
        }
        
        getFilterList()
    }
}



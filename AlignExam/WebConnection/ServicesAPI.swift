//
//  ServicesAPI.swift
//  AlignExam
//
//  Created by Joseph Chua on 17/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import Alamofire

//Registration Service Call
func callRegistrationService(parameter:[String:Any], completion: @escaping (_ response:Any) -> Void, serviceError:@escaping (_ message:String) -> Void){
    
    callService(urlString: GlobalConstants.BASE_URL + GlobalConstants.REGISTRATION_URL,
                method: .post,
                header: nil,
                parameter: parameter,
                completion: completion,
                serviceError: serviceError)
}

//Login Service Call
func callLoginService(parameter:[String:Any], completion: @escaping (_ response:Any) -> Void, serviceError:@escaping (_ message:String) -> Void){
    
    callService(urlString: GlobalConstants.BASE_URL + GlobalConstants.LOGIN_URL,
                method: .post,
                header: nil,
                parameter: parameter,
                completion: completion,
                serviceError: serviceError)
}

//Booking List Service Call
func callBookingListService(completion: @escaping (_ response:Any) -> Void, serviceError:@escaping (_ message:String) -> Void){
        
    callService(urlString: GlobalConstants.BASE_URL + GlobalConstants.BOOKING_URL,
                header: getTokenHeader(),
                parameter: nil,
                completion: completion,
                serviceError: serviceError)
}


//Booking List Service Call
func callAddBookingService(parameter:[String:Any],completion: @escaping (_ response:Any) -> Void, serviceError:@escaping (_ message:String) -> Void){
    
    callService(urlString: GlobalConstants.BASE_URL + GlobalConstants.BOOKING_URL,
                method: .post,
                header: getTokenHeader(),
                parameter: parameter,
                completion: completion,
                serviceError: serviceError)
}


//Booking List Service Call
func callUpdateBookingService(id:Int,parameter:[String:Any],completion: @escaping (_ response:Any) -> Void, serviceError:@escaping (_ message:String) -> Void){
    
    callService(urlString: getEditBookingURL(bookingID: id),
                method: .put,
                header: getTokenHeader(),
                parameter: parameter,
                completion: completion,
                serviceError: serviceError)
}

//Get Desk Service Call
func callGetDeskService(completion: @escaping (_ response:Any) -> Void, serviceError:@escaping (_ message:String) -> Void){
    
    callService(urlString: GlobalConstants.BASE_URL + GlobalConstants.DESK_URL,
                header: getTokenHeader(),
                parameter: nil,
                completion: completion,
                serviceError: serviceError)
}

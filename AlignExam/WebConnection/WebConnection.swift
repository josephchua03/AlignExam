//
//  WebConnection.swift
//  AlignExam
//
//  Created by Joseph Chua on 17/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import Alamofire

func setAsMock(isMock:Bool){
    UserDefaults.standard.set(isMock, forKey: GlobalConstants.ISMOCK)
    UserDefaults.standard.synchronize()
}

func isMock() -> Bool {
    return UserDefaults.standard.bool(forKey: GlobalConstants.ISMOCK)
}

func isConnectedToInternet() ->Bool {
    return NetworkReachabilityManager()!.isReachable
}

func getEditBookingURL(bookingID:Int) -> String{
    return GlobalConstants.BASE_URL + "/bookings/" + String(bookingID) + ".json"
}

func callService(urlString:String,
                 method:HTTPMethod = .get,
                 header:HTTPHeaders?,
                 parameter:[String:Any]?,
                 completion: @escaping (_ response:Any) -> Void,
                 serviceError:@escaping (_ message:String) -> Void){
    
    if isMock() {
        completion(getMockData(fileName: urlString.getMockPathName()))
    }
    else if isConnectedToInternet() {
        
        AF.request(urlString,
                   method: method,
                   parameters:parameter,
                   headers:header)
            .responseData { (resData) -> Void in
                
                guard let result = resData.result.value else {
                    serviceError("No Response".localized());
                    return }
                guard let strOutput = String(data : result, encoding : String.Encoding.utf8) else {
                    serviceError("Web Service Error".localized());
                    return
                }
                if strOutput.contains("error"){
                    serviceError(strOutput.cleanJSONStringError())
                }else{
                    completion(strOutput.data(using: .utf8) ?? Data())
                }
                print(result)
        }
    }
    else{
        serviceError("No Internet Connection".localized());
    }
    
}

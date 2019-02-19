//
//  LoginViewModel.swift
//  AlignExam
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import Alamofire

struct LoginViewModel {
    
    var email = ""
    var password = ""
    
    //TODO: Need to update for Observable validation
    func validate() -> String{
        var errorMsg = checkEmail(email: self.email)
        if errorMsg.isEmpty {
            errorMsg = checkPassword(password: self.password)
        }
        return errorMsg
    }
    
    func getParameters() -> [String:Any]{
        return ["user[email]":self.email,
                "user[password]":self.password]
    }
    
    func callLogin(completeLogin:@escaping () -> Void,
                   serviceError:@escaping (_ message:String) -> Void){
        let errorMsg = validate()
        if errorMsg.isEmpty {
            callLoginService(parameter: getParameters(), completion: {(response:Any) in
                let res = response as! Data
                //TODO: Move this to a class
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(LoginResponse.self, from: res)
                    saveTokenHeader(email: response.email, token: response.authentication_token)
                    saveUserID(userID: response.id)
                    completeLogin()
                    
                } catch {
                    serviceError(error.localizedDescription.description)
                    
                }
                
            },serviceError: {(errorMessage:String) in
                serviceError(errorMessage)
            })
        }
        else{
            serviceError(errorMsg)
        }
        
    }
    
}

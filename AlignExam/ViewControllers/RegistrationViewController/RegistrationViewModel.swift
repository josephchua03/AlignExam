//
//  RegistrationViewModel.swift
//  AlignExam
//
//  Created by Joseph Chua on 17/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation

struct RegistrationViewModel {
    
    var email = ""
    var password = ""
    var passwordConfirm = ""
    
    //TODO: Need to update for Observable validation
    func validate() -> String{
        var errorMessage = checkEmail(email: email)
        if errorMessage.isEmpty {
             errorMessage = checkConfirmPassword(password: password, confirmPassword: passwordConfirm)
        }
       return errorMessage
        
    }
    
    func getParameters() -> [String:Any] {
        return ["user[email]":self.email,
                "user[password]":self.password,
                "user[password_confirmation]":self.passwordConfirm]
    }
    
    func callRegister(completion:@escaping (_ title:String,_ message:String) -> Void){
        let errorMsg = validate()
        if errorMsg.isEmpty {
            callRegistrationService(parameter: getParameters(),completion: {_ in
                completion("Message".localized(),"Successfully Registered".localized())
            },serviceError: {(message:String) in
                completion("Error".localized(),message)
            })
        }
        else{
            completion("Error".localized(),errorMsg)
        }
        
    }
}

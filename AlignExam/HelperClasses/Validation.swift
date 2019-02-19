//
//  Validation.swift
//  AlignExam
//
//  Created by Joseph Chua on 17/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation

func checkEmail(email:String) -> String {
    if email.count == 0 {
        return "Email cannot be empty".localized()
    }
    
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    if !emailTest.evaluate(with: email) {
        return "Email not valid".localized()
    }
    
    return ""
}

func checkPassword(password:String) -> String{
    if password.count == 0 {
        return "Password cannot be empty".localized()
    }
    else if password.count < 6 {
        return "Password must contain a minimum of 6 characters".localized()
    }
    return ""
}

func checkConfirmPassword(password:String,confirmPassword:String) -> String{
    
    let errorMessage = checkPassword(password: password)
    if !errorMessage.isEmpty {
        return errorMessage
    }
    else if confirmPassword.count == 0 {
        return "Confirm Password cannot be empty".localized()
    }
    else if password != confirmPassword {
        return "Password does not match".localized()
    }
    
    return errorMessage
    
}

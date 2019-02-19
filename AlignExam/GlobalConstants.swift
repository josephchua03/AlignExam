//
//  GlobalConstant.swift
//  AlignExam
//
//  Created by Joseph Chua on 17/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation

enum GlobalConstants {
    static let BASE_URL = "http://apac-ar-test.herokuapp.com"
    
    //URL PATH
    static let REGISTRATION_URL = "/users.json"
    static let LOGIN_URL = "/users/sign_in.json"
    static let BOOKING_URL = "/bookings.json"
    static let DESK_URL = "/desks.json"
    
    // KEYS
    static let EMAIL_KEY = "EMAIL_KEY"
    static let TOKEN_KEY = "TOKEN_KEY"
    static let USER_ID = "USER_ID"
    static let ISMOCK = "ISMOCK"
    
    //Constant Variables
    static let TABLECELLHEIGHT = 100.0
    static let TABLECELLHEIGHTOWNBOOKING = 145.0
    
}

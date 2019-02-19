//
//  ResponseObject.swift
//  AlignExam
//
//  Created by Joseph Chua on 19/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation

struct LoginResponse: Codable{
    var id: Int
    var email: String
    var authentication_token: String
    var created_at: String
    var updated_at: String
    
}

struct BookingListItem : Codable {
    var id = 0
    var user_id = 0
    var desk_id = 0
    var created_at = ""
    var updated_at = ""
    var url = ""
    
}

struct DeskItem : Codable{
    var id = 0
    var created_at = ""
    var updated_at = ""
    var url = ""
    var label = ""
    var location = ""
}

struct User : Codable {
    var id = 0
    var created_at = ""
    var updated_at = ""
    var email = ""
    var authentication_token = ""
}

struct BookResponse : Codable {
    var id = 0
    var user_id = 0
    var desk_id = 0
    var created_at = ""
    var updated_at = ""
    var booked_at = ""
    var booked_from = ""
    var booked_to = ""
    
}

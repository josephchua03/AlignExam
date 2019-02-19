//
//  Extensions.swift
//  AlignExam
//
//  Created by Joseph Chua on 17/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
    func cleanJSONStringError() -> String {
        var string = self.trimmingCharacters(in: .newlines)
        string = string.replacingOccurrences(of: "[\\[\\]\":{}()]", with: "", options: .regularExpression, range: nil)
        return string
        
    }
    
    func getMockPathName() -> String{
        let string = self.dropFirst( GlobalConstants.BASE_URL.count).dropLast(".json".count)
        if let match = string.range(of: "[^/]+(?=/$|$)", options: .regularExpression) {
            return String("mock" + string[match])
        }
        
        return self
    }
    
    func getFormatDateFromString() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let valueDate = formatter.date(from: self){
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter.string(from: valueDate)
        } else {
            return self
        }
        
    }
    
    func getFormatDateFromStringForSubmit() -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        if let valueDate = formatter.date(from: self){
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
            return formatter.string(from: valueDate)
        } else {
            return self
        }
        
    }

}

extension UITextField {
    func addDone(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(endEditing(_:)))
        toolbar.setItems([doneButton], animated: false)
        self.inputAccessoryView = toolbar
    }
}

//
//  BookingDetailViewControllerDatePicker.swift
//  AlignExam
//
//  Created by Joseph Chua on 20/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UIKit
extension BookingDetailViewController {
    
    func setupDatePicker(textField:UITextField,datePicker:UIDatePicker){
        datePicker.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        
        textField.inputAccessoryView = toolbar
        textField.inputView = datePicker
        
    }
    
    @objc func donedatePicker(){
        dateFromTextField.text = formatStringFromDate(date:datePickerFrom.date)
        dateToTextField.text = formatStringFromDate(date:datePickerTo.date)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
}

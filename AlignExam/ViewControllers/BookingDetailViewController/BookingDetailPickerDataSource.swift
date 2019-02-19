//
//  BookingDetailPickerDataSource.swift
//  AlignExam
//
//  Created by Joseph Chua on 19/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UIKit
extension BookingDetailViewController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.seatList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.seatList[row]
    }
    
}


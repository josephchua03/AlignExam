//
//  BookingDetailDelegate.swift
//  AlignExam
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

extension BookingDetailViewController : UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //displaying the ios local notification when app is in foreground
        completionHandler([.alert, .badge, .sound])
    }
   
}

//MARK: PICKER VIEW DELEGATE
extension BookingDetailViewController : UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.seatIndex = row
    }
}

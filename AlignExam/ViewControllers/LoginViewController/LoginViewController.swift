//
//  LoginViewController.swift
//  AlignExam
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class LoginViewController: UIViewController , UNUserNotificationCenterDelegate{
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //requesting for authorization
        UNUserNotificationCenter.current().requestAuthorization(
            options: [.alert, .sound, .badge],
            completionHandler: {didAllow, error in
                if !didAllow {
                    displayAlertMessage(vc: self, alertTitle: "Message".localized(), alertMessage: "You have opted to not receive any notifications".localized())
                }
        })
        emailTextField.addDone()
        passwordTextField.addDone()
        
        setAsMock(isMock: true)
    }
    
    //TODO: Need to update for Observable
    private func bindValues(){
        viewModel.email = emailTextField.text ?? ""
        viewModel.password = passwordTextField.text ?? ""
    }
    
    @IBAction func loginClick(_ sender: Any) {
        showLoading()
        bindValues()
        viewModel.callLogin(completeLogin: {() in
            hideLoading()
            let bookingListViewController = getViewController(viewControllerIdentifier: "BookingListViewController") as! BookingListViewController
            self.navigationController?.pushViewController(bookingListViewController, animated: true)
        }
        , serviceError: {(_ message:String) in
            hideLoading()
            displayAlertMessage(vc: self, alertTitle: "Error".localized(), alertMessage: message)
        })
    }
}

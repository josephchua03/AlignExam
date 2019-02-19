//
//  RegistrationViewController.swift
//  AlignExam
//
//  Created by Joseph Chua on 17/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    private var viewModel = RegistrationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.addDone()
        passwordTextField.addDone()
        confirmPasswordTextField.addDone()
    }
    
    //TODO: Need to update for Observable
    private func bindValues(){
        viewModel.email = emailTextField.text ?? ""
        viewModel.password = passwordTextField.text ?? ""
        viewModel.passwordConfirm = confirmPasswordTextField.text ?? ""
    }
    
    @IBAction func registerClick(_ sender: Any) {
        bindValues()
        showLoading()
        self.viewModel.callRegister(completion: {(title:String,message:String) in
            displayAlertMessage(vc: self,alertTitle: title,alertMessage: message)
            hideLoading()
        })
        
    }
}

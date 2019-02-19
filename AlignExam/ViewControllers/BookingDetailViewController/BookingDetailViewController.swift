//
//  BookingDetailViewController.swift
//  AlignExam
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UIKit

class BookingDetailViewController: UIViewController {
    
    var viewModel = BookingDetailViewModel()
    var delegate:BookingDetailViewControllerDelegate?
    
    @IBOutlet weak var seatPickerView: UIPickerView!
    @IBOutlet weak var dateFromTextField: UITextField!
    @IBOutlet weak var dateToTextField: UITextField!
    @IBOutlet weak var addOrUpdateButton: UIButton!
    
    let datePickerTo = UIDatePicker()
    let datePickerFrom = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !viewModel.isNewBooking {
            addOrUpdateButton.setTitle("Update".localized(), for: .normal)
        }
        
        setup()
    }
    
    func setup(){
        showLoading()
        viewModel.callGetDesk(completion: {
            hideLoading()
            self.seatPickerView.reloadAllComponents()
            self.seatPickerView.selectRow(self.viewModel.seatIndex, inComponent: 0, animated: true)
        }, serviceError: { (errorMessage:String) in
            displayAlertMessage(vc: self,alertTitle: "Error".localized() ,alertMessage: errorMessage)
            hideLoading()
        })
        
        datePickerFrom.date = Date()
        datePickerTo.date = Date().addingTimeInterval(60*60*24)
        setupDatePicker(textField: dateFromTextField, datePicker: datePickerFrom)
        setupDatePicker(textField: dateToTextField, datePicker: datePickerTo)
        dateFromTextField.text = formatStringFromDate(date: datePickerFrom.date)
        dateToTextField.text = formatStringFromDate(date: datePickerTo.date)
    }
    
    //TODO: Need to update for Observable
    func bindValues(){
        viewModel.dateStart = dateFromTextField.text ?? ""
        viewModel.dateEnd = dateToTextField.text ?? ""
    }
    
    @IBAction func buttonClick(_ sender: Any) {
        showLoading()
        bindValues()
        viewModel.callAddOrUpdate(completion: {
            hideLoading()
            displayAlertMessage(vc: self, alertTitle: "Message".localized(), alertMessage: "Your booking has been saved".localized(),handler:{ action in
                self.navigationController?.popViewController(animated: true)
            })
            callNotification(vc: self, notifTitle: "Message".localized(), notifMessage: "Your booking has passed".localized(),time:self.datePickerTo.date.timeIntervalSince(Date()))
            
        }, serviceError: { (errorMsg:String) in
            hideLoading()
            displayAlertMessage(vc: self, alertTitle: "Error".localized(), alertMessage: errorMsg)
        })
        
    }
    
}

protocol BookingDetailViewControllerDelegate
{
    func BookingDetailViewControllerDelegateDidUpdate(bookingDetailViewController:BookingDetailViewController)
}

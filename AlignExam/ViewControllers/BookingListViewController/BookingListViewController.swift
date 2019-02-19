//
//  BookingListViewController.swift
//  AlignExam
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UIKit
class BookingListViewController: UIViewController {
    
    @IBOutlet weak var tableViewBooking: UITableView!
    @IBOutlet weak var segmentControlSelector: UISegmentedControl!
    var viewModel = BookingListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshTableData()
    }
    
    //TODO: Need to update for Observable
    func bindValues(){
       
    }
   
    func refreshTableData(){
        showLoading()
        viewModel.callBookingList(completion: {() in
            hideLoading()
            self.tableViewBooking.reloadData()
        }
            , serviceError: {(_ message:String) in
                hideLoading()
                displayAlertMessage(vc: self, alertTitle: "Error".localized(), alertMessage: message)
        })
    }
    
    @IBAction func logoutClick(_ sender: Any) {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    @IBAction func addNewBooking(_ sender: Any) {
        let bookingDetailViewController = getViewController(viewControllerIdentifier: "BookingDetailViewController") as! BookingDetailViewController
        bookingDetailViewController.delegate = self
        bookingDetailViewController.viewModel.isNewBooking = true
        self.navigationController?.pushViewController(bookingDetailViewController, animated: true)
    }
    
    @IBAction func segmentBookingChanged(_ sender: Any) {
        viewModel.updateShowAll(value: segmentControlSelector.selectedSegmentIndex)
        tableViewBooking.reloadData()
    }
}

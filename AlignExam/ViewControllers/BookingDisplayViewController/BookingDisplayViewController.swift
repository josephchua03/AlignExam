//
//  BookingDetailViewController.swift
//  AlignExam
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UIKit

class BookingDisplayViewController: UIViewController {
    
    var viewModel = BookingDisplayViewModel()
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seatLabel: UILabel!
    @IBOutlet weak var dateFromLabel: UILabel!
    @IBOutlet weak var dateToLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindValues()
    }
    
    //TODO: Need to update for Observable
    func bindValues(){
        dateFromLabel.text = viewModel.dateStart
        dateToLabel.text = viewModel.dateEnd
        seatLabel.text = viewModel.seat
        nameLabel.text = viewModel.name
        
    }
    
}

//
//  BookingListCell.swift
//  AlignExam
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UIKit
class BookingListCell: UITableViewCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deskLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    var delegate:BookingListCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    @IBAction func editClick(_ sender: Any) {
        delegate?.BookingListCellDidEdit(cell: self)
    }
}
protocol BookingListCellDelegate
{
    func BookingListCellDidEdit(cell:BookingListCell)
    func BookingListCellDidCancel(cell:BookingListCell)
}



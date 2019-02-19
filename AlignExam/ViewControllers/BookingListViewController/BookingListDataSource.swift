//
//  BookingListDataSource.swift
//  AlignExam
//
//  Created by Joseph Chua on 18/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import UIKit
extension BookingListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filterListItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "BookingListCell", for: indexPath) as! BookingListCell
        cell.delegate = self
        let values = viewModel.filterListItems[indexPath.row]
        cell.nameLabel.text = "User ID - " + String(values.id)
        cell.dateLabel.text = values.created_at.getFormatDateFromString() + " - " + values.updated_at.getFormatDateFromString()
        cell.deskLabel.text = "Desk ID - " + String(values.desk_id)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(segmentControlSelector.selectedSegmentIndex == 0 ? GlobalConstants.TABLECELLHEIGHT:GlobalConstants.TABLECELLHEIGHTOWNBOOKING)
    }
}

//MARK: TABlEVIEW DELEGATE
extension BookingListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let values = viewModel.filterListItems[indexPath.row]
        let bookingDisplayViewController = getViewController(viewControllerIdentifier: "BookingDisplayViewController") as! BookingDisplayViewController
        bookingDisplayViewController.viewModel.dateStart = values.created_at.getFormatDateFromString()
        bookingDisplayViewController.viewModel.dateEnd = values.updated_at.getFormatDateFromString()
        bookingDisplayViewController.viewModel.seat = "Desk ID - " + String(values.desk_id)
        bookingDisplayViewController.viewModel.name = "John Doe - " + String(values.id)
        self.navigationController?.pushViewController(bookingDisplayViewController, animated: true)
    }
    
}

//MARK: BOOKING DETAILS DELEGATE
extension BookingListViewController: BookingDetailViewControllerDelegate{
    func BookingDetailViewControllerDelegateDidUpdate(bookingDetailViewController: BookingDetailViewController) {
        refreshTableData()
    }
}

//MARK: BOOKING CELL DELEGATE
extension BookingListViewController:BookingListCellDelegate{
    func BookingListCellDidEdit(cell: BookingListCell) {
        
        let index = tableViewBooking.indexPath(for: cell)
        let values = viewModel.filterListItems[index?.row ?? 0]
        
        let bookingDetailViewController = getViewController(viewControllerIdentifier: "BookingDetailViewController") as! BookingDetailViewController
        bookingDetailViewController.delegate = self
        bookingDetailViewController.viewModel.isNewBooking = false
        bookingDetailViewController.viewModel.desk_id = values.desk_id
        bookingDetailViewController.viewModel.id = values.id
        bookingDetailViewController.viewModel.dateStart =  String(values.created_at)
        bookingDetailViewController.viewModel.dateEnd = String(values.updated_at)
        self.navigationController?.pushViewController(bookingDetailViewController, animated: true)
        
    }
    
    func BookingListCellDidCancel(cell: BookingListCell) {
        //TODO:NO SERVICE PROVIDED
    }
    
}

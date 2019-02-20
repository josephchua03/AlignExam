//
//  HelperClass.swift
//  AlignExam
//
//  Created by Joseph Chua on 17/2/19.
//  Copyright © 2019 Joseph Chua. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
import SVProgressHUD
import Alamofire

//MARK: Alert Message
func displayAlertMessage(vc:UIViewController,alertTitle:String, alertMessage:String, handler:((UIAlertAction) -> Void)? = nil){
    let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
    vc.present(alert, animated: true, completion: nil)
}

//MARK: Token Header
func saveTokenHeader(email:String, token:String){
    UserDefaults.standard.set(email, forKey: GlobalConstants.EMAIL_KEY)
    UserDefaults.standard.set(token, forKey: GlobalConstants.TOKEN_KEY)
    UserDefaults.standard.synchronize()
}

//MARK: USER ID
func saveUserID(userID:Int){
    UserDefaults.standard.set(userID, forKey: GlobalConstants.USER_ID)
    UserDefaults.standard.synchronize()
}

func getLoggedInUserID() -> Int{
    return UserDefaults.standard.integer(forKey: GlobalConstants.USER_ID)
}

func getTokenHeader() -> HTTPHeaders{
     let headers: HTTPHeaders =  ["X-User-Email":
            UserDefaults.standard.string(forKey: GlobalConstants.EMAIL_KEY) ?? "",
            "X-User-Token":
            UserDefaults.standard.string(forKey: GlobalConstants.TOKEN_KEY) ?? ""]
    return headers
}

func clearAllToken(){
    UserDefaults.standard.removeObject(forKey: GlobalConstants.EMAIL_KEY)
    UserDefaults.standard.removeObject(forKey: GlobalConstants.TOKEN_KEY)
    UserDefaults.standard.removeObject(forKey: GlobalConstants.USER_ID)
    UserDefaults.standard.synchronize()
    
}

//MARK: Loading Functions
func showLoading(){
    SVProgressHUD.setDefaultMaskType(.black)
    SVProgressHUD.show(withStatus: "Loading".localized())
}

func hideLoading(){
    SVProgressHUD.dismiss()
}

//MARK: Notifications
func callNotification(vc:UNUserNotificationCenterDelegate,
                      notifTitle:String,
                      notifMessage:String,
                        time:Double){
    
    let content = UNMutableNotificationContent()
    content.title = notifTitle
    content.body = notifMessage
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
    let request = UNNotificationRequest(identifier: "AlignExamNotification", content: content, trigger: trigger)
    UNUserNotificationCenter.current().delegate = vc
    UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    
}

//MARK: GET VIEW CONTROLLER
func getViewController(viewControllerIdentifier:String) -> Any{
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    return storyBoard.instantiateViewController(withIdentifier: viewControllerIdentifier)
    
}

//MARK: FORMAT DATE
func formatStringFromDate(date:Date) -> String{
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    return  formatter.string(from: date)
    
}

//MARK: GET MOCK DATA
func getMockData(fileName:String) -> Data{
    if let path = Bundle.main.path(forResource: fileName, ofType: "json")
    {
        do{
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            return jsonData
        }
        catch{
            
        }
    }
    return Data()
}

//
//  Proxy.swift
//   DigiImpact
//
//  Created by desh raj thakur on 28/05/20.
//  Copyright © 2020 Desh Raj Thakur. All rights reserved.
//

import AVKit
import Alamofire
import AVFoundation

import Foundation

let KAppDelegate = UIApplication.shared.delegate as! AppDelegate
let storyboardMainObj = UIStoryboard(name: "Main", bundle: nil)
let storyboardViewerObj = UIStoryboard(name: "ViewerHome", bundle: nil)
let storyboardCreatorObj = UIStoryboard(name: "CreatorScreen", bundle: nil)

let mustredColor = UIColor(red: 212/255, green: 175/255, blue: 55/255, alpha: 1.0)

let Defaults = UserDefaults.standard
let userdataObj = UserInfo()
//let jobDetailsObj = JobDetailsDetails()

class Proxy {
    static var shared: Proxy {
        return Proxy()
    }
    fileprivate init(){}
    
    //MARK:- Check Valid Email Method
    func isValidEmail(_ testStr:String) -> Bool  {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        return (testStr.range(of: emailRegEx, options:.regularExpression) != nil)
    }
//    func setLangage(){
//        if selectedLanguage == true{
//            Bundle.setLanguage("en")
//        }else{
//            Bundle.setLanguage("es")
//        }
//    }
    //MARK:- Check Valid Password Method
    func isValidPassword(_ testStr:String) -> Bool {
        let capitalLetterRegEx  = ".*[A-Za-z]+.*"
        let texttest = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        let capitalresult = texttest.evaluate(with: testStr)
        
        let numberRegEx  = ".*[0-9]+.*"
        let texttest1 = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let numberresult = texttest1.evaluate(with: testStr)
        
        let specialCharacterRegEx  = ".*[!&^%$#@()*/]+.*"
        let texttest2 = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegEx)
        let specialresult = texttest2.evaluate(with: testStr)
        
        let eightRegEx  = ".{8,}"
        let texttest3 = NSPredicate(format:"SELF MATCHES %@", eightRegEx)
        let eightresult = texttest3.evaluate(with: testStr)
        return  specialresult && capitalresult && numberresult && eightresult
    }
    //MARK:- Check Valid Name Method
    func isValidInput(_ Input:String) -> Bool {
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ")
        if Input.rangeOfCharacter(from: characterset.inverted) != nil {
            return false
        } else {
            return true
        }
    }
    //MARK:--> Set Attribute String
    //    func attributeSetString(textString: String, fontString: String) -> NSAttributedString{
    //        let myMutableString = NSMutableAttributedString(string: textString , attributes: [NSAttributedString.Key.font:UIFont(name: FontString.SFProDisplay, size: 20.0)!])
    //        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location:0,length: myMutableString.length))
    //        return myMutableString
    //    }
    
    //MARK:--> TIME ZONE
    func getCurrentTimeZone() -> String{
        return TimeZone.current.identifier
    }
    //MARK:-> Dates Conversion
    let gregorian_calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)! as Calendar
    let server_dt_format = "yyyyMMddHHmmss"
    let serverDateFormat = "yyyy-MM-dd"
    // let serverForgotDateFormat = "yyyyMMdd HHmmss"
    func DateToString(Formatter:String, date:Date) -> String
    {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = Formatter
        dateformatter.locale = Locale(identifier: "en_US")
        dateformatter.calendar = gregorian_calendar
        let convertedString = dateformatter.string(from: date)
        return convertedString
    }
    
    func currentDateTime() -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm" //Specify your format that you want
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
    func fromDateToString(dt: Date) -> String{
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myString = formatter.string(from: dt) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "MM/dd/yy h:mm a"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        print(myStringafd)
        return myStringafd
    }
    
    func convertToString(str :String) -> String{
        let formatter = Foundation.DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'" //2017-04-01T18:05:00.000
        let date1  = formatter.date(from: str)
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let resultTime = formatter.string(from: date1!)
        return resultTime
    }
    
    
    func StringToConvertedStringDate(strDate:String, strDateFormat:String, strRequiredFormat:String) -> String{
        let dateformatter = DateFormatter()
        dateformatter.calendar = gregorian_calendar
        dateformatter.locale = Locale(identifier: "en_US")
        dateformatter.dateFormat = strDateFormat
        guard let convertedDate = dateformatter.date(from: strDate) else {
            return ""
        }
        dateformatter.dateFormat = strRequiredFormat
        let convertedString = dateformatter.string(from: convertedDate)
        return convertedString
    }
    func StringToDate(Formatter : String,strDate : String) -> Date{
        let dateformatter = DateFormatter()
        dateformatter.calendar = gregorian_calendar
        dateformatter.locale = Locale(identifier: "en_US")
        dateformatter.dateFormat = Formatter
        guard let convertedDate = dateformatter.date(from: strDate) else {
            let str = dateformatter.string(from: Date())
            return dateformatter.date(from: str)!
        }
        return convertedDate
    }
    //MARK:- Display Toast
    func displayStatusCodeAlert(_ userMessage: String) {
        let alert = UIAlertController(title: "ForRenters", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    //MARK:--> NAVIGATION
    func pushNaviagtion(stryboard:UIStoryboard, identifier:String, isAnimate:Bool , currentViewController: UIViewController) {
        let pushControllerObj = stryboard.instantiateViewController(withIdentifier: identifier)
        pushControllerObj.hidesBottomBarWhenPushed = true
        currentViewController.navigationController?.pushViewController(pushControllerObj, animated: isAnimate)
    }
    func pushNaviagtionHideBottomBar(stryboard:UIStoryboard, identifier:String, isAnimate:Bool , currentViewController: UIViewController) {
        let pushControllerObj = stryboard.instantiateViewController(withIdentifier: identifier)
        pushControllerObj.hidesBottomBarWhenPushed = true
        currentViewController.navigationController?.pushViewController(pushControllerObj, animated: isAnimate)
    }
    func popNaviagtion(isAnimate:Bool , currentViewController: UIViewController) {
        currentViewController.navigationController?.popViewController(animated: isAnimate)
    }
    //MARK:- Open Setting Of App
    func openSettingApp() {
        let settingAlert = UIAlertController(title: AppAlerts.titleValue.connectionProblem, message: AppAlerts.titleValue.checkInternet, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: AppAlerts.titleValue.cancel, style: UIAlertAction.Style.default, handler: nil)
        settingAlert.addAction(okAction)
        let openSetting = UIAlertAction(title: AppAlerts.titleValue.setting, style:UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
            let url:URL = URL(string: UIApplication.openSettingsURLString)!
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: {
                    (success) in })
            } else {
                guard UIApplication.shared.openURL(url) else {
                    Proxy.shared.displayStatusCodeAlert(AppAlerts.titleValue.pleaseReviewyournetworksettings)
                    return
                }
            }
        })
        settingAlert.addAction(openSetting)
        UIApplication.shared.keyWindow?.rootViewController?.present(settingAlert, animated: true, completion: nil)
    }
}

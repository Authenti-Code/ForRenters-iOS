//
//  Constant.swift
//  ForRenters
//
//  Created by Authenticode on 29/03/22.
//

import Foundation
import UIKit
enum constants {
    static let password = "Please set minimum 8 character password"
    static let phone = "Please enter minimum 8 character phone number!"
    static let enterOTP = "Enter OTP for verify."
    static let  Otpverify = " OTP verified successfully"
    static let errorOtp = "Your Otp Does Not match"
    static let galleryCam = "Please Select an Option"
    static let userImage = "Please select user image"
    static let details = "Please enter detail"
    static let userLibrary = "Choose From Library"
    static let userCamera = "Take A Photo"
    static let mail = "Enter your email"
    static let otpError = "Please enter correct OTP."
    static let otpVerify = "Enter OTP for verify."
    static let selectCountryCode = "Please select country code"
    static let currentPassword = "Please Enter valid Password "
    static let newpassword         =  "Please enter new password"
    static let confirmPassword     =  "Please enter confirm password"
    static let changePassword     =  "Password Updated successfully"
    static let  Pmismatched    =  " Password Mismatched"
    static let  sendOtp    =  "OTP sent successfully"
    static let strongPassword =   "Your password must be at least 8 characters and contain at least 1 number and 1 capital letter."
}
//MARK:- App Header
func headers() ->  [String:String] {
    let header = [
        "Authorization":"Bearer \(accessToken)",
        "Accept":"application/json"
    ]
    return header
}
extension UIColor {
    static var unselectColor: UIColor {
        return UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1.0)
    }
        static var selectColor: UIColor {
            return UIColor(red: 43/255, green: 43/255, blue: 43/255, alpha: 1.0)
        }
    }
var groupAry = ["Landlord","Neighborhood","Leasing Agreement","Energy Efficiency","Condition of Home"]
enum SignUp {
    struct Request {
        var firstname: String?,
            lastName: String?,
            email: String?,
            phone:String?,
            password:String?,
            confirmPassword:String?
    }
}
// Declaration latitude Value
var latitudValue:String {
    get {
        UserDefaults.standard.value(forKey:"latitude") as? String ?? ""
    }
    set {
        UserDefaults.standard.setValue(newValue, forKey:"latitude")
    }
}
// Declaration longitude Value
var longitudeValue:String {
    get {
        UserDefaults.standard.value(forKey:"longitude") as? String ?? ""
    }
    set {
        UserDefaults.standard.setValue(newValue, forKey:"longitude")
    }
}
// Declaration accesstoken
var accessToken: String{
    get {
        return UserDefaults.standard.value(forKey: "accessToken") as? String ?? ""
    }
    set {
        UserDefaults.standard.setValue(newValue, forKey:"accessToken")
    }
}
var Signup_step: String?{
    get {
        return UserDefaults.standard.value(forKey: "Signup_step") as? String? ?? ""
    }
    set {
        UserDefaults.standard.setValue(newValue, forKey:"Signup_step")
    }
}
var ProfileImg: String?{
    get {
        return UserDefaults.standard.value(forKey: "ProfileImg") as? String? ?? ""
    }
    set {
        UserDefaults.standard.setValue(newValue, forKey:"ProfileImg")
    }
}



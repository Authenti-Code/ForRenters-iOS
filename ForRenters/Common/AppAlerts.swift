//
//  AppAlerts.swift
//  ForRenters
//
//  Created by Pankush Mehra on 24/05/22.

import UIKit

class AppAlerts {
    static var titleValue: AppAlerts {
        return AppAlerts()
    }
    fileprivate init(){}
    
    //MARK:- App Common Titles
    var cancel = "Cancel"
    var connectionProblem = "Connection Problem"
    var setting = "Setting"
    var error   = "Error!"
    
    //MARK:- App Common Alerts
    //    var errorMessage = "Please Review your network settings"
    var pleaseReviewyournetworksettings = "Please Review your network settings"
    var checkInternet       = "Please check your internet connection"
    var ErrorUnabletoencodeJSONResponse = "Error: Unable to encode JSON Response"
    var serverError         = "Server error, Please try again.."
    var serverNotResponding = "Server not responding"
    var strongPassword      = "Your password must be at least 8 characters and contain at least 1 number and 1 capital letter."
    var passworderror       = "Please set minimum 8 character password"
    var userError           = "User not found"
    var addContext          = "Please enter context"
    var addRelationship     = "Please enter relation"
    var relationSuccess     = "Relation added success"
    var contextSuccess      = "Context added success"
    
    var otp                 = "OTP not valid"
    var otpSend             = "OTP has been send to your phone number"
    var UpdateProfile       = "Profile Updated Successfully"
    var updatebio           = "Bio Updated Successfully"
    var usernameMail        = "Please enter your email"
    var oldPassword         = "Please enter old password"
    var password            = "Please enter password"
    var hey                 = "Interest shown successfully"
    var alreadyhey          = "You have already shown the interest for this job"
    var newpassword         = "Please enter new password"
    var validName           = "Please enter valid name"
    var firstName           = "Please enter first name"
    var lastName            = "Please enter last name"
    var email               = "Please enter email"
    var scholarship         = "Please select scholarship"
    var internship          = "Please select internship"
    //var otpVerified       =  "OTP verified success"
    var phoneNumber         = "Please enter phone number"
    var countryCode         = "Please select country code"
    var phoneLimit          = "Phone number should be of 10 digits"
    var validPassword       = "Password should have minimum 8  characters ."
    var confirmPassword     = "Please enter confirm password"
    var occupation          = "Please enter occupation"
    var samePassword        = "Password does not match"
    var validEmail          = "Please enter valid email"
    var selectProfession    = "Please select profession"
    var logoutMessage       = "Are you sure you want to logout?"
    var intrestedCat        = "Please select at least one interest category"
    var country             = "Please Enter Country of residence"
    var passwordChange      = "Your password has been changed!"
    var organization        = "Please Enter organization"
    var currentPassword     = "Please Enter valid Password "
    var invalidEmail        = "The email has already been taken."
    var AddJob              = "Your Job Added successfully"
    var Discription         = "The post description field is required."
}
//API List
enum Apis {
    static let ServerUrl = "https://forrenters.authenticode.biz/api/"
    static let signup = "register"
    static let chooseSignUpStep = "signUpStep2"
    static let OtpVerification = "signUpStep3"
    static let logIn = "login"
    static let logOut =  "logout"
    static let ProfileDetail = "profileGet"
    static let UpdateProfile = "profileUpdate"
    static let changePassword = "change-password"
    static let aboutUs = "about-us"
    static let termCondition = "terms-condition"
    static let privacyPolicy = "privacy_policy"
    
}


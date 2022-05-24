//
//  ShadowExtension.swift
//  ForRenters
//
//  Created by Pankush Mehra on 24/05/22.
//

import Foundation
import UIKit
import QuartzCore
// MARK :-- extension for SignUp Text Field and View Shadow
extension SignUpVc{
    func addShadow(){
        // MARK :-- First Name View Shadow
        oFNameVw.layer.shadowColor = UIColor.red.cgColor
        oFNameVw.layer.shadowOpacity = 0.1
        oFNameVw.layer.shadowRadius = 3.0
        oFNameVw.layer.shadowOffset = .zero
        oFNameVw.layer.masksToBounds = false
        // MARK :-- Last NameView Shadow
        oLNameVw.layer.shadowColor = UIColor.red.cgColor
        oLNameVw.layer.shadowOpacity = 0.1
        oLNameVw.layer.shadowRadius = 3.0
        oLNameVw.layer.shadowOffset = .zero
        oLNameVw.layer.masksToBounds = false
        // MARK :-- Email View Shadow
        oEmailVw.layer.shadowColor = UIColor.red.cgColor
        oEmailVw.layer.shadowOpacity = 0.1
        oEmailVw.layer.shadowRadius = 3.0
        oEmailVw.layer.shadowOffset = .zero
        oEmailVw.layer.masksToBounds = false
        // MARK :-- Phone View Shadow
        oPhoneVw.layer.shadowColor = UIColor.red.cgColor
        oPhoneVw.layer.shadowOpacity = 0.1
        oPhoneVw.layer.shadowRadius = 3.0
        oPhoneVw.layer.shadowOffset = .zero
        oPhoneVw.layer.masksToBounds = false
        // MARK :-- Password View Shadow
        oPasswordVw.layer.shadowColor = UIColor.red.cgColor
        oPasswordVw.layer.shadowOpacity = 0.1
        oPasswordVw.layer.shadowRadius = 3.0
        oPasswordVw.layer.shadowOffset = .zero
        oPasswordVw.layer.masksToBounds = false
        // MARK :-- Confirm Password View Shadow
        oCPasswordVw.layer.shadowColor = UIColor.red.cgColor
        oCPasswordVw.layer.shadowOpacity = 0.1
        oCPasswordVw.layer.shadowRadius = 3.0
        oCPasswordVw.layer.shadowOffset = .zero
        oCPasswordVw.layer.masksToBounds = false
    }
}
// MARK :-- extension for OTP VerificationVc Text Field and View Shadow
extension OTPVerificationVc{
    func addShadow(){
        // MARK :-- oVw1 View Shadow
        oVw1.layer.shadowColor = UIColor.lightGray.cgColor
        oVw1.layer.shadowOpacity = 0.5
        oVw1.layer.shadowRadius = 2.5
        oVw1.layer.shadowOffset = .zero
        oVw1.layer.masksToBounds = false
        // MARK :-- oVw2 Shadow
        oVw2.layer.shadowColor = UIColor.lightGray.cgColor
        oVw2.layer.shadowOpacity = 0.5
        oVw2.layer.shadowRadius = 2.5
        oVw2.layer.shadowOffset = .zero
        oVw2.layer.masksToBounds = false
        // MARK :-- oVw3 View Shadow
        oVw3.layer.shadowColor = UIColor.lightGray.cgColor
        oVw3.layer.shadowOpacity = 0.5
        oVw3.layer.shadowRadius = 2.5
        oVw3.layer.shadowOffset = .zero
        oVw3.layer.masksToBounds = false
        // MARK :-- oVw4 View Shadow
        oVw4.layer.shadowColor = UIColor.lightGray.cgColor
        oVw4.layer.shadowOpacity = 0.5
        oVw4.layer.shadowRadius = 2.5
        oVw4.layer.shadowOffset = .zero
        oVw4.layer.masksToBounds = false
    }
}
// MARK :-- extension for LogIn Text Field and View Shadow
extension LogInVc{
    func addshadow(){
        // MARK :-- Email View Shadow
        oEmailVw.layer.shadowColor = UIColor.red.cgColor
        oEmailVw.layer.shadowOpacity = 0.1
        oEmailVw.layer.shadowRadius = 3.0
        oEmailVw.layer.shadowOffset = .zero
        oEmailVw.layer.masksToBounds = false
        // MARK :-- Password View Shadow
        oPasswordVw.layer.shadowColor = UIColor.red.cgColor
        oPasswordVw.layer.shadowOpacity = 0.1
        oPasswordVw.layer.shadowRadius = 3.0
        oPasswordVw.layer.shadowOffset = .zero
        oPasswordVw.layer.masksToBounds = false
        // MARK :-- Apple Button Shadow
        oAppleBtn.layer.shadowColor = UIColor.red.cgColor
        oAppleBtn.layer.shadowOpacity = 0.2
        oAppleBtn.layer.shadowRadius = 3.0
        oAppleBtn.layer.shadowOffset = .zero
        oAppleBtn.layer.masksToBounds = false
        // MARK :-- Google Button Shadow
        oGoogleBtn.layer.shadowColor = UIColor.red.cgColor
        oGoogleBtn.layer.shadowOpacity = 0.2
        oGoogleBtn.layer.shadowRadius = 3.0
        oGoogleBtn.layer.shadowOffset = .zero
        oGoogleBtn.layer.masksToBounds = false
        // MARK :-- LogIn Button Shadow
        oLogInBtn.layer.shadowColor = UIColor.red.cgColor
        oLogInBtn.layer.shadowOpacity = 0.4
        oLogInBtn.layer.shadowRadius = 3.0
        oLogInBtn.layer.shadowOffset = .zero
        oLogInBtn.layer.masksToBounds = false
    }
}
// MARK :-- extension for LogOutPopUp Text Field and View Shadow
extension LogoutPopUp{
    func addshadow(){
        // MARK :-- Confirm Password View Shadow
        oNoBtn.layer.shadowColor = UIColor.gray.cgColor
        oNoBtn.layer.shadowOpacity = 0.3
        oNoBtn.layer.shadowRadius = 4.0
        oNoBtn.layer.shadowOffset = .zero
        oNoBtn.layer.masksToBounds = false
        // MARK :-- Confirm Password View Shadow
        oYesBtn.layer.shadowColor = UIColor.gray.cgColor
        oYesBtn.layer.shadowOpacity = 0.3
        oYesBtn.layer.shadowRadius = 4.0
        oYesBtn.layer.shadowOffset = .zero
        oYesBtn.layer.masksToBounds = false
    }

}

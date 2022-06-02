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
// MARK :-- extension for OTP VerificationVc View Shadow
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
// MARK :-- extension for LogIn Button and View Shadow
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
// MARK :-- extension for LogOutPopUp Button Shadow
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
// MARK :-- extension for Profile Button and View Shadow
extension ProfileVc{
    func Addshadow(){
        oProfileVw.layer.shadowColor = UIColor.red.cgColor
        oProfileVw.layer.shadowOpacity = 0.1
        oProfileVw.layer.shadowRadius = 3.0
        oProfileVw.layer.shadowOffset = .zero
        oProfileVw.layer.masksToBounds = false
        // MARK :-- oPDetailVw View Shadow
        oPDetailVw.layer.shadowColor = UIColor.red.cgColor
        oPDetailVw.layer.shadowOpacity = 0.1
        oPDetailVw.layer.shadowRadius = 3.0
        oPDetailVw.layer.shadowOffset = .zero
        oPDetailVw.layer.masksToBounds = false
    }
}
// MARK :-- extension Edit Profile Text Field and View Shadow
extension EditProfileVc{
    func addShadow(){
        // MARK :-- First Name View Shadow
        oProfileVw.layer.shadowColor = UIColor.red.cgColor
        oProfileVw.layer.shadowOpacity = 0.1
        oProfileVw.layer.shadowRadius = 3.0
        oProfileVw.layer.shadowOffset = .zero
        oProfileVw.layer.masksToBounds = false
        // MARK :-- Last NameView Shadow
        oDetailsVw.layer.shadowColor = UIColor.red.cgColor
        oDetailsVw.layer.shadowOpacity = 0.1
        oDetailsVw.layer.shadowRadius = 3.0
        oDetailsVw.layer.shadowOffset = .zero
        oDetailsVw.layer.masksToBounds = false
        // MARK :-- Email View Shadow
        oEmailVw.layer.shadowColor = UIColor.red.cgColor
        oEmailVw.layer.shadowOpacity = 3.0
        oEmailVw.layer.shadowRadius = 0.5
        oEmailVw.layer.shadowOffset = .zero
        oEmailVw.layer.masksToBounds = false
        // MARK :-- Phone View Shadow
        oPNumberVw.layer.shadowColor = UIColor.red.cgColor
        oPNumberVw.layer.shadowOpacity = 3.0
        oPNumberVw.layer.shadowRadius = 0.5
        oPNumberVw.layer.shadowOffset = .zero
        oPNumberVw.layer.masksToBounds = false
        // MARK :-- Password View Shadow
        oLNameVw.layer.shadowColor = UIColor.red.cgColor
        oLNameVw.layer.shadowOpacity = 3.0
        oLNameVw.layer.shadowRadius = 0.5
        oLNameVw.layer.shadowOffset = .zero
        oLNameVw.layer.masksToBounds = false
        // MARK :-- Confirm Password View Shadow
        oFNameVw.layer.shadowColor = UIColor.red.cgColor
        oFNameVw.layer.shadowOpacity = 3.0
        oFNameVw.layer.shadowRadius = 0.5
        oFNameVw.layer.shadowOffset = .zero
        oFNameVw.layer.masksToBounds = false
        // MARK :-- Confirm Password View Shadow
        oProfileUploadBtn.layer.shadowColor = UIColor.red.cgColor
        oProfileUploadBtn.layer.shadowOpacity = 0.3
        oProfileUploadBtn.layer.shadowRadius = 3.5
        oProfileUploadBtn.layer.shadowOffset = .zero
        oProfileUploadBtn.layer.masksToBounds = false
    }
}
// MARK :-- extension OverallRieviewVC View Shadow
extension OverallRieviewVC{
    func addShadow(){
        // MARK :-- ratingView View Shadow
        ratingView.layer.shadowColor = UIColor.red.cgColor
        ratingView.layer.shadowOpacity = 0.4
        ratingView.layer.shadowRadius = 5.0
        ratingView.layer.shadowOffset = .zero
        ratingView.layer.masksToBounds = false
        // MARK :-- ownerNameView Shadow
        ownerNameView.layer.shadowColor = UIColor.red.cgColor
        ownerNameView.layer.shadowOpacity = 0.4
        ownerNameView.layer.shadowRadius = 5.0
        ownerNameView.layer.shadowOffset = .zero
        ownerNameView.layer.masksToBounds = false
    }
}
// MARK :-- extension Sure Password PopUp Button Shadow
extension SurePasswordPopUpVc{
    func addshadow(){
        // MARK :-- No Button  Shadow
        oNoBtn.layer.shadowColor = UIColor.gray.cgColor
        oNoBtn.layer.shadowOpacity = 0.3
        oNoBtn.layer.shadowRadius = 4.0
        oNoBtn.layer.shadowOffset = .zero
        oNoBtn.layer.masksToBounds = false
        // MARK :-- Yes Button  Shadow
        oYesBtn.layer.shadowColor = UIColor.gray.cgColor
        oYesBtn.layer.shadowOpacity = 0.3
        oYesBtn.layer.shadowRadius = 4.0
        oYesBtn.layer.shadowOffset = .zero
        oYesBtn.layer.masksToBounds = false
    }
}
// MARK :-- extension ResetPasswordVc Button Shadow
extension ResetPasswordVc{
    func addshadow(){
        // MARK :-- Email View Shadow
        oOPasswordVw.layer.shadowColor = UIColor.red.cgColor
        oOPasswordVw.layer.shadowOpacity = 0.1
        oOPasswordVw.layer.shadowRadius = 3.0
        oOPasswordVw.layer.shadowOffset = .zero
        oOPasswordVw.layer.masksToBounds = false
        // MARK :-- Email View Shadow
        oNPasswordVw.layer.shadowColor = UIColor.red.cgColor
        oNPasswordVw.layer.shadowOpacity = 0.1
        oNPasswordVw.layer.shadowRadius = 3.0
        oNPasswordVw.layer.shadowOffset = .zero
        oNPasswordVw.layer.masksToBounds = false
        // MARK :-- Email View Shadow
        CNPasswordVw.layer.shadowColor = UIColor.red.cgColor
        CNPasswordVw.layer.shadowOpacity = 0.1
        CNPasswordVw.layer.shadowRadius = 3.0
        CNPasswordVw.layer.shadowOffset = .zero
        CNPasswordVw.layer.masksToBounds = false
    }
}
// MARK :-- extension ChangePasswordVc View Shadow
extension ChangePasswordVc{
    func addshadow(){
        // MARK :-- New Password View Shadow
        oNPasswordVw.layer.shadowColor = UIColor.red.cgColor
        oNPasswordVw.layer.shadowOpacity = 0.1
        oNPasswordVw.layer.shadowRadius = 3.0
        oNPasswordVw.layer.shadowOffset = .zero
        oNPasswordVw.layer.masksToBounds = false
        // MARK :-- Confirm New Password View Shadow
        CNPasswordVw.layer.shadowColor = UIColor.red.cgColor
        CNPasswordVw.layer.shadowOpacity = 0.1
        CNPasswordVw.layer.shadowRadius = 3.0
        CNPasswordVw.layer.shadowOffset = .zero
        CNPasswordVw.layer.masksToBounds = false
    }
}
extension RatingVc{
    func addShadow(){
        // MARK :-- First Name View Shadow
        oStickerVw.layer.shadowColor = UIColor.red.cgColor
        oStickerVw.layer.shadowOpacity = 0.1
        oStickerVw.layer.shadowRadius = 3.0
        oStickerVw.layer.shadowOffset = .zero
        oStickerVw.layer.masksToBounds = false
        // MARK :-- Last NameView Shadow
        RatingQuestionTblVw.layer.shadowColor = UIColor.red.cgColor
        RatingQuestionTblVw.layer.shadowOpacity = 0.1
        RatingQuestionTblVw.layer.shadowRadius = 3.0
        RatingQuestionTblVw.layer.shadowOffset = .zero
        RatingQuestionTblVw.layer.masksToBounds = false
       
        
    }
}

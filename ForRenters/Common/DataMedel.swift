//
//  DataMedels.swift
//  ForRenters
//
//  Created by Pankush Mehra on 24/05/22.
//

import UIKit

class UserInfo {
    var first_name,created_at,email,last_name,phone_number: String?
    var id:Int?
    func datadict(data: NSDictionary){
        first_name = data["first_name"] as? String ?? ""
        last_name = data["last_name"] as? String ?? ""
        email = data["email"] as? String ?? ""
        phone_number = data["phone_number"] as? String ?? ""
    }
}
class TermCondition {
    var created_at,id,terms_consitions: String?
    func datadict(data: NSDictionary){
        terms_consitions = data["terms_consitions"] as? String ?? ""
    }
}
class PrivacyPolicy {
    var created_at,id,privacy_policies: String?
    func datadict(data: NSDictionary){
        privacy_policies = data["terms_consitions"] as? String ?? ""
    }
}
class Aboutas {
    var created_at,id,about_us: String?
    func datadict(data: NSDictionary){
        about_us = data["about_us"] as? String ?? ""
    }
}

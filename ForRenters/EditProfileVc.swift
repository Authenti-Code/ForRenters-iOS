//
//  EditProfileVc.swift
//  ForRenters
//
//  Created by Authenticode on 29/03/22.
//

import UIKit
import SVProgressHUD
import Alamofire
import SDWebImage

class EditProfileVc: UIViewController {
    @IBOutlet weak var oProfileVw: UIView!
    @IBOutlet weak var oDetailsVw: UIView!
    @IBOutlet weak var oFNameVw: UIView!
    @IBOutlet weak var oLNameVw: UIView!
    @IBOutlet weak var oEmailVw: UIView!
    @IBOutlet weak var oPNumberVw: UIView!
    @IBOutlet weak var oFirstNameTF: UITextField!
    @IBOutlet weak var oLastNameTF: UITextField!
    @IBOutlet weak var oPhoneTF: UITextField!
    @IBOutlet weak var oEmailTF: UITextField!
    @IBOutlet weak var oEditBtn: UIButton!
    @IBOutlet weak var oProfileImage: UIImageView!
    @IBOutlet weak var oProfileUploadBtn: UIButton!
    let imgPickerCont = UIImagePickerController()
    var userImage: UIImage?
    var firstName:String?
    var lastName:String?
    var email:String?
    var phone:String?
    var imgUrl = String()
    var profileimg = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
        imgPickerCont.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        oFirstNameTF.text = firstName
        oLastNameTF.text = lastName
        oEmailTF.text = email
        oPhoneTF.text = phone
        imgUrl = profileimg ?? ""
        let removeSpace = imgUrl.replacingOccurrences(of: "", with: "%20")
        oProfileImage.sd_imageIndicator = SDWebImageActivityIndicator.white
        oProfileImage.sd_setImage(with: URL.init(string: removeSpace), placeholderImage: UIImage(named: ""), options: .highPriority, context: [:])
    }
    @IBAction func submitBtnAction(_ sender: Any) {
        ProfileUpdate()
    }
    @IBAction func oBackBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func oProfileUploadAction(_ sender: Any) {
        let alert = UIAlertController(title: "", message: constants.galleryCam, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default , handler:{ [self] (UIAlertAction)in
            let attributedString = NSAttributedString(string: "title", attributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), //your font here
                NSAttributedString.Key.foregroundColor : UIColor.red
            ])
            print("Camera")
            self.imgPickerCont.sourceType = .camera
            self.imgPickerCont.allowsEditing = true
            present(imgPickerCont, animated: true)
        }))
        alert.addAction(UIAlertAction(title: "Gallery", style: .default , handler:{ [self] (UIAlertAction)in
            print("Gallery")
            self.imgPickerCont.sourceType = .photoLibrary
            self.imgPickerCont.allowsEditing = true
            present(imgPickerCont, animated: true)
        }))
        alert.addAction(UIAlertAction(title:"Cancel", style: .default , handler:{ [self] (UIAlertAction)in
            
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}
//  MARK:--> extention for Image Picker
extension EditProfileVc: UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: {
            guard let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
                return
            }
            let image =  originalImage.upOrientationImage()
            self.oProfileImage.image = image
            self.oProfileImage.image = info[.editedImage] as? UIImage
            self.userImage = image
            self.userImage = info[.editedImage] as? UIImage
            self.oProfileImage.resignFirstResponder()
        })
    }
}

//  MARK:--> extension MARK:-->Hit Profile Update Api 
extension EditProfileVc{
    //  MARK:-->Hit Profile Update Api
    func ProfileUpdate(){
        var parameters = [String:AnyObject]()
        parameters = ["first_name" : oFirstNameTF.text ?? "",
                      "last_name":oLastNameTF.text ?? ""
        ] as [String : AnyObject]
        let URL = "\(Apis.ServerUrl)\(Apis.UpdateProfile)"
        print("parameters",parameters)
        requestWith(endUrl: URL, imagedata: userImage?.jpegData(compressionQuality: 1.0), parameters: parameters)
    }
    func requestWith(endUrl: String, imagedata: Data?, parameters: [String : AnyObject]){
        let url = endUrl
        let timeStamp = Date().timeIntervalSince1970*1000
        let fileName = "profile_image\(timeStamp).png"
        SVProgressHUD.show()
        AF.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
            if let data = imagedata{
                multipartFormData.append(data, withName: "profile_image", fileName: fileName, mimeType: "profile_image/png")
            }
        }, to:url,headers: HTTPHeaders(headers())).responseJSON{ response in
            if response.data != nil && response.error == nil {
                if let JSON = response.value as? NSDictionary {
                    if response.response?.statusCode == 200 {
                        SVProgressHUD.dismiss()
                        
                    }
                    self.navigationController?.popViewController(animated: false)
                    Proxy.shared.displayStatusCodeAlert(AppAlerts.titleValue.UpdateProfile)
                } else {
                    if response.data != nil {
                        debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)!)
                    }
                }
            }
            
        }
    }
}




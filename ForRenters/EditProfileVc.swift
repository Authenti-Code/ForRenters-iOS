//
//  EditProfileVc.swift
//  ForRenters
//
//  Created by Authenticode on 29/03/22.
//

import UIKit

class EditProfileVc: UIViewController {
    @IBOutlet weak var oProfileVw: UIView!
    @IBOutlet weak var oDetailsVw: UIView!
    @IBOutlet weak var oFNameVw: UIView!
    @IBOutlet weak var oLNameVw: UIView!
    @IBOutlet weak var oEmailVw: UIView!
    @IBOutlet weak var oPNumberVw: UIView!
    @IBOutlet weak var oEditBtn: UIButton!
    @IBOutlet weak var oProfileImage: UIImageView!
    @IBOutlet weak var oProfileUploadBtn: UIButton!
    let imgPickerCont = UIImagePickerController()
    var userImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        addShadow()
        imgPickerCont.delegate = self
       
    }
    @IBAction func submitBtnAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
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
           
        })
    }
}
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

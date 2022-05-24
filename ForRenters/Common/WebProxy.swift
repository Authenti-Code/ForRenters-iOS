import UIKit
import Alamofire
import SVProgressHUD

class WebProxy {
    static var shared: WebProxy {
        return WebProxy()
    }
    fileprivate init() {}
    
    //MARK:- Post Data API Interaction
    func postData(_ urlStr: String, params: [String:Any], showIndicator: Bool,methodType: HTTPMethod,completion: @escaping (_ response: NSDictionary,_ isSuccess: Bool,_ message: String) -> Void) {
        if NetworkReachabilityManager()!.isReachable {
            if showIndicator {
                SVProgressHUD.show()
            }
            debugPrint("URL: ",urlStr)
            debugPrint("Params: ", params)
            debugPrint("Headers:",headers())
            AF.request(urlStr, method: methodType, parameters: params, encoding: URLEncoding.httpBody, headers: HTTPHeaders(headers())).responseJSON { response in
                DispatchQueue.main.async {
                    SVProgressHUD.dismiss()
                    if response.data != nil && response.error == nil {
                        if let JSON = response.value as? NSDictionary {
                            debugPrint("JSON", JSON)
                            if response.response?.statusCode == 200 {
                                completion(JSON,true, "")
                            }else {
                                if response.response?.statusCode == 401 {
                                    let errorMsg = JSON["error"] as? String ??  JSON["message"] as? String ?? AppAlerts.titleValue.error
                                    completion([:],false, errorMsg)
                                } else if response.response?.statusCode == 426 {
                                    let errorMsg = JSON["error"] as? String ??  JSON["message"] as? String ?? AppAlerts.titleValue.error
                                    completion([:],false, errorMsg)
                                } else {
                                    let errorMsg = JSON["error"] as? String ??  JSON["message"] as? String ?? AppAlerts.titleValue.error
                                    completion([:],false, errorMsg)
                                }
                            }
                        } else {
                            SVProgressHUD.dismiss()
                            Proxy.shared.displayStatusCodeAlert(AppAlerts.titleValue.ErrorUnabletoencodeJSONResponse)
                            if response.data != nil {
                                debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) ?? AppAlerts.titleValue.error)
                            }
                        }
                    } else {
                        if response.data != nil {
                            debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) ?? AppAlerts.titleValue.error)
                        }
                        self.statusHandler(response.response, data: response.data, error: response.error as NSError?)
                    }
                }
            }
        } else {
            SVProgressHUD.dismiss()
            Proxy.shared.openSettingApp()
        }
    }
    
    //MARK:- Get Data API Interaction
    func getData(_ urlStr: String, showIndicator: Bool, completion: @escaping(_ response: NSDictionary,_ isSuccess: Bool,_ message: String) -> Void) {
        if NetworkReachabilityManager()!.isReachable {
            if showIndicator {
//                SVProgressHUD.show()
            }
            debugPrint("URL: ",urlStr)
            debugPrint("Header: ", headers())
            AF.request(urlStr, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: HTTPHeaders(headers())).responseJSON { response in
                if response.data != nil && response.error == nil {
                    //SVProgressHUD.dismiss()
                    if let JSON = response.value as? NSDictionary {
                        debugPrint("JSON", JSON)
                        if response.response?.statusCode == 200 {
                            completion(JSON,true, "")
                        } else {
                            if response.response?.statusCode == 401 {
                                let errorMsg = JSON["error"] as? String ??  JSON["message"] as? String ?? AppAlerts.titleValue.error
                                completion([:],false, errorMsg)
                            } else if response.response?.statusCode == 426 {
                                let errorMsg = JSON["error"] as? String ??  JSON["message"] as? String ?? AppAlerts.titleValue.error
                                completion([:],false, errorMsg)
                            } else {
                                let errorMsg = JSON["error"] as? String ??  JSON["message"] as? String ?? AppAlerts.titleValue.error
                                completion([:],false, errorMsg)
                            }
                        }
                    } else {
//                        SVProgressHUD.dismiss()
                        Proxy.shared.displayStatusCodeAlert(AppAlerts.titleValue.ErrorUnabletoencodeJSONResponse)
                        if response.data != nil {
                            debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) ?? AppAlerts.titleValue.error)
                        }
                    }
                } else {
//                    SVProgressHUD.dismiss()
                    if response.data != nil {
                        debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)!)
                    }
                    self.statusHandler(response.response, data: response.data, error: response.error as NSError?)
                }
            }
        } else {
//            SVProgressHUD.dismiss()
            Proxy.shared.openSettingApp()
        }
    }
    
    //MARK:- Upload Image API Interaction
    func uploadImage(_ parameters:[String:AnyObject],parametersImage:[String:UIImage],videoUrl:URL?,addImageUrl:String, showIndicator: Bool,methodType: HTTPMethod, completion:@escaping(_ response: NSDictionary,_ isSuccess: Bool,_ message: String) -> Void) {
        if NetworkReachabilityManager()!.isReachable {
            if showIndicator {
                    SVProgressHUD.show()
            }
            debugPrint("URL: ",addImageUrl)
            debugPrint("Params: ", parameters)
            debugPrint("Params Image: ", parametersImage)
            debugPrint("Header: ", headers())
            AF.upload(multipartFormData: { multipartFormData in
                for (key, val) in parameters {
                    multipartFormData.append(val.data(using: String.Encoding.utf8.rawValue)!, withName: key)
                }
                for (key, val) in parametersImage {
                    let timeStamp = Date().timeIntervalSince1970 * 1000
                    let fileName = "image\(timeStamp).png"
                    guard let imageData = val.jpegData(compressionQuality: 0.5) else {
                        return
                    }
                    multipartFormData.append(imageData, withName: key, fileName: fileName , mimeType: "image/png")
                }
                if videoUrl != nil {
                    let videoFileName = "video\(Date().timeIntervalSince1970 * 1000).mp4"
                    multipartFormData.append(videoUrl!, withName: "Post[image_file]", fileName: videoFileName, mimeType: "video/mp4")
                }
            },to: addImageUrl,method: methodType, headers: HTTPHeaders(headers())).responseJSON { response in
                if response.data != nil && response.error == nil {
                    SVProgressHUD.dismiss()
                    if let JSON = response.value as? NSDictionary {
                        debugPrint("JSON", JSON)
                        if response.response?.statusCode == 200 {
                            if let JSON = response.value as? NSDictionary{
                                debugPrint("JSON", JSON)
                                completion(JSON,true, "")
                            }
                            //if let jsonAry = response.value as? NSArray{
                            //debugPrint("JSONArry:", jsonAry)
                            //completion(response.value as? NSDictionary ?? [:],jsonAry,true,"")
                            //}
                        } else {
                            if response.response?.statusCode == 400{
                                let errorMsg = JSON["error"] as? String ??  JSON["message"] as? String ?? AppAlerts.titleValue.error
                                completion([:],false, errorMsg)
                            } else if let JSON = response.value as? NSDictionary{
                                if response.response?.statusCode == 401 {
                                    let errorMsg = JSON["error"] as? String ??  JSON["message"] as? String ?? AppAlerts.titleValue.error
                                    completion([:],false, errorMsg)
                                    Proxy.shared.displayStatusCodeAlert(errorMsg)
                                } else if response.response?.statusCode == 426 {
                                    let errorMsg = JSON["error"] as? String ??  JSON["message"] as? String ?? AppAlerts.titleValue.error
                                    completion([:],false, errorMsg)
                                    Proxy.shared.displayStatusCodeAlert(errorMsg)
                                }
                            }
                            SVProgressHUD.dismiss()
                            if response.data != nil {
                                debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)!)
                            }
                            self.statusHandler(response.response, data: response.data, error: response.error as NSError?)
                        }
                    } else {
                        SVProgressHUD.dismiss()
                        Proxy.shared.displayStatusCodeAlert(AppAlerts.titleValue.ErrorUnabletoencodeJSONResponse)
                        if response.data != nil {
                            debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue) ?? AppAlerts.titleValue.error)
                        }
                    }
                } else {
                    SVProgressHUD.dismiss()
                    if response.data != nil {
                        debugPrint(NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue)!)
                    }
                    self.statusHandler(response.response, data: response.data, error: response.error as NSError?)
                }
            }
            .uploadProgress { progress in
                let frac = progress.fractionCompleted
                let percent = Int(frac * 100)
                DispatchQueue.main.async {
                    print("Progress:","\(percent)% completed")
                    //self.progressLabel.text = "\(percent)% completed"
                    //self.progressView.setProgress(Float(frac), animated: true)
                    if percent == 100 {
                        print("Completed")
                    }
                }
            }
        } else {
            SVProgressHUD.dismiss()
            Proxy.shared.openSettingApp()
        }
    }
    
    //MARK:- Error Handling Methos
    func statusHandler(_ response:HTTPURLResponse? , data:Data?, error:NSError?) {
        if let code = response?.statusCode {
            var messageStr = String()
            if data != nil {
                messageStr = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
                messageStr = messageStr == "" ? AppAlerts.titleValue.serverNotResponding : messageStr
            } else {
                messageStr = AppAlerts.titleValue.serverNotResponding
            }
            switch code {
            case 400:
                Proxy.shared.displayStatusCodeAlert(messageStr)
            case 403,401:
                Proxy.shared.displayStatusCodeAlert(messageStr)
            case 404:
                Proxy.shared.displayStatusCodeAlert(messageStr)
            case 500:
                Proxy.shared.displayStatusCodeAlert(messageStr)
            case 408:
                Proxy.shared.displayStatusCodeAlert(messageStr)
            case 426:
                Proxy.shared.displayStatusCodeAlert(messageStr)
            default:
                Proxy.shared.displayStatusCodeAlert(messageStr)
            }
        } else {
            if data != nil {
                let myHTMLString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
                if myHTMLString == "" {
                    Proxy.shared.displayStatusCodeAlert(AppAlerts.titleValue.serverNotResponding)
                } else {
                    Proxy.shared.displayStatusCodeAlert(myHTMLString as String)
                }
            } else {
                Proxy.shared.displayStatusCodeAlert(AppAlerts.titleValue.serverNotResponding)
            }
        }
    }
}


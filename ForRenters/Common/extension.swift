////
////  Extension.swift
////  Law Ninja
////
////  Created by D R Thakur on 07/12/21.
////
//
//import Foundation
//import UIKit
//extension UIView {
//    @IBInspectable var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//            layer.masksToBounds = newValue > 0
//        }
//    }
//}
//extension UITextField{
//    @IBInspectable var placeHolderColor: UIColor? {
//        get {
//            return self.placeHolderColor
//        }
//        set {
//            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
//        }
//    }
//}
////Half Shadow View

//var isBlank : Bool {
//    return (self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
//}
//
//var removingWhitespacesAndNewlines: String {
//    return components(separatedBy: .whitespacesAndNewlines).joined()
//}
//
//var length: Int { return self.count }
//
//func trimmed() -> String {
//    return self.trimmingCharacters(in: .whitespaces)
//}
//func isEmail() throws -> Bool {
//    let regex = try NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9-]+\\.[A-Z]{2,4}$", options: [.caseInsensitive])
//    return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
//}
//
//func isAlphaSpace() throws -> Bool {
//    let regex = try NSRegularExpression(pattern: "^[A-Za-z ]*$", options: [])
//    return regex.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil
//}
//
////    func isNumeric() throws -> Bool {
////        let regex = try NSRegularExpression(pattern: "^[0-9]*$", options: [])
////
////        return regex.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil
////    }
//
//func isRegistrationNumber() throws -> Bool {
//    let regex = try NSRegularExpression(pattern: "^[A-Za-z0-9 ]*$", options: [])
//
//    return regex.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil
//}

import Foundation
import UIKit
import QuartzCore

extension UIView {
    //ROUNDED CORNER TOP VIEW
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        if #available(iOS 11.0, *) {
            clipsToBounds = true
            layer.cornerRadius = radius
            layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
        } else {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }
    }
}
//extension UITextField{
//
//    @IBInspectable var doneAccessory: Bool{
//        get{
//            return self.doneAccessory
//        }
//        set (hasDone) {
//            if hasDone{
//                addDoneButtonOnKeyboard()
//            }
//        }
//    }
//
//    func addDoneButtonOnKeyboard()
//    {
//        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
//        doneToolbar.barStyle = .default
//
//        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
//        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
//
//        let items = [flexSpace, done]
//        doneToolbar.items = items
//        doneToolbar.sizeToFit()
//        doneToolbar.tintColor = .black
////        doneToolbar.inputAccessoryView = keyboardDoneButtonShow
//
//        self.inputAccessoryView = doneToolbar
//    }
//
//    @objc func doneButtonAction()
//    {
//        self.resignFirstResponder()
//    }
//}
extension UIView {
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity

        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
//    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
//        if #available(iOS 11.0, *) {
//          self.clipsToBounds = true
//          self.layer.cornerRadius = radius
//          self.layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
//        } else {
//          let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//          let mask = CAShapeLayer()
//          mask.path = path.cgPath
//          self.layer.mask = mask
//        }
//    }
}
extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}
extension UIView {
    func setRadiusWithShadow(colorSet: UIColor,_ radius: CGFloat? = nil ) {
        self.layer.cornerRadius = radius ?? self.frame.width / 2
        self.layer.shadowColor = colorSet.cgColor
        self.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 1.7
        self.layer.masksToBounds = false
    }
}

//MARK:--> View Customisation
@IBDesignable
extension UIView {
    // Shadow
    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                self.addShadow()
            }
        }
    }
    
    fileprivate func addShadow(shadowColor: CGColor = UIColor.black.cgColor, shadowOffset: CGSize = CGSize(width: 3.0, height: 3.0), shadowOpacity: Float = 0.35, shadowRadius: CGFloat = 5.0) {
        let layer = self.layer
        layer.masksToBounds = false
        
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
        
        let backgroundColor = self.backgroundColor?.cgColor
        self.backgroundColor = nil
        layer.backgroundColor =  backgroundColor
    }
    // Corner radius
    @IBInspectable var circle: Bool {
        get {
            return layer.cornerRadius == self.bounds.width*0.5
        }
        set {
            if newValue == true {
                self.cornerRadius = self.bounds.width*0.5
            }
        }
    }
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    // Borders
    // Border width
    @IBInspectable
    public var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        
        get {
            return layer.borderWidth
        }
    }
    // Border color
    @IBInspectable
    public var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        
        get {
            if let borderColor = layer.borderColor {
                return UIColor(cgColor: borderColor)
            }
            return nil
        }
    }
}
//MARK:--> Back To Controller Navigation Array
extension UINavigationController {
    func backToViewController(viewController: Swift.AnyClass) {
        for element in viewControllers as Array {
            if element.isKind(of: viewController) {
                self.popToViewController(element, animated: true)
                break
            }
        }
    }
}
//MARK-> Validations
public extension String
{
    /*func toJSON() -> JSON
     {
     //        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return JSON() }; return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
     
     }*/
    
    /*
     
     public static String extractYTId(String ytUrl) {
     String vId = null;
     Pattern pattern = Pattern.compile(
     "^https?://.*(?:youtu.be/|v/|u/\\w/|embed/|watch?v=)([^#&?]*).*$",
     Pattern.CASE_INSENSITIVE);
     Matcher matcher = pattern.matcher(ytUrl);
     if (matcher.matches()){
     vId = matcher.group(1);
     }
     return vId;
     }
     */
    var isBlank : Bool {
        return (self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
    }
    
    var removingWhitespacesAndNewlines: String {
        return components(separatedBy: .whitespacesAndNewlines).joined()
    }
   
    var length: Int { return self.count }

    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }
    func isEmail() throws -> Bool {
        let regex = try NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9-]+\\.[A-Z]{2,4}$", options: [.caseInsensitive])
        return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
    }
    
    func isAlphaSpace() throws -> Bool {
        let regex = try NSRegularExpression(pattern: "^[A-Za-z ]*$", options: [])
        return regex.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil
    }
    
    //    func isNumeric() throws -> Bool {
    //        let regex = try NSRegularExpression(pattern: "^[0-9]*$", options: [])
    //
    //        return regex.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil
    //    }
    
    func isRegistrationNumber() throws -> Bool {
        let regex = try NSRegularExpression(pattern: "^[A-Za-z0-9 ]*$", options: [])
        
        return regex.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) != nil
    }
    
    
}

// MARK: - Extension
extension UIImage{
    var roundMyImage: UIImage {
        let rect = CGRect(origin:CGPoint(x: 0, y: 0), size: self.size)
        UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
        UIBezierPath(
            roundedRect: rect,
            cornerRadius: self.size.height
            ).addClip()
        self.draw(in: rect)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    func resizeMyImage(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))

        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    func squareMyImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: self.size.width, height: self.size.width))

        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.width))

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
extension UIImage {
    func upOrientationImage() -> UIImage? {
        switch imageOrientation {
        case .up:
            return self
        default:
            UIGraphicsBeginImageContextWithOptions(size, false, scale)
            draw(in: CGRect(origin: .zero, size: size))
            let result = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return result
        }
    }
}
extension UIBezierPath {

    convenience init?(square: CGRect, numberOfSides: UInt, cornerRadius: CGFloat) {

        guard square.width == square.height else { return nil }

        let squareWidth = square.width

        guard numberOfSides > 0 && cornerRadius >= 0.0 && 2.0 * cornerRadius < squareWidth && !square.isInfinite && !square.isEmpty && !square.isNull else {

            return nil
        }

        self.init()

        // how much to turn at every corner
        let theta =  2.0 * .pi / CGFloat(numberOfSides)
        let halfTheta = 0.5 * theta

        // offset from which to start rounding corners
        let offset: CGFloat = cornerRadius * CGFloat(tan(halfTheta))

        var length = squareWidth - self.lineWidth
        if numberOfSides % 4 > 0 {

            length = length * cos(halfTheta)
        }

        let sideLength = length * CGFloat(tan(halfTheta))

        // start drawing at 'point' in lower right corner
        let p1 = 0.5 * (squareWidth + sideLength) - offset
        let p2 = squareWidth - 0.5 * (squareWidth - length)
        var point = CGPoint(x: p1, y: p2)
        var angle = CGFloat.pi

        self.move(to: point)

        // draw the sides around rounded corners of the polygon
        for _ in 0..<numberOfSides {

            let x1 = CGFloat(point.x) + ((sideLength - offset * 2.0) * CGFloat(cos(angle)))
            let y1 = CGFloat(point.y) + ((sideLength - offset * 2.0) * CGFloat(sin(angle)))

            point = CGPoint(x: x1, y: y1)
            self.addLine(to: point)

            let centerX = point.x + cornerRadius * CGFloat(cos(angle + 0.5 * .pi))
            let centerY = point.y + cornerRadius * CGFloat(sin(angle + 0.5 * .pi))
            let center = CGPoint(x: centerX, y: centerY)
            let startAngle = CGFloat(angle) - 0.5 * .pi
            let endAngle = CGFloat(angle) + CGFloat(theta) - 0.5 * .pi

            self.addArc(withCenter: center, radius: cornerRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
            point = self.currentPoint
            angle += theta

        }

        self.close()
    }
}

enum AIEdge:Int {
    case
        Top,
        Left,
        Bottom,
        Right,
        Top_Left,
        Top_Right,
        Bottom_Left,
        Bottom_Right,
        All,
        None
}


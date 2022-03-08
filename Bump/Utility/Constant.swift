//
//  Constant.swift
//  OASIS2
//
//  Created by Honey on 5/24/19.
//  Copyright © 2019 theDevHoney. All rights reserved.
//

import UIKit
//import SwiftEntryKit
import FirebaseUI
import FirebaseFirestore


enum Constant {
    
    static func getNames() -> [String] {
        let names = ["Addison", "Eli", "Maya", "Ethan", "Ben", "Solly", "Keven", "Yesenia", "David", "Ian", "Sam", "Will", "Sophia", "Sophie", "Sumin", "Rob", "Frank", "Reina", "Emily", "Evangeline" , "Ricky", "Jonah", "Jake", "Jacob", "Owen", "Peter", "Seth",  "Tyria", "Justina", "Kayla", "Elania", "Vani", "Claire", "Hazel", "Xonzy", "Chloe", "Jaz", "Jacob", "Ishai", "Azzy", "Ray", "Grace", "Annie","Henry","Ali","Kabir","Humza","Emma","Emmie","Ella","Gabe","Grant","James","Kory","Emily","Jackson","Will","Trey","Cooper","Alex","Tom","Leia","Jasper","Adam","Derek","Liz","Kayla","Sam","Tran","Shirley","Mira","Ryan","Evan"]

        return names
    }
    
    static func getClubs() -> [Club] {
        var clubArray : [Club] = []
//        clubArray.append(Club(clubID: "1", name: "The Junto", description: "A club for mutual improvement.\nEst. 1727 by Benjamin Franklin.\nThe purpose is to debate questions of morals, politics, and natural philosophy.", userIDArray: [], timestamp: Timestamp(date: Date())))
        
        clubArray.append(Club(clubID: "1", name: "⬅ Beach \nor \nMountains ➡", description: "", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "1", name: "Dog or Cat?", description: "", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "1", name: "Pepsi or Coke?", description: "", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "1", name: "TV or Book?", description: "", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "1", name: "Mac or PC?", description: "", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "1", name: "Audi or BMW?", description: "", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "1", name: "Big House or Nice Car?", description: "", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "1", name: "Kingston or Anne Harris?", description: "", userIDArray: [], timestamp: Timestamp(date: Date())))
        
        
        
        
//        clubArray.append(Club(clubID: "fefsddtgetg", name: "Book Club", description: "What book are you currently reading?", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "fegetgetg", name: "One-Time Club", description: "What are the Top 3 most influential books you've ever read?", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "juytrdf5h", name: "One-Time Club", description: "Where do you derive self-esteem?", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "ytrbytnytd", name: "One-Time Club", description: "Favorite Pink Floyd song?", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "vjfdvbythn", name: "Chess Club", description: "Play chess with someone new every week.", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "uenfhnynyh", name: "Hip Hop Music Exchange", description: "What music are you bumping this week?", userIDArray: [], timestamp: Timestamp(date: Date())))
//        clubArray.append(Club(clubID: "rybtrvtdfjf", name: "Psychonautic Club", description: "What was your first trip experience?" , userIDArray: [], timestamp: Timestamp(date: Date())))
        return clubArray
    }
    
    static let oNeon = UIColor(red: 0.90, green: 1.00, blue: 0.00, alpha: 1.00)
    
    static let oBlueLight = UIColor(red:0.10, green:0.68, blue:0.96, alpha:1.0)
    static let oBlue = UIColor(red:0.00, green:0.65, blue:1.00, alpha:1.0)
    
    
    static let oGray = UIColor(red:0.905, green:0.91, blue:0.925, alpha:1.0)
    static let oGrayLight = UIColor(red:0.94, green:0.95, blue:0.96, alpha:1.0)
    
    static let oBlack = UIColor(red:0.08, green:0.09, blue:0.10, alpha:1.0)
    
    static let textfieldPlaceholderGray = UIColor(red:0.78, green:0.78, blue:0.80, alpha:1.0)
    
    static func imageWith(name: String?) -> UIImage? {
         let frame = CGRect(x: 0, y: 0, width: 100, height: 100)
         let nameLabel = UILabel(frame: frame)
         nameLabel.textAlignment = .center
         nameLabel.backgroundColor = .clear
         nameLabel.textColor = .white
         nameLabel.font = UIFont.boldSystemFont(ofSize: 40)
         nameLabel.text = name
         UIGraphicsBeginImageContext(frame.size)
          if let currentContext = UIGraphicsGetCurrentContext() {
             nameLabel.layer.render(in: currentContext)
             let nameImage = UIGraphicsGetImageFromCurrentImageContext()
             return nameImage
          }
          return nil
    }
    
    
    
//    static let bottomPopUpAttributes : EKAttributes = {
//        var attributes = EKAttributes.bottomFloat
//        attributes.hapticFeedbackType = EKAttributes.NotificationHapticFeedback.none
//        attributes.displayDuration = .infinity
//        attributes.entryBackground = .gradient(gradient: .init(colors: [EKColor(UIColor.white), EKColor(UIColor.white)], startPoint: .zero, endPoint: CGPoint(x: 1, y: 1)))
//        attributes.screenBackground = .color(color: EKColor(UIColor.black.withAlphaComponent(0.5)))
//        attributes.screenInteraction = .dismiss
//        attributes.entryInteraction = .absorbTouches
//        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .easeOut)
//        attributes.roundCorners = .all(radius: 18.0)
//        attributes.entranceAnimation = .init(translate: .init(duration: 0.4, spring: .init(damping: 1, initialVelocity: 0)))
//        attributes.statusBar = .light
//
//        attributes.exitAnimation = .init(translate: .init(duration: 0.15))
//        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.2)))
//        attributes.positionConstraints.size = .init(width: .offset(value: 10), height: .intrinsic)
//        attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .constant(value: UIScreen.main.bounds.height))
//
//        return attributes
//    }()
//
//    static let centerPopUpAttributes : EKAttributes = {
//        var attributes = EKAttributes.centerFloat
//        attributes.hapticFeedbackType = EKAttributes.NotificationHapticFeedback.none
//        attributes.displayDuration = .infinity
//        attributes.entryBackground = .gradient(gradient: .init(colors: [EKColor(UIColor.white), EKColor(UIColor.white)], startPoint: .zero, endPoint: CGPoint(x: 1, y: 1)))
//        attributes.screenBackground = .color(color: EKColor(UIColor.black.withAlphaComponent(0.5)))
//        //attributes.shadow = .active(with: .init(color: .black, opacity: 0.3, radius: 8))
//        attributes.screenInteraction = .dismiss
//        attributes.entryInteraction = .absorbTouches
//        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .easeOut)
//        attributes.roundCorners = .all(radius: 18.0)
//        attributes.entranceAnimation = .init(translate: .init(duration: 0.4, spring: .init(damping: 1, initialVelocity: 0)))
//        attributes.statusBar = .light
//
//        attributes.exitAnimation = .init(translate: .init(duration: 0.15))
//        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.2)))
//        attributes.positionConstraints.size = .init(width: .offset(value: 10), height: .intrinsic)
//        attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .constant(value: UIScreen.main.bounds.height))
//
//        return attributes
//    }()
//
//    static func fixedPopUpAttributes(heightWidthRatio : CGFloat) -> EKAttributes {
//        var attributes = EKAttributes.bottomFloat
//        attributes.displayDuration = .infinity
//        attributes.entryBackground = .gradient(gradient: .init(colors: [EKColor(UIColor.white), EKColor(UIColor.white)], startPoint: .zero, endPoint: CGPoint(x: 1, y: 1)))
//        attributes.screenBackground = .color(color: EKColor(UIColor.black.withAlphaComponent(0.5)))
//        attributes.screenInteraction = .dismiss
//        attributes.entryInteraction = .absorbTouches
//        attributes.scroll = .enabled(swipeable: true, pullbackAnimation: .easeOut)
//        attributes.roundCorners = .all(radius: 18.0)
//        attributes.entranceAnimation = .init(translate: .init(duration: 0.4, spring: .init(damping: 1, initialVelocity: 0)))
//        attributes.statusBar = .light
//
//        attributes.exitAnimation = .init(translate: .init(duration: 0.15))
//        attributes.popBehavior = .animated(animation: .init(translate: .init(duration: 0.2)))
//        attributes.positionConstraints.size = .init(width: .offset(value: 10), height: .constant(value: UIScreen.main.bounds.width * heightWidthRatio))
//        attributes.positionConstraints.maxSize = .init(width: .constant(value: UIScreen.main.bounds.width), height: .constant(value: UIScreen.main.bounds.height))
//
//        return attributes
//    }
}




extension UIScrollView {
    func scrollToTop(_ animated: Bool) {
        var topContentOffset: CGPoint
        topContentOffset = CGPoint(x: -safeAreaInsets.left, y: -safeAreaInsets.top)
        setContentOffset(topContentOffset, animated: animated)
    }
}


extension UIImage {
    
    /// Returns a image that fills in newSize
    func resizedImage(newSize: CGSize) -> UIImage {
        // Guard newSize is different
        guard self.size != newSize else { return self }
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}






extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}









class BaseTextField: UITextField {
    
    var padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}


extension String {
    func stringByRemovingEmoji() -> String {
        return String(self.filter { !$0.isEmoji() })
    }
}

extension Character {
    fileprivate func isEmoji() -> Bool {
        return Character(UnicodeScalar(UInt32(0x1d000))!) <= self && self <= Character(UnicodeScalar(UInt32(0x1f77f))!)
            || Character(UnicodeScalar(UInt32(0x2100))!) <= self && self <= Character(UnicodeScalar(UInt32(0x26ff))!)
    }
}


//For when someone changes image. cache it then reload if different.
extension UIImageView {
    
    func setImage(with reference: StorageReference, placeholder: UIImage? = nil) {
//        sd_setImage(with: reference)
        sd_setImage(with: reference, placeholderImage: placeholder) { [weak self] image, _, _, _ in
            reference.getMetadata { metadata, _ in
                if let url = NSURL.sd_URL(with: reference)?.absoluteString,
                    let cachePath = SDImageCache.shared.cachePath(forKey: url),
                    let attributes = try? FileManager.default.attributesOfItem(atPath: cachePath),
                    let cacheDate = attributes[.creationDate] as? Date,
                    let serverDate = metadata?.timeCreated,
                    serverDate > cacheDate {

                    SDImageCache.shared.removeImage(forKey: url) {
                        self?.sd_setImage(with: reference, placeholderImage: image, completion: nil)
                    }
                }
            }
        }
    }
    
}


class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.textLabel?.textColor = UIColor.black
        self.textLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        self.detailTextLabel?.textColor = UIColor.black
        self.imageView?.image = nil
        
        self.textLabel?.text = ""
        self.detailTextLabel?.text = ""
        
        self.accessoryView = nil
        self.accessoryType = .none
    }
}

class AccessoryTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class IndexTapGestureRecognizer: UITapGestureRecognizer {
    var indexPath: IndexPath?
}


class StringTapGestureRecognizer: UITapGestureRecognizer {
    var stringTag: String?
}

extension UILabel {
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let relativeFrame = self.bounds
        let hitTestEdgeInsets = UIEdgeInsets(top: -10, left: -4, bottom: -10, right: -10)
        let hitFrame = relativeFrame.inset(by: hitTestEdgeInsets)
        return hitFrame.contains(point)
    }
}


extension UIButton {
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let relativeFrame = self.bounds
        let hitTestEdgeInsets = UIEdgeInsets(top: -16, left: -16, bottom: -16, right: -16)
        let hitFrame = relativeFrame.inset(by: hitTestEdgeInsets)
        return hitFrame.contains(point)
    }
}


extension Date {
    var millisecondsSince1970 : Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds : Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}



extension UIView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0, paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        
        var anchors = [NSLayoutConstraint]()
        
        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: paddingTop))
        }
        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: paddingLeft))
        }
        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom))
        }
        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -paddingRight))
        }
        if width > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: width))
        }
        if height > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: height))
        }
        
        anchors.forEach({$0.isActive = true})
        
        return anchors
    }
    
    @discardableResult
    func anchorToSuperview() -> [NSLayoutConstraint] {
        return anchor(top: superview?.topAnchor, left: superview?.leftAnchor, bottom: superview?.bottomAnchor, right: superview?.rightAnchor)
    }
}

extension UIView {
    
    func applyShadow(radius: CGFloat, opacity: Float, offset: CGSize, color: UIColor = .black) {
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }
    
}

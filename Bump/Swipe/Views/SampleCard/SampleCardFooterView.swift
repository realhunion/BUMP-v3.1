import UIKit

class SampleCardFooterView: UIView {
    
    private var label = UILabel()
    
    private var gradientLayer: CAGradientLayer?
//    var interest : Interest?
    
    private let boostButton: TinderButton = {
        let button = TinderButton()
//        button.setImage(UIImage(named: "lightnings"), for: .normal)
        button.setImage(Constant.imageWith(name: "➕"), for: .normal)
        button.addTarget(self, action: #selector(handleTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.tag = 5
        
        
        return button
    }()
    
    @objc func handleTap() {
        //FIX:
//        guard LoginManager.shared.isLoggedIn() else { return }
//        guard let i = self.interest else { return }
//        if let topVC = UIApplication.topViewController() as? SwipeVC {
//            topVC.presentInterestVC(interestID: i.interestID)
//        }
    }
    
    init(withTitle title: String?, subtitle: String?) {
        super.init(frame: CGRect.zero)
        backgroundColor = .clear
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        layer.cornerRadius = 10
        clipsToBounds = false
        isOpaque = false
        initialize(title: title, subtitle: subtitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    private func initialize(title: String?, subtitle: String?) {
        let attributedText = NSMutableAttributedString(string: (title ?? "") + "\n", attributes: NSAttributedString.Key.titleAttributes)
        if let subtitle = subtitle, subtitle != "" {
            attributedText.append(NSMutableAttributedString(string: subtitle, attributes: NSAttributedString.Key.subtitleAttributes))
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            paragraphStyle.lineBreakMode = .byTruncatingTail
            attributedText.addAttributes([NSAttributedString.Key.paragraphStyle: paragraphStyle], range: NSRange(location: 0, length: attributedText.length))
            label.numberOfLines = 99
        }
        
//        label.attributedText = attributedText
//        label.adjustsFontSizeToFitWidth = true
//        addSubview(label)
        
        let l1 = UILabel()
        l1.text = title!
        l1.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        l1.numberOfLines = 99
//        l1.adjustsFontSizeToFitWidth = true
        let l2 = UILabel()
        l2.text = subtitle!
        l2.textColor = .secondaryLabel
        l2.font = UIFont.systemFont(ofSize: 28, weight: .regular)
        l2.numberOfLines = 99
//        l2.adjustsFontSizeToFitWidth = true
//        l1.translatesAutoresizingMaskIntoConstraints = false
//        l2.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(l1)
        self.addSubview(l2)
        
        l1.layoutToSuperview(.top, offset: -524)
        l1.layoutToSuperview(.left, offset: 20)
        l1.layoutToSuperview(.right, offset: -90)
        l2.layout(.top, to: .bottom, of: l1, offset: 2)
//        l2.layoutToSuperview(.bottom, offset: -500)
        l2.layoutToSuperview(.left, offset: 20)
        l2.layoutToSuperview(.right, offset: -20)
        
        
        
        self.addSubview(boostButton)
        boostButton.translatesAutoresizingMaskIntoConstraints = false
        boostButton.layoutToSuperview(.right, offset: -20)
        boostButton.layoutToSuperview(.top, offset: 0)
        boostButton.set(.width, of: 60)
        boostButton.set(.height, of: 60)
        
    }
    
    override func layoutSubviews() {
        let padding : CGFloat = 20.0
        label.frame = CGRect(x: padding,
                             y: bounds.height - label.intrinsicContentSize.height - padding,
                             width: bounds.width - 2 * padding - 80,
                             height: label.intrinsicContentSize.height)
    }
}

extension NSAttributedString.Key {
    
    static var shadowAttribute: NSShadow = {
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 1)
        shadow.shadowBlurRadius = 2
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.3)
        return shadow
    }()
    
    static var titleAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 36.0, weight: .bold),
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.shadow: NSAttributedString.Key.shadowAttribute
    ]
    
    static var subtitleAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0, weight: .medium),
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.shadow: NSAttributedString.Key.shadowAttribute
    ]
}

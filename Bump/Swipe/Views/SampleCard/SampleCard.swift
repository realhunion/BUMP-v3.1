
import QuickLayout
import Firebase

class SampleCard: SwipeCard {
    
    override func minimumSwipeSpeed(on direction: SwipeDirection) -> CGFloat {
        return 240
    }
    
    override var swipeDirections: [SwipeDirection] {
        return [.up, .right, .left]
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        footerHeight = 80
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    deinit {
        print("vvs deinit")
    }
    
    override func overlay(forDirection direction: SwipeDirection) -> UIView? {
        switch direction {
        case .up:
            return SampleCardOverlay.left()
        case.right:
            return SampleCardOverlay.right()
        default:
            return nil
        }
    }
    
//    var interest : Interest?
    func configure(withID id: String) {
        
        self.content = SampleCardContentView(withImage: UIImage(named: "travisScott"))
        
        let spinner = UIActivityIndicatorView()
        self.content!.addSubview(spinner)
        spinner.center = self.content!.center
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        
        spinner.translatesAutoresizingMaskIntoConstraints = false
        
        spinner.layoutToSuperview(.centerX)
        spinner.layoutToSuperview(.centerY)
        
//        InterestDirectory.shared.getInterest(interestID: id) { (interest) in
//
//            spinner.stopAnimating()
//            guard let i = interest else { return }
//
//            self.interest = i
//
//            let content = self.content as! SampleCardContentView
//            content.setupImage(withImageURL: URL(string: i.imageURL))
//
//            let uIDArray = i.likedBy.map({$0.userID})
//
//            if !i.likedBy.isEmpty {
//
//                if Auth.auth().currentUser != nil {
//                    UserDirectory.shared.getUsers(userIDArray: uIDArray) { (userArray) in
//                        content.setupMembersStackView(userArray: userArray)
//                    }
//                }
//            }
//
//            let footer = SampleCardFooterView(withTitle: i.name, subtitle:  i.description)
//            footer.interest = interest
//            self.footer = footer
//
//        }
        spinner.stopAnimating()
        let content = self.content as! SampleCardContentView
        let url = "https://picsum.photos/\(Int.random(in: 700...800))/\(Int.random(in: 1400...1600))"
//        content.setupImage(withImageURL: URL(string: "https://picsum.photos/\(Int.random(in: 700...800))/\(Int.random(in: 1400...1600))"))
//        let url = "https://i.picsum.photos/id/992/4000/2660.jpg?hmac=4ChuOvJxZM-R3_XqA5OuNvUZvdqa87j3R01FIvikB7U"
        content.setupImage(withImageURL: URL(string: url))
        self.content = content
        
        var arrArray = [User]()
        for i in 0...Int.random(in: 0...5) {
            let u = User(userID: "f", email: "fr", name: Constant.getNames().randomElement()!, description: "fr", imageURL: "https://picsum.photos/\(Int.random(in: 700...800))/\(Int.random(in: 1400...1600))", interests: [], dateJoined: Timestamp(date: Date()), classYear: 2)
            arrArray.append(u)
            
        }
        content.setupMembersStackView(userArray: arrArray)
        
        let cc = Constant.getClubs().randomElement()!
        
        let footer = SampleCardFooterView(withTitle: cc.name, subtitle: cc.description)
//        footer.interest = interest
        self.footer = footer
    }
    
}

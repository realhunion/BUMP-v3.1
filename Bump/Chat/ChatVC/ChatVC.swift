//  ChatLogVC.swift
//  OASIS2
//
//  Created by Honey on 5/25/19.
//  Copyright © 2019 theDevHoney. All rights reserved.
//

import UIKit
import Firebase
import QuickLayout

class ChatVC: UICollectionViewController, UIGestureRecognizerDelegate {
    
    
    deinit {
        print("\n CHATVC is DE INIT \n")
    }
    
    
    let incomingTextMessageCellID = "incomingTextMessageCellID"
    let outgoingTextMessageCellID = "outgoingTextMessageCellID"
    
    var msgFetcher : MessageFetcher?
    var msgSender : MessageSender?
    
    var msgArray : [[Message]] = [] // Each item is Msg Group Array.
    var heySpamArray : [Date] = [] //Tracking how fast emoji Button is spammed
    
    var chatID : String = "Error Club"
    var chatName : String = "Error Club"
    var circleEmoji : String = "👍"
    
    let inputBarHeight : CGFloat = 50.0
    lazy var inputBarView: InputBarView = {
        var inputBarView = InputBarView()
        inputBarView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.inputBarHeight)
        inputBarView.translatesAutoresizingMaskIntoConstraints = false
        inputBarView.chatVC = self
        return inputBarView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupSpinner()
        
        self.setupCollectionView()
//        self.setupNavBar()
        self.navigationItem.largeTitleDisplayMode = .never

        
        let l = UILabel(frame: CGRect.zero)
        l.textColor = UIColor.secondaryLabel
        l.font = UIFont.systemFont(ofSize: 14.0, weight: .medium)
        l.text = "23h left"
        let x = UIBarButtonItem(customView: l)
        navigationItem.rightBarButtonItem = x

        
        self.setupInputBar()

        self.setupKeyboardObservers()

        self.setupMessageFetcher()
        self.setupMessageSender()
         

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.updateFeedMsgsRead()
        
//        DispatchQueue.main.async {
//            self.inputBarView.inputTextView.becomeFirstResponder()
//        }
//        self.inputBarView.inputTextView.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.updateFeedMsgsRead()
        
//        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.shutDown()
    }
    
    
    
    
    
    func updateFeedMsgsRead() {
//        CircleManager.shared.updateFeedLastSeen(chatID: chatID)
        //FIX: this
    }
    
    
    
    func shutDown () {
        
        self.inputBarView.shutDown()
        
        self.msgFetcher?.shutDown()
        
        NotificationCenter.default.removeObserver(self)
    }
    
    
    
    
    
    
    // MARK: - Set-Up
    
    func setupSpinner() {
        let spinner = UIActivityIndicatorView(style: .gray)
        spinner.hidesWhenStopped = true
        self.collectionView.backgroundView = spinner
        spinner.startAnimating()
    }
    
    
    func setupInputBar() {
        self.inputBarView.emojiButton.setTitle(self.circleEmoji, for: .normal)
    }
    
    var inputBarBottomAnchor: NSLayoutConstraint?
    func setupCollectionView () {
        
        self.collectionView.register(IncomingTextMessageCell.self, forCellWithReuseIdentifier: incomingTextMessageCellID)
        self.collectionView!.register(OutgoingTextMessageCell.self, forCellWithReuseIdentifier: outgoingTextMessageCellID)
        
        let tapG = UITapGestureRecognizer(target: self, action: #selector(screenTapped))
        collectionView.addGestureRecognizer(tapG)
        tapG.delegate = self
        
        self.edgesForExtendedLayout = []
        view.backgroundColor = UIColor.systemBackground
        collectionView.backgroundColor = UIColor.systemBackground
        navigationController?.navigationBar.backgroundColor = UIColor.systemBackground
        
        collectionView?.indicatorStyle = .default
        collectionView?.backgroundColor = UIColor.systemBackground
        collectionView?.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView?.keyboardDismissMode = .none
        collectionView?.delaysContentTouches = false
        collectionView?.alwaysBounceVertical = true
        collectionView?.isPrefetchingEnabled = false
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        
//        self.inputBarView.inputTextView.becomeFirstResponder()
        
        self.view.addSubview(inputBarView)

        inputBarView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        inputBarView.heightAnchor.constraint(equalToConstant: self.inputBarHeight).isActive = true
        inputBarBottomAnchor = inputBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        inputBarBottomAnchor?.isActive = true
        
        
        collectionView!.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView!.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView!.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView!.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -self.inputBarView.bounds.height).isActive = true
                                    
        
        collectionView?.register(IncomingTextMessageCell.self, forCellWithReuseIdentifier: incomingTextMessageCellID)
        collectionView?.register(OutgoingTextMessageCell.self, forCellWithReuseIdentifier: outgoingTextMessageCellID)
        
        collectionView.isScrollEnabled = true
        
        collectionView.delegate = self
    }
    
    func setupMessageSender() {
        guard msgSender == nil else { return }
        
        self.msgSender = MessageSender(chatID: self.chatID)
    }
    
    func setupMessageFetcher() {
        guard msgFetcher == nil else { return }
        
        self.msgFetcher = MessageFetcher(chatID: chatID)
        self.msgFetcher?.delegate = self
        self.msgFetcher?.startMonitor()
    }
    
    
    
    //MARK: - Helper Methods
    
    func scrollToBottom(at position: UICollectionView.ScrollPosition, isAnimated : Bool) {
        guard let lastMsgGroup = msgArray.last else { return }
        
        let item = lastMsgGroup.count - 1
        let section = msgArray.count - 1
        
        if(section < 0 || item < 0) {
            return
        }
        
        let indexPath = IndexPath(item: item, section: section)
        
        DispatchQueue.main.async {
            self.collectionView?.scrollToItem(at: indexPath, at: position, animated: isAnimated)
        }
    }
    
}

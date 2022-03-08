//
//  ChatInputContainerView.swift
//  OASIS2
//
//  Created by Honey on 5/24/19.
//  Copyright © 2019 theDevHoney. All rights reserved.
//

import UIKit
import AVFoundation


class InputBarView: UIView {
    
    let maxCharacters = 140
    let launchChatPlaceholder = "Send a message to notify circle."
    let normalPlaceholder = "Type a message"
    
    func shutDown() {
        self.chatVC = nil
    }
    
    weak var chatVC: ChatVC? {
        didSet {
            sendButton.addTarget(chatVC, action: #selector(ChatVC.handleSend), for: .touchUpInside)
            emojiButton.addTarget(chatVC, action: #selector(ChatVC.handleHeyButton), for: .touchUpInside)
        }
    }
    
    lazy var inputTextView: UITextField = {
        let textView = UITextField()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.delegate = self
        textView.font = UIFont.preferredFont(forTextStyle: .callout)
        textView.layer.cornerRadius = 18
        textView.textColor = UIColor.label
        textView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        
        let paddingViewLeft = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        textView.leftView = paddingViewLeft
        textView.leftViewMode = UITextField.ViewMode.always
        
        let paddingViewRight = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: self.frame.height))
        textView.rightView = paddingViewRight
        textView.rightViewMode = UITextField.ViewMode.always
        
        textView.autocorrectionType = UITextAutocorrectionType.yes
        textView.returnKeyType = UIReturnKeyType.send
        
        textView.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor : Constant.textfieldPlaceholderGray])
        
        textView.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        
        textView.placeholder = "Type a message"
        textView.backgroundColor = .tertiarySystemGroupedBackground
        
        return textView
    }()
    
    let emojiButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("🤙", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24.0)
        
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
        return button
    }()
    
    let sendButton: UIButton = {
        let sendButton = UIButton(type: .custom)
        sendButton.setImage(UIImage(named: "send"), for: .normal)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.isEnabled = false
        
        return sendButton
    }()
    
    deinit {
        print("\nCHAT INPUT CONTAINER VIEW DID DE INIT\n")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        print("\nCHAT INPUT CONTAINER VIEW INIT\n")
        backgroundColor = UIColor.systemBackground
        self.autoresizingMask = UIView.AutoresizingMask.flexibleHeight
        
        addSubview(emojiButton)
        addSubview(inputTextView)
        addSubview(sendButton)
        
        emojiButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        inputTextView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        
        emojiButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        emojiButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emojiButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        inputTextView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 6).isActive = true
        inputTextView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -6).isActive = true
        inputTextView.leftAnchor.constraint(equalTo: emojiButton.rightAnchor, constant: 4).isActive = true
        
        
        sendButton.rightAnchor.constraint(equalTo: inputTextView.rightAnchor, constant: -4).isActive = true
        sendButton.bottomAnchor.constraint(equalTo: inputTextView.bottomAnchor, constant: -4).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension InputBarView {
    
    func prepareForSend() {
        inputTextView.text = ""
        sendButton.isEnabled = false
    }
}

extension InputBarView: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}


extension InputBarView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        chatVC?.scrollToBottom(at: .bottom, isAnimated: true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        chatVC?.scrollToBottom(at: .bottom, isAnimated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard sendButton.isEnabled else { return false }
        
        chatVC?.handleSend()
        
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if text == "" {
            sendButton.isEnabled = false
        } else if text.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).isEmpty {
            sendButton.isEnabled = false
        } else {
            sendButton.isEnabled = true
        }
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        return updatedText.count <= self.maxCharacters
    }

    
}

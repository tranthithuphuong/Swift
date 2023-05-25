//
//  ViewController.swift
//  zaloChat
//
//  Created by chuottp on 08/11/2022.
//

import UIKit
import MessageKit
import InputBarAccessoryView


var phuongSender = Sender(senderId: "1", displayName: "thuphuong")
var nhiSender = Sender(senderId:"2", displayName: "baonhi")

class ViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate, InputBarAccessoryViewDelegate{
    
    var message : [ChatMessages] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messagesDataSource = self
        messageInputBar.delegate = self
    
    }
    
    var currentSender: SenderType {
        if currentSender.senderId == "1"{
            return phuongSender
        }
        return nhiSender
        
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return message[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return message.count
    }
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        var newMessage = ChatMessages(sender: currentSender, messageId: "1", sentDate: Date(), kind: .text(inputBar.inputTextView.text))
        message.append(newMessage)
        inputBar.inputTextView.text = ""
        messagesCollectionView.reloadData()
    }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.image = UIImage(named: "hi")
    }
    
    
    @IBAction func btnChangeUser(_ sender: UIBarButtonItem) {
        
    }
    

    
    
}
struct Sender : SenderType {
    var senderId: String

    var displayName: String
}

struct ChatMessages : MessageType {
    var sender: SenderType
    
    var messageId: String
    
    var sentDate: Date
    
    var kind: MessageKind
    
}




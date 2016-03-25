//
//  ChatRoomViewController.swift
//  Clipo
//
//  Created by TUNGYING-CHAO on 3/25/16.
//  Copyright © 2016 TUNGYING-CHAO. All rights reserved.
//

import UIKit
import JSQMessagesViewController



class ChatRoomViewController: JSQMessagesViewController {
    var messages = [JSQMessage]()
    var outgoingBubbleImageView = JSQMessagesBubbleImageFactory().outgoingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleLightGrayColor())
    var incomingBubbleImageView = JSQMessagesBubbleImageFactory().incomingMessagesBubbleImageWithColor(UIColor.jsq_messageBubbleRedColor())
    
    override func viewDidAppear(animated: Bool) {
        self.addTextMessage(self.senderId, text: "Fuck")
        self.addTextMessage("Foo", text: "You")
        self.addTextMessage("Gan", text: "Shit")
        finishReceivingMessage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupFakeChatroom()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupFakeChatroom() -> Void {
        inputToolbar.contentView.leftBarButtonItem = nil
        self.senderId = "xxxx"
        self.senderDisplayName = "Clipo"
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSizeZero
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSizeZero
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, messageBubbleImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = self.messages[indexPath.item]
        if message.senderId == self.senderId {
            return outgoingBubbleImageView
        } else {
            return incomingBubbleImageView
        }
    }
    
    override func collectionView(collectionView: JSQMessagesCollectionView!, avatarImageDataForItemAtIndexPath indexPath: NSIndexPath!) -> JSQMessageAvatarImageDataSource! {
        return nil
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = super.collectionView(collectionView, cellForItemAtIndexPath: indexPath) as! JSQMessagesCollectionViewCell
        let message = self.messages[indexPath.item]
        if message.senderId == senderId {
            cell.textView!.textColor = UIColor.blackColor()
        }else {
            cell.textView!.textColor = UIColor.whiteColor()
        }
        return cell
    }
    
    func addTextMessage(id: String, text: String){
        let message = JSQMessage(senderId: id, displayName: "God", text: text)
        self.messages.append(message)
    }
}

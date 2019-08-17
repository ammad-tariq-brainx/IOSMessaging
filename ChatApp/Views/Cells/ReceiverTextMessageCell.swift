//
//  SenderTextMessageCell.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-16.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class ReceiverTextMessageCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var senderTextMessage: UILabel!
    @IBOutlet weak var senderTextMessageView: UIView!
 
    //MARK: Public Methods
    func setData (text: String) {
        senderTextMessage.text = text
    }
    
}

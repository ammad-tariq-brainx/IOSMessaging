//
//  NewChatListingCell.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-09.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class ContactsListingCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var newChatImageView: UIImageView!
    @IBOutlet weak var newChatNameLabel: UILabel!
    @IBOutlet weak var openMessagesButton: UIButton!
    
    //MARK: Public Methods
    func setData(image: UIImage?, text: String) {
        if let chatImage = image {
            newChatImageView.image = chatImage
        }
        newChatNameLabel.text = text
    }
}

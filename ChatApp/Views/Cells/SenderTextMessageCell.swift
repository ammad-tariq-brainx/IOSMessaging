//
//  TextMessagingCell.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-16.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class SenderTextMessageCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var senderImageView: UIImageView!
    @IBOutlet weak var textMessageLabel: UILabel!
    
    //MARK: Public Methods
    func setData(image: UIImage, text: String) {
        senderImageView.image = image
        textMessageLabel.text = text
    }
    
}

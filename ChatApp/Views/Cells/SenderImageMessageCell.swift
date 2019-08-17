//
//  ImageMessagingCell.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-16.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class SenderImageMessageCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var senderImageView: UIImageView!
    @IBOutlet weak var imageMessageView: UIImageView!
    
    //MARK: Public Methods
    func setData(senderImage: UIImage, messageImage: UIImage) {
        senderImageView.image = senderImage
        imageMessageView.image = messageImage
    }
}

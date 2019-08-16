//
//  ImageMessagingCell.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-16.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class SenderImageMessageCell: UITableViewCell {

    @IBOutlet weak var senderImageView: UIImageView!
    @IBOutlet weak var imageMessageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setData(senderImage: UIImage, messageImage: UIImage) {
        senderImageView.image = senderImage
        imageMessageView.image = messageImage
    }
}

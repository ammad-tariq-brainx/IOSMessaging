//
//  ReceiverImageMessageCell.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-16.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class ReceiverImageMessageCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var imageMessage: UIImageView!
    
    //MARK: Public Methods
    func setData(image: UIImage) {
        imageMessage.image = image
    }
    
}

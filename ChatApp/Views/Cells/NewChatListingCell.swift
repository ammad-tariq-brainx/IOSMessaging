//
//  NewChatListingCell.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-09.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class NewChatListingCell: UITableViewCell {

    
    @IBOutlet weak var newChatImageView: UIImageView!
    @IBOutlet weak var newChatNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setData(image: UIImage?, text: String) {
        if let chatImage = image {
            newChatImageView.image = chatImage
        }
        newChatNameLabel.text = text
    }
}

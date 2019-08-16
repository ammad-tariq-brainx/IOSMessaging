//
//  ConversationCell.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-09.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class ConversationCell: UITableViewCell {

    @IBOutlet weak var threadImage: UIImageView!
    @IBOutlet weak var threadName: UILabel!
    @IBOutlet weak var threadMessage: UILabel!
    @IBOutlet weak var threadTime: UILabel!
    @IBOutlet weak var threadNotification: UILabel!
    @IBOutlet weak var openMessageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(data: ThreadDetails) {
        if let image = data.image {
            threadImage.image = image
        }
        threadName.text = data.name
        threadMessage.text = data.message.last
        threadTime.text = data.time.last
        threadNotification.backgroundColor = UIColor(patternImage: UIImage(named: "BackgroundGradient")!)
        threadNotification.text = String(data.notification)
        if data.notification > 0 {
            threadNotification.isHidden = false
            threadMessage.textColor = .black
        } else {
            threadNotification.isHidden = true
            threadMessage.textColor = UIColor(red:0.56, green:0.56, blue:0.56, alpha:1.0)
        }
    }
}

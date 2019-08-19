//
//  NewChatCell.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-09.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class NewChatCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var threadsImageView: UIImageView!
    @IBOutlet weak var threadsTextView: UILabel!
    
    //MARK: Public Methods
    func setData(imageString: String, text: String) {
        threadsImageView.image = UIImage(imageLiteralResourceName: imageString)
        threadsTextView.text = text
    }
}

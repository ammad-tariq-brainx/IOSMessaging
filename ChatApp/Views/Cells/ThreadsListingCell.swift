//
//  NewChatCell.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-09.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class ThreadsListingCell: UITableViewCell {

    @IBOutlet weak var threadsImageView: UIImageView!
    @IBOutlet weak var threadsTextView: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setData(imageString: String, text: String) {
        threadsImageView.image = UIImage(imageLiteralResourceName: imageString)
        threadsTextView.text = text
    }
}

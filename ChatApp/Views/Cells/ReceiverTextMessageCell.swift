//
//  SenderTextMessageCell.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-16.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class ReceiverTextMessageCell: UITableViewCell {

    @IBOutlet weak var senderTextMessage: UILabel!
    @IBOutlet weak var senderTextMessageView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //senderTextMessageView.layer.contents = #imageLiteral(resourceName: "webbg").cgImage
    }

    func setData (text: String) {
        senderTextMessage.text = text
    }

}

//
//  Message.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-19.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import Foundation
import UIKit

class Message {
    var date = ""
    var time = ""
    var text = ""
    var image: UIImage?
    
    init(text: String, image: UIImage?, date: String, time: String) {
        self.text = text
        self.date = date
        self.time = time
        if let messageImage = image {
            self.image = messageImage
        }
    }
}

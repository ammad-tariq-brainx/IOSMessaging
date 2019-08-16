//
//  Message.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-16.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import Foundation
import UIKit

class Message {
    
    var text: String?
    var image: UIImage?
    
    init(message text: String, image: UIImage?) {
        self.text = text
        self.image = image
    }
}

//
//  ThreadDetails.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-09.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import Foundation
import UIKit

class ThreadDetails {
    
    //Mark: Variables
    var image: UIImage?
    var name: String
    var messages = [Message]()
    var notification = 0
    
    //Mark: Initializers
    init(image: String = "", name: String = "No Name") {
        
        if !image.isEmpty {
            self.image = UIImage(imageLiteralResourceName: image)
        }
        self.name = name
    }
    
    //MARK: Public  Methods
    func setTime() {
        messages.append(Message(text: "",
                                image: nil,
                                date: Date().dateString,
                                time: Date().timeString))
    }
    
    func setMessage(message: String) {
        messages.append(Message(text: message,
                                image: nil,
                                date: "",
                                time: ""))
    }
    
    func setMessage(image: UIImage) {
        messages.append(Message(text: "",
                                image: image,
                                date: "",
                                time: ""))
    }
    
    func updateNotification() {
        self.notification += 1
    }
}

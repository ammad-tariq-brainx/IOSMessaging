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
    var image: UIImage?
    var name: String
    var message = [String]()
    var time = [String]()
    var date = [Date]()
    var notification: Int = 0
    
    init(image: String = "", name: String = "No Name") {
        
        if !image.isEmpty {
            self.image = UIImage(imageLiteralResourceName: image)
        }
        self.name = name
    }
    
    func setMessage(message: String) {
        self.message.append(message)
        setTime()
        //setDate()
        //updateNotification()
    }
    
    private func setTime() {
        self.time.append(Date().timeString)
    }
    
    private func setDate() {
        
    }
    
    func updateNotification() {
        self.notification += 1
    }
}

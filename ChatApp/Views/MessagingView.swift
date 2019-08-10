//
//  MessagingView.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-10.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class MessagingView: UIView {

    private let shadowWidth = 3.0
    private let shadowHeight = 3.0
    private let shadowOpacity: Float = 0.05
    private let shadowRadius: CGFloat = 6
    
    @IBOutlet weak var writeTextView: UIView!
    @IBOutlet weak var newMessageTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newMessageTextField.addShadow(shadowColor: UIColor.black.cgColor,
                                      shadowOffset: CGSize(width: shadowWidth, height: shadowHeight),
                                      shadowOpacity: shadowOpacity,
                                      shadowRadius: shadowRadius)
        newMessageTextField.layer.cornerRadius = 20.0
        newMessageTextField.layer.borderWidth = 1.0
        newMessageTextField.layer.borderColor = UIColor.lightGray.cgColor
    }

}

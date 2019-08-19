//
//  MessagingView.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-10.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class MessagingView: UIView {
    
    //MARK: Private Variables
    private let shadowWidth = 3.0
    private let shadowHeight = 3.0
    private let shadowOpacity: Float = 0.05
    private let shadowRadius: CGFloat = 6
    
    //MARK: Outlets
    @IBOutlet weak var newMessageView: UIView!
    @IBOutlet weak var textMessageView: UIView!
    @IBOutlet weak var newMessageTextField: UITextField!
    @IBOutlet weak var messagingTableView: UITableView!
    
    //MARK: Override Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        messageTableViewSetup()
        newMessageSetup()
    }
    
    //MARK: Private Methods
    private func messageTableViewSetup () {
        messagingTableView.rowHeight = UITableView.automaticDimension
        messagingTableView.estimatedRowHeight = UITableView.automaticDimension
        messagingTableView.tableFooterView = UIView()
    }
    
    private func newMessageSetup() {
        newMessageView.addShadow(shadowColor: UIColor.black.cgColor,
                                 shadowOffset: CGSize(width: shadowWidth, height: shadowHeight),
                                 shadowOpacity: shadowOpacity,
                                 shadowRadius: shadowRadius)
        newMessageView.layer.cornerRadius = 20.0
        newMessageView.layer.borderWidth = 1.0
        newMessageView.layer.borderColor = UIColor.lightGray.cgColor
    }
}

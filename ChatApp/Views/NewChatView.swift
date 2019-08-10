//
//  NewChatView.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-09.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class NewChatView: UIView {
    
    @IBOutlet weak var searchBarView: UISearchBar!
    @IBOutlet weak var newChatTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        newChatTableView.tableFooterView = UIView()
    }
}

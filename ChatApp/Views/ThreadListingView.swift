//
//  ThreadListingView.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-09.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class ThreadListingView: UIView {

    @IBOutlet weak var titleViewLabel: UILabel!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var searchBarView: UISearchBar!
    @IBOutlet weak var threadListingTableView: UITableView!
    var gradientLayer: CAGradientLayer!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleViewLabel.text = "Chat"
    }

}

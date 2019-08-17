//
//  MessageDateCell.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-16.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class MessageDateCell: UITableViewCell {
    
    //MARK: Outlets
    @IBOutlet weak var timeView: UILabel!
    @IBOutlet weak var dateView: UILabel!
    @IBOutlet weak var leftLineView: UIView!
    @IBOutlet weak var rightLineView: UIView!
    
    //MARK: Override Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupLine(view: leftLineView)
        setupLine(view: rightLineView)
    }
    
    //MARK: Private Methods
    private func setupLine(view: UIView) {
        view.layer.borderWidth = 1.0
        view.setBorderColor(color: UIColor(red: 0.64, green: 0.71, blue: 0.76, alpha: 0.5))
    }
    
}

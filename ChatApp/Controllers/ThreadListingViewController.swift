//
//  ViewController.swift
//  BaseComponents
//
//  Created by Hunain Shahid on 24/10/2017.
//  Copyright © 2017 Brainx Technologies. All rights reserved.
//

import UIKit

class ThreadListingViewController: UIViewController {

    var threadsArray = [ThreadDetails]()
    @IBOutlet var threadListingView: ThreadListingView!
    let gradientLayer = CAGradientLayer()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

        //initializeGradient(view: self.threadListingView.titleView)
    }
    
    private func initializeGradient(view: UIView) {
        gradientLayer.frame = view.bounds
        
        let color2 = UIColor(red:0.03, green:0.58, blue:1.00, alpha:1.0).cgColor as CGColor
        
        let color4 = UIColor(red:0.02, green:0.78, blue:0.81, alpha:1.0).cgColor as CGColor
        gradientLayer.colors = [color2, color4]
        gradientLayer.locations = [0.25, 0.90]
        
        view.layer.addSublayer(gradientLayer)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        threadsArray = ThreadManager.shared.loadData()
    }
        
}

extension ThreadListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadsArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let reusableCell = tableView.dequeueReusableCell(
                withIdentifier: "NewChat",
                for: indexPath)
            
            guard let cell = reusableCell as? ThreadsListingCell else {
                fatalError("Cannot render a cell")
            }
            cell.setData(imageString: "NewChat", text: "New Chat")
            tableView.rowHeight = 80
            return cell
        } else {
            let reusableCell = tableView.dequeueReusableCell(
                withIdentifier: "ThreadCell",
                for: indexPath)
        
            guard let cell = reusableCell as? ConversationCell else {
                fatalError("Cannot render a cell")
            }
            cell.setData(data: threadsArray[indexPath.row - 1])
            tableView.rowHeight = 60
            return cell
        }
    }
    
}

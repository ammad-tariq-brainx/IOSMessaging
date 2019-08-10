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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        threadsArray = ThreadManager.shared.loadThreads()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
         navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction
    func openContactList(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "newChatViewController") as! NewChatViewController
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController?.present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func openMessagingController(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "messagingViewController") as! MessagingViewController
        self.navigationController?.show(viewController, sender: self)
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

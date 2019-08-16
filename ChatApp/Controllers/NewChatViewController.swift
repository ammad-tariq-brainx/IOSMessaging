//
//  NewChatViewController.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-09.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class NewChatViewController: UIViewController {

    var threadsArray = [ThreadDetails]()
    @IBOutlet var newChatView: NewChatView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.title = "New Chat"
        let button1 = UIBarButtonItem(image: UIImage(named: "Close"), style: .plain, target: self, action: #selector(action))
        button1.tintColor = .lightGray
        self.navigationItem.leftBarButtonItem = button1
        threadsArray = ThreadManager.shared.loadAllContacts()
    }
    
    @objc func action () {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction
    func closeNewChat(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension NewChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let reusableCell = tableView.dequeueReusableCell(
                withIdentifier: "NewChat",
                for: indexPath)
            
            guard let cell = reusableCell as? NewChatListingCell else {
                fatalError("Cannot render a cell")
            }
            cell.setData(image: threadsArray[indexPath.row].image, text: threadsArray[indexPath.row].name)
            return cell
       
    }
    
    
}

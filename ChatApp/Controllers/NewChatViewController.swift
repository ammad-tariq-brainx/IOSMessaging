//
//  NewChatViewController.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-09.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class NewChatViewController: UIViewController {
    
    //MARK: Private Variables
    private var threadsArray = [ThreadDetails]()
    
    //MARK: Outlets
    @IBOutlet var newChatView: NewChatView!
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarSetup()
        loadData()
    }
    
    //MARK: Action Methods
    @IBAction
    func openThreadMessages(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: AppConstants.StoryboardId.main,
                                      bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: AppConstants.ControllerId.messagingViewController)
            as! MessagingViewController
        viewController.threadDetails = threadsArray[sender.tag]
        self.navigationController?.show(viewController, sender: self)
    }
    
    @objc
    func closeController () {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction
    func closeNewChat(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Private Methods
    private func navigationBarSetup() {
        if let navigation = navigationController {
            navigation.navigationBar.barTintColor = .white
        }
        self.navigationItem.title = AppConstants.Message.newChat
        let button1 = UIBarButtonItem(image: UIImage(named: AppConstants.ImageString.close),
                                      style: .plain, target: self,
                                      action: #selector(closeController))
        button1.tintColor = .lightGray
        self.navigationItem.leftBarButtonItem = button1
    }
    
    private func loadData() {
        threadsArray = ThreadManager.shared.loadThreads()
    }
}

//Extension: - UITableViewDataSource Methods
extension NewChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return threadsArray.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reusableCell = tableView.dequeueReusableCell(
            withIdentifier: AppConstants.Identifier.newChat,
            for: indexPath)
        
        guard let cell = reusableCell as? ContactsListingCell else {
           Utils.showOkAlert(title: AppConstants.Title.error, message: AppConstants.Message.cannotRenderCell, viewController: self)
            return UITableViewCell()
        }
        cell.openMessagesButton.tag = indexPath.row
        cell.setData(image: threadsArray[indexPath.row].image,
                     text: threadsArray[indexPath.row].name)
        return cell
    }
}

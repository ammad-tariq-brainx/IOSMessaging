//
//  ViewController.swift
//  BaseComponents
//
//  Created by Hunain Shahid on 24/10/2017.
//  Copyright © 2017 Brainx Technologies. All rights reserved.
//

import UIKit

class ThreadListingViewController: UIViewController {
    
    //MARK: Private Variables
    private var threadsArray = [ThreadDetails]()
    
    //MARK: Outlets
    @IBOutlet var threadListingView: ThreadListingView!
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if let navigation = navigationController {          navigation.setNavigationBarHidden(true, animated: false)
        }
        loadData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //MARK: Action Methods
    @IBAction
    func openContactList(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: AppConstants.StoryboardId.main,
                                      bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: AppConstants.ControllerId.newChatViewController)
            as! NewChatViewController
        let navigationController = UINavigationController(rootViewController: viewController)
        self.navigationController?.present(navigationController,
                                           animated: true,
                                           completion: nil)
    }
    
    @IBAction
    func openMessagingController(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: AppConstants.StoryboardId.main,
                                      bundle: Bundle.main)
        let viewController = storyBoard.instantiateViewController(withIdentifier: AppConstants.ControllerId.messagingViewController)
            as! MessagingViewController
        viewController.threadDetails = threadsArray[sender.tag]
        self.navigationController?.show(viewController, sender: self)
    }
    
    //MARK: Private Methods
    private func loadData() {
        threadsArray = ThreadManager.shared.loadThreads()
    }
}

//Extension: - UITableViewDataSource Methods
extension ThreadListingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return threadsArray.count + 1
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let reusableCell = tableView.dequeueReusableCell(
                withIdentifier: AppConstants.Identifier.newChat,
                for: indexPath)
            
            guard let cell = reusableCell as? NewChatCell else {
                Utils.showOkAlert(title: AppConstants.Title.error,
                                  message: AppConstants.Message.cannotRenderCell,
                                  viewController: self)
                return UITableViewCell()
            }
            cell.setData(imageString: AppConstants.ImageString.newChat, text: AppConstants.Message.newChat)
            tableView.rowHeight = 60
            return cell
        } else {
            let reusableCell = tableView.dequeueReusableCell(
                withIdentifier: AppConstants.Identifier.threadCell,
                for: indexPath)
            
            guard let cell = reusableCell as? ThreadsListingCell else {
                Utils.showOkAlert(title: AppConstants.Title.error,
                                  message: AppConstants.Message.cannotRenderCell,
                                  viewController: self)
                return UITableViewCell()
            }
            cell.openMessageButton.tag = indexPath.row - 1
            cell.setData(data: threadsArray[indexPath.row - 1])
            tableView.rowHeight = 60
            return cell
        }
    }
}

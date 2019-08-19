//
//  MessagingViewController.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-10.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class MessagingViewController: UIViewController {
    
    //MARK: Variables
    var threadDetails: ThreadDetails?
    
    //MARK: Outlets
    @IBOutlet var messagingView: MessagingView!
    
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        keyboardSetup()
        navigationBarSetup()
        LoaderManager.show(messagingView, message: AppConstants.Message.loading)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            LoaderManager.hide(self.messagingView)
            self.scrollToBottom()
        }
    }
    
    //MARK: Action Methods
    @IBAction func sendMessage(_ sender: UIButton) {
        if let message = messagingView.newMessageTextField.text {
            if !message.isEmpty {
                threadDetails?.setMessage(message: message)
                messagingView.newMessageTextField.text = ""
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
                    self.messagingView.messagingTableView.reloadData()
                    self.scrollToBottom()
                }
            }
        }
    }
    
    @objc
    func keyboardWillShow(notification:NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey]
            as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc
    func keyboardWillHide(notification:NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc
    func closeController () {
        if let navigation = navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: Private Methods
    private func scrollToBottom(){
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: (self.threadDetails?.messages.count)!-1, section: 0)
            self.messagingView.messagingTableView.scrollToRow(at: indexPath,
                                                              at: .bottom, animated: true)
        }
    }
    
    private func navigationBarSetup() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            if let navigation = self.navigationController {
                navigation.setNavigationBarHidden(false, animated: false)
                navigation.navigationBar.barTintColor = .white
            }
            if let thread = self.threadDetails {
                self.navigationItem.title = thread.name
                let button1 = UIBarButtonItem(image: UIImage(named: AppConstants.ImageString.back), style: .plain, target: self, action: #selector(self.closeController))
                button1.tintColor = .lightGray
                self.navigationItem.leftBarButtonItem = button1
                if let image = thread.image {
                    let button2 = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
                    self.navigationItem.rightBarButtonItem = button2
                }
            }
        }
    }
    
    private func keyboardSetup() {
        self.hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                 action: #selector(MessagingViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        messagingView.messagingTableView.addGestureRecognizer(tap)
    }
}

//Extension: - UITableViewDataSource Methods
extension MessagingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return (threadDetails?.messages.count)!
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let thread = threadDetails {
            if !thread.messages.isEmpty {
                if thread.name == AppConstants.Name.mariaJane {
                    if indexPath.row == 0 || indexPath.row == 4 {
                        let reusableCell = tableView.dequeueReusableCell(
                            withIdentifier: AppConstants.Identifier.dateCell,
                            for: indexPath)
                        
                        guard let cell = reusableCell as? MessageDateCell else {
                            Utils.showOkAlert(title: AppConstants.Title.error,
                                              message: AppConstants.Message.cannotRenderCell,
                                              viewController: self)
                            return UITableViewCell()
                        }
                        cell.setData(date: thread.messages[indexPath.row].date,
                                     time: thread.messages[indexPath.row].time)
                        return cell
                    }
                }
                if !thread.messages[indexPath.row].text.isEmpty {
                    if indexPath.row == 2 {
                        let reusableCell = tableView.dequeueReusableCell(
                            withIdentifier: AppConstants.Identifier.receiverTextMessage,
                            for: indexPath)
                        
                        guard let cell = reusableCell as? ReceiverTextMessageCell else {
                            Utils.showOkAlert(title: AppConstants.Title.error,
                                              message: AppConstants.Message.cannotRenderCell,
                                              viewController: self)
                            return UITableViewCell()
                        }
                        cell.setData(text: thread.messages[indexPath.row].text)
                        return cell
                    } else {
                        let reusableCell = tableView.dequeueReusableCell(
                            withIdentifier: AppConstants.Identifier.senderTextMessage,
                            for: indexPath)
                        
                        guard let cell = reusableCell as? SenderTextMessageCell else {
                            Utils.showOkAlert(title: AppConstants.Title.error,
                                              message: AppConstants.Message.cannotRenderCell,
                                              viewController: self)
                            return UITableViewCell()
                        }
                        if let image = thread.image {
                            cell.setData( image: image,
                                          text: thread.messages[indexPath.row].text)
                        }
                        return cell
                    }
                } else if indexPath.row % 2 == 1{
                    let reusableCell = tableView.dequeueReusableCell(
                        withIdentifier: AppConstants.Identifier.senderImageMessage,
                        for: indexPath)
                    
                    guard let cell = reusableCell as? SenderImageMessageCell else {
                        Utils.showOkAlert(title: AppConstants.Title.error,
                                          message: AppConstants.Message.cannotRenderCell,
                                          viewController: self)
                        return UITableViewCell()
                    }
                    if let image = thread.messages[indexPath.row].image {
                        if let contactImage = thread.image {
                            cell.setData( senderImage: contactImage,
                                          messageImage: image)
                        }
                    }
                    return cell
                } else {
                    let reusableCell = tableView.dequeueReusableCell(
                        withIdentifier: AppConstants.Identifier.receiverImageMessage,
                        for: indexPath)
                    
                    guard let cell = reusableCell as? ReceiverImageMessageCell else {
                        Utils.showOkAlert(title: AppConstants.Title.error,
                                          message: AppConstants.Message.cannotRenderCell,
                                          viewController: self)
                        return UITableViewCell()
                    }
                    if let image = thread.messages[indexPath.row].image {
                        cell.setData(image: image)
                    }
                    return cell
                }
            } else {
                return UITableViewCell()
            }
        } else {
            return UITableViewCell()
        }
    }
}

//Extension: - UIImagePickerControllerDelegate Methods
extension MessagingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction
    func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        messagingView.newMessageTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController,
                animated: true,
                completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as?  UIImage else {
            Utils.showOkAlert(title: AppConstants.Title.error,
                              message: AppConstants.Message.errorLoadingImage,
                              viewController: self)
            return
        }
        LoaderManager.show(messagingView, message: AppConstants.Message.sendingImage)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            self.threadDetails?.setMessage(image: selectedImage)
            self.messagingView.messagingTableView.reloadData()
            LoaderManager.hide(self.messagingView)
            self.scrollToBottom()
        }
        dismiss (animated: true, completion: nil)
    }
}

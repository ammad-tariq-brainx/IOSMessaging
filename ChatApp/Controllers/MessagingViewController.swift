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
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.0) {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
            self.navigationController?.navigationBar.barTintColor = .white
            self.navigationItem.title = self.threadDetails?.name
            let button1 = UIBarButtonItem(image: UIImage(named: "Back"), style: .plain, target: self, action: #selector(self.action))
            button1.tintColor = .lightGray
            self.navigationItem.leftBarButtonItem = button1
            
            let button2 = UIBarButtonItem(image: self.threadDetails?.image?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
            button1.tintColor = .lightGray
            self.navigationItem.rightBarButtonItem = button2
        }
    }
    
    //MARK: Action Methods
    @objc
    func keyboardWillShow(notification:NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
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
    func action () {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: Private Methods
    private func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MessagingViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        messagingView.messagingTableView.addGestureRecognizer(tap)
    }
}

//Extension: - UITableViewDataSource Methods
extension MessagingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 || indexPath.row == 4 {
            let reusableCell = tableView.dequeueReusableCell(
                withIdentifier: "dateCell",
                for: indexPath)
            
            guard let cell = reusableCell as? MessageDateCell else {
                fatalError("Cannot render a cell")
            }
            
            return cell
        } else if indexPath.row == 5 {
            let reusableCell = tableView.dequeueReusableCell(
                withIdentifier: "senderImageMessage",
                for: indexPath)
            
            guard let cell = reusableCell as? SenderImageMessageCell else {
                Utils.showOkAlert(title: AppConstants.Title.error, message: AppConstants.Message.cannotRenderCell, viewController: self)
                return UITableViewCell()
            }
            cell.setData( senderImage: threadDetails!.image!, messageImage: threadDetails!.image!)
            return cell
        } else if indexPath.row == 6 {
            let reusableCell = tableView.dequeueReusableCell(
                withIdentifier: "receiverImageMessage",
                for: indexPath)
            
            guard let cell = reusableCell as? ReceiverImageMessageCell else {
                Utils.showOkAlert(title: AppConstants.Title.error, message: AppConstants.Message.cannotRenderCell, viewController: self)
                return UITableViewCell()
            }
            cell.setData( image: threadDetails!.image!)
            return cell
        } else if indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 7 {
            let reusableCell = tableView.dequeueReusableCell(
                withIdentifier: "receiverTextMessage",
                for: indexPath)
            
            guard let cell = reusableCell as? ReceiverTextMessageCell else {
                Utils.showOkAlert(title: AppConstants.Title.error, message: AppConstants.Message.cannotRenderCell, viewController: self)
                return UITableViewCell()
            }
            cell.setData( text: (threadDetails?.message[0])!)
            return cell
        } else {
            let reusableCell = tableView.dequeueReusableCell(
                withIdentifier: "senderTextMessage",
                for: indexPath)
            
            guard let cell = reusableCell as? SenderTextMessageCell else {
                Utils.showOkAlert(title: AppConstants.Title.error, message: AppConstants.Message.cannotRenderCell, viewController: self)
                return UITableViewCell()
            }
            cell.setData( image: threadDetails!.image!, text: (threadDetails?.message[2])!)
            return cell
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
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        dismiss (animated: true, completion: nil)
    }
}

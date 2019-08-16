//
//  MessagingViewController.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-10.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class MessagingViewController: UIViewController {

    var threadDetails: ThreadDetails?
    
    var messages = [
        Message(message: "Awais", image: nil),
        Message(message: "", image: UIImage(named: "DenKlenkov")),
        Message(message: "", image: UIImage(named: "DenKlenkov")),
        Message(message: "Awais", image: nil),
        Message(message: "Awais", image: nil),
        Message(message: "Awais", image: nil)
    ]
    
    
    @IBOutlet weak var newTextMessageBottomConstraint: NSLayoutConstraint!
    @IBOutlet var messagingView: MessagingView!
    
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

        
        messagingView.messagingTableView.transform = CGAffineTransform(scaleX: 1, y: -1)
        //threadsArray = ThreadManager.shared.loadAllData()
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
    
    @objc
    func keyboardWillShow(notification:NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @objc func action () {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension MessagingViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(MessagingViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        messagingView.messagingTableView.addGestureRecognizer(tap)
    }
    
    @objc
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension MessagingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let message = messages[indexPath.row] as? Message {
            if let image = message.image {
                let reusableCell = tableView.dequeueReusableCell(
                    withIdentifier: "senderImageMessage",
                    for: indexPath)
    
                guard let cell = reusableCell as? SenderImageMessageCell else {
                    fatalError("Cannot render a cell")
                }
                cell.setData( senderImage: threadDetails!.image!, messageImage: threadDetails!.image!)
                //tableView.rowHeight = 130
                cell.transform = CGAffineTransform(scaleX: 1, y: -1)
                return cell
            } else {
                
            }
        }
        
//        if indexPath.row == 0 || indexPath.row == 4 {
//            let reusableCell = tableView.dequeueReusableCell(
//                withIdentifier: "dateCell",
//                for: indexPath)
//
//            guard let cell = reusableCell as? MessageDateCell else {
//                fatalError("Cannot render a cell")
//            }
//
//            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
//            //tableView.rowHeight = 151
//            return cell
//        } else if indexPath.row == 5 {
//            let reusableCell = tableView.dequeueReusableCell(
//                withIdentifier: "senderImageMessage",
//                for: indexPath)
//
//            guard let cell = reusableCell as? SenderImageMessageCell else {
//                fatalError("Cannot render a cell")
//            }
//            cell.setData( senderImage: threadDetails!.image!, messageImage: threadDetails!.image!)
//            //tableView.rowHeight = 130
//            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
//            return cell
//        } else if indexPath.row == 6 {
//            let reusableCell = tableView.dequeueReusableCell(
//                withIdentifier: "receiverImageMessage",
//                for: indexPath)
//
//            guard let cell = reusableCell as? ReceiverImageMessageCell else {
//                fatalError("Cannot render a cell")
//            }
//            cell.setData( image: threadDetails!.image!)
//            //tableView.rowHeight = 130
//            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
//            return cell
//        } else if indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 7 {
//            let reusableCell = tableView.dequeueReusableCell(
//                withIdentifier: "receiverTextMessage",
//                for: indexPath)
//
//            guard let cell = reusableCell as? ReceiverTextMessageCell else {
//                fatalError("Cannot render a cell")
//            }
//            cell.setData( text: (threadDetails?.message[0])!)
//            //tableView.rowHeight = 130
//            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
//            return cell
//        } else {
//            let reusableCell = tableView.dequeueReusableCell(
//                withIdentifier: "senderTextMessage",
//                for: indexPath)
//
//            guard let cell = reusableCell as? SenderTextMessageCell else {
//                fatalError("Cannot render a cell")
//            }
//            cell.setData( image: threadDetails!.image!, text: (threadDetails?.message[2])!)
//            //tableView.rowHeight = 130
//            cell.transform = CGAffineTransform(scaleX: 1, y: -1)
//            return cell
//        }
    }
}

extension MessagingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        messagingView.newMessageTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as?  UIImage else {
            fatalError("Expected a dictionary containing an image, but as provided the following: \(info)")
        }
  
        dismiss (animated: true, completion: nil)
    }
}

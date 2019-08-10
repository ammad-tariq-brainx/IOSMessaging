//
//  MessagingViewController.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-10.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import UIKit

class MessagingViewController: UIViewController {

    var threadsArray = [ThreadDetails]()
    
    @IBOutlet var messagingView: MessagingView!
    override func viewDidLoad() {
        super.viewDidLoad()

        threadsArray = ThreadManager.shared.loadAllData()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.navigationController?.setNavigationBarHidden(false, animated: false)
            self.navigationItem.title = self.threadsArray[0].name
            let button1 = UIBarButtonItem(image: UIImage(named: "Back"), style: .plain, target: self, action: #selector(self.action))
            button1.tintColor = .lightGray
            self.navigationItem.leftBarButtonItem = button1
            
            let button2 = UIBarButtonItem(image: self.threadsArray[0].image?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: nil)
            button1.tintColor = .lightGray
            self.navigationItem.rightBarButtonItem = button2
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        
    }
    
    @objc func action () {
        self.navigationController?.popViewController(animated: true)
    }

}

//
//  ThreadManager.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-09.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import Foundation
import UIKit

class ThreadManager {
    
    //MARK: Static Variable
    static let shared = ThreadManager()
    
    //MARK: Private Initializer
    private init() {
    }
    
    //MARK: Methods
    func loadThreads() -> [ThreadDetails] {
        
        var threads = [ThreadDetails]()
        var singleThread = ThreadDetails(image: AppConstants.ImageString.mariaJane,
                                         name: AppConstants.Name.mariaJane)
        singleThread.setTime()
        singleThread.setMessage(message: AppConstants.Message.iLikeToWorkWithYou)
        singleThread.setMessage(message: AppConstants.Message.iLikeToWorkWithYou)
        singleThread.setMessage(message: AppConstants.Message.manyHaveUnsuccessfullyLaunched)
        singleThread.setTime()
        singleThread.setMessage(message: AppConstants.Message.iLikeToWorkWithYou)
        singleThread.setMessage(message: AppConstants.Message.manyHaveUnsuccessfullyLaunched)
        singleThread.updateNotification()
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: AppConstants.ImageString.tamannaSadh,
                                     name: AppConstants.Name.tamannaSadh)
        singleThread.setMessage(message: AppConstants.Message.iLikeToWorkWithYou)
        singleThread.setMessage(image: UIImage(imageLiteralResourceName: AppConstants.ImageString.tamannaSadh))
        singleThread.setMessage(image: UIImage(imageLiteralResourceName: AppConstants.ImageString.tamannaSadh))
        singleThread.setMessage(message: AppConstants.Message.manyHaveUnsuccessfullyLaunched)
        singleThread.setMessage(message: AppConstants.Message.iLikeToWorkWithYou)
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: AppConstants.ImageString.shakiraJethi,
                                     name: AppConstants.Name.shakiraJethi)
        for _ in 0..<5 {
            singleThread.setMessage(message: AppConstants.Message.iLikeToWorkWithYou)
        }
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: AppConstants.ImageString.zhenyaRynzhuk,
                                     name: AppConstants.Name.zhenyaRynzhuk)
        for _ in 0..<5 {
            singleThread.setMessage(message: AppConstants.Message.doYouWantToWorkWithMe)
        }
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: AppConstants.ImageString.denKlenkov,
                                     name: AppConstants.Name.denKlenkov)
        for _ in 0..<5 {
            singleThread.setMessage(message: AppConstants.Message.howYouDoThat)
        }
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: AppConstants.ImageString.jummonSadik,
                                     name: AppConstants.Name.jummonSadik)
        for _ in 0..<5 {
            singleThread.setMessage(message: AppConstants.Message.howYouDoThat)
        }
        threads.append(singleThread)
        return threads
    }
}

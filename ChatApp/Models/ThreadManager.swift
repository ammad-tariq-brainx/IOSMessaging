//
//  ThreadManager.swift
//  ChatApp
//
//  Created by BrainX IOS 4 on 2019-08-09.
//  Copyright © 2019 BrainX Technologies. All rights reserved.
//

import Foundation

class ThreadManager {
    
    //MARK: Static Variable
    static let shared = ThreadManager()
    
    //MARK: Private Initializer
    private init() {
    }
    
    //MARK: Methods
    func loadAllContacts() -> [ThreadDetails] {
        
        var threads = [ThreadDetails]()
        var singleThread = ThreadDetails(image: AppConstants.ImageString.mariaJane,
                                         name: AppConstants.Name.mariaJane)
        threads.append(singleThread)
        singleThread = ThreadDetails(image: AppConstants.ImageString.denKlenkov,
                                     name: AppConstants.Name.denKlenkov)
        threads.append(singleThread)
        singleThread = ThreadDetails(image: AppConstants.ImageString.jummonSadik,
                                     name: AppConstants.Name.jummonSadik)
        threads.append(singleThread)
        singleThread = ThreadDetails(image: AppConstants.ImageString.tamannaSadh,
                                     name: AppConstants.Name.tamannaSadh)
        threads.append(singleThread)
        singleThread = ThreadDetails(image: AppConstants.ImageString.shakiraJethi,
                                     name: AppConstants.Name.shakiraJethi)
        threads.append(singleThread)
        singleThread = ThreadDetails(image: AppConstants.ImageString.zhenyaRynzhuk,
                                     name: AppConstants.Name.zhenyaRynzhuk)
        threads.append(singleThread)
        singleThread = ThreadDetails(image: AppConstants.ImageString.tamannaSadh,
                                     name: AppConstants.Name.tamannaSadh)
        threads.append(singleThread)
        singleThread = ThreadDetails(image: AppConstants.ImageString.denKlenkov,
                                     name: AppConstants.Name.denKlenkov)
        threads.append(singleThread)
        singleThread = ThreadDetails(image: AppConstants.ImageString.jummonSadik,
                                     name: AppConstants.Name.jummonSadik)
        threads.append(singleThread)
        singleThread = ThreadDetails(image: AppConstants.ImageString.denKlenkov,
                                     name: AppConstants.Name.denKlenkov)
        threads.append(singleThread)
        return threads
    }
    
    func loadThreads() -> [ThreadDetails] {
        
        var threads = [ThreadDetails]()
        var singleThread = ThreadDetails(image: AppConstants.ImageString.mariaJane,
                                         name: AppConstants.Name.mariaJane)
        singleThread.setMessage(message: AppConstants.Message.iLikeToWorkWithYou)
        singleThread.setMessage(message: AppConstants.Message.iLikeToWorkWithYou)
        singleThread.setMessage(message: AppConstants.Message.manyHaveUnsuccessfullyLaunched)
        singleThread.setMessage(message: AppConstants.Message.iLikeToWorkWithYou)
        singleThread.setMessage(message: AppConstants.Message.manyHaveUnsuccessfullyLaunched)
        singleThread.updateNotification()
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: AppConstants.ImageString.tamannaSadh,
                                     name: AppConstants.Name.tamannaSadh)
        singleThread.setMessage(message: AppConstants.Message.iLikeToWorkWithYou)
        singleThread.setMessage(message: AppConstants.Message.manyHaveUnsuccessfullyLaunched)
        singleThread.setMessage(message: AppConstants.Message.iLikeToWorkWithYou)
        singleThread.setMessage(message: AppConstants.Message.manyHaveUnsuccessfullyLaunched)
        singleThread.setMessage(message: AppConstants.Message.iLikeToWorkWithYou)
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: AppConstants.ImageString.shakiraJethi,
                                     name: AppConstants.Name.shakiraJethi)
        for _ in 0..<5 {
            singleThread.setMessage(message: "I like to work with you")
        }
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: AppConstants.ImageString.zhenyaRynzhuk,
                                     name: AppConstants.Name.zhenyaRynzhuk)
        for _ in 0..<5 {
            singleThread.setMessage(message: "Do you want to work with me? Surely we can make up things together")
        }
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: AppConstants.ImageString.denKlenkov,
                                     name: AppConstants.Name.denKlenkov)
        for _ in 0..<5 {
            singleThread.setMessage(message: "How you do that?")
        }
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: AppConstants.ImageString.jummonSadik,
                                     name: AppConstants.Name.jummonSadik)
        for _ in 0..<5 {
            singleThread.setMessage(message: "New Chat")
        }
        threads.append(singleThread)
        return threads
    }
}

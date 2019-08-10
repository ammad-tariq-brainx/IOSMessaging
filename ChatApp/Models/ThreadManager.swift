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
    
    func loadData() -> [ThreadDetails]{
        var threads = [ThreadDetails]()

        var singleThread = ThreadDetails(image: "MariaJane", name: "Maria Jane")
        singleThread.setMessage(message: "Hey what's up?")
        singleThread.updateNotification()
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "TamannaSadh", name: "Tamanna Sadh")
        singleThread.setMessage(message: "Hey are you there???")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "ShakiraJethi", name: "Shakira Jethi")
        singleThread.setMessage(message: "I like to work with you")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "zhenyaRynzhuk", name: "Zhenya Rynzhuk")
        singleThread.setMessage(message: "Do you want to work with me? Surely we can make up things together")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "DenKlenkov", name: "Den Klenkov")
        singleThread.setMessage(message: "How you do that?")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "JummonSadik", name: "Jummon Sadik")
        singleThread.setMessage(message: "New Chat")
        threads.append(singleThread)
        return threads
    }
}

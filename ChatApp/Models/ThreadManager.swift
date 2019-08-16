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
    
    func loadAllContacts() -> [ThreadDetails] {
        var threads = [ThreadDetails]()
        
        var singleThread = ThreadDetails(image: "MariaJane", name: "Maria Jane")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "DenKlenkov", name: "Den Klenkov")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "JummonSadik", name: "Jummon Sadik")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "TamannaSadh", name: "Tamanna Sadh")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "ShakiraJethi", name: "Shakira Jethi")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "zhenyaRynzhuk", name: "Zhenya Rynzhuk")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "TamannaSadh", name: "Tamanna Sadh")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "DenKlenkov", name: "Den Klenkov")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "JummonSadik", name: "Jummon Sadik")
        threads.append(singleThread)
        singleThread = ThreadDetails(image: "DenKlenkov", name: "Den Klenkov")
        threads.append(singleThread)
        return threads
    }
    
    func loadThreads() -> [ThreadDetails] {
        var threads = [ThreadDetails]()

        var singleThread = ThreadDetails(image: "MariaJane", name: "Maria Jane")
        singleThread.setMessage(message: "I like to work with you")
        singleThread.setMessage(message: "I like to work with you")
        singleThread.setMessage(message: "Many have unsuccessfully launched a business venture that is internet base but only a handful")
        singleThread.setMessage(message: "I like to work with you")
        singleThread.setMessage(message: "Many have unsuccessfully launched a business venture that is internet base but only a handful")
        singleThread.updateNotification()
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: "TamannaSadh", name: "Tamanna Sadh")
        singleThread.setMessage(message: "I like to work with you")
        singleThread.setMessage(message: "Many have unsuccessfully launched a business venture that is internet base but only a handful")
        singleThread.setMessage(message: "I like to work with you")
        singleThread.setMessage(message: "Many have unsuccessfully launched a business venture that is internet base but only a handful")
        singleThread.setMessage(message: "I like to work with you")
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: "ShakiraJethi", name: "Shakira Jethi")
        for _ in 0..<5 {
            singleThread.setMessage(message: "I like to work with you")
        }
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: "zhenyaRynzhuk", name: "Zhenya Rynzhuk")
        for _ in 0..<5 {
            singleThread.setMessage(message: "Do you want to work with me? Surely we can make up things together")
        }
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: "DenKlenkov", name: "Den Klenkov")
        for _ in 0..<5 {
            singleThread.setMessage(message: "How you do that?")
        }
        threads.append(singleThread)
        
        singleThread = ThreadDetails(image: "JummonSadik", name: "Jummon Sadik")
        for _ in 0..<5 {
            singleThread.setMessage(message: "New Chat")
        }
        threads.append(singleThread)
        return threads
    }
}

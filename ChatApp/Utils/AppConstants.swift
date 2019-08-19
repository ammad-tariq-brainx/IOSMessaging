//
//  AppConstants.swift
//  BaseComponents
//
//  Created by Hunain Shahid on 28/06/2018.
//  Copyright © 2018 Brainx Technologies. All rights reserved.
//

import Foundation

class AppConstants {
    
    struct Title {
        static let title = "Title"
        static let error = "Error"
    }
    
    struct Message {
        static let message = "Message"
        static let cannotRenderCell = "Cannot Render a Cell"
        static let iLikeToWorkWithYou = "I like to work with you"
        static let manyHaveUnsuccessfullyLaunched = "Many have unsuccessfully launched a business venture that is internet base but only a handful"
        static let doYouWantToWorkWithMe = "Do you want to work with me?"
        static let howYouDoThat = "How you do that?"
        static let newChat = "New Chat"
        static let chat = "Chat"
    }
    
    struct StoryboardId {
        static let main = "Main"
    }
    
    struct ControllerId {
        static let mainViewController = "mainViewController"
        static let newChatViewController = "newChatViewController"
        static let messagingViewController = "messagingViewController"
    }
    
    struct Identifier {
        static let newChat = "NewChat"
        static let threadCell = "ThreadCell"
        static let dateCell = "dateCell"
        static let senderImageMessage = "senderImageMessage"
        static let receiverImageMessage = "receiverImageMessage"
        static let senderTextMessage = "senderTextMessage"
        static let receiverTextMessage = "receiverTextMessage"
    }
    
    struct Endpoint {
        static let baseURL = "https://www.baseurl.com"
        static let loginURL = baseURL + "/login"
        static let signupURL = baseURL + "/signup"
    }
    
    struct Segue {
        static let toMainController = "mainController"
    }
    
    struct Name {
        static let mariaJane = "Maria Jane"
        static let denKlenkov = "Den Klenkov"
        static let jummonSadik = "Jummon Sadik"
        static let tamannaSadh = "Tamanna Sadh"
        static let shakiraJethi = "Shakira Jethi"
        static let zhenyaRynzhuk = "Zhenya Rynzhuk"
    }
    
    struct ImageString {
        static let mariaJane = "MariaJane"
        static let denKlenkov = "DenKlenkov"
        static let jummonSadik = "JummonSadik"
        static let tamannaSadh = "TamannaSadh"
        static let shakiraJethi = "ShakiraJethi"
        static let zhenyaRynzhuk = "zhenyaRynzhuk"
        static let newChat = "NewChat"
        static let close = "Close"
        static let back = "Back"
        static let backgroundGradient = "BackgroundGradient"
    }
}

//
//  SetupWebModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 13/08/22.
//

import Foundation

struct Webpushes: Codable {
    let settings: Settings
}

// MARK: - Settings
struct Settings: Codable {
    let site: Site
    let allowNotification: AllowNotification
    let welcomeNotification: WelcomeNotification
    
    enum CodingKeys: String, CodingKey {
        case site
        case allowNotification = "allow_notification"
        case welcomeNotification = "welcome_notification"
    }
}

// MARK: - AllowNotification
struct AllowNotification: Codable {
    let messageText, allowButtonText, denyButtonText: String
    
    enum CodingKeys: String, CodingKey {
        case messageText = "message_text"
        case allowButtonText = "allow_button_text"
        case denyButtonText = "deny_button_text"
    }
}

// MARK: - Site
struct Site: Codable {
    let name: String
    let address, urlIcon: String
    
    enum CodingKeys: String, CodingKey {
        case name, address
        case urlIcon = "url_icon"
    }
}

// MARK: - WelcomeNotification
struct WelcomeNotification: Codable {
    let messageTitle, messageText: String
    let enableURLRedirect: Int
    let urlRedirect: String
    
    enum CodingKeys: String, CodingKey {
        case messageTitle = "message_title"
        case messageText = "message_text"
        case enableURLRedirect = "enable_url_redirect"
        case urlRedirect = "url_redirect"
    }
}


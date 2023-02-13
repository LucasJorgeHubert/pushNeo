//
//  SetupEmailModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 14/08/22.
//

import Foundation

// MARK: - EmailPushes
struct EmailPushes: Codable {
    let settings: EmailSettings
}

// MARK: - Settings
struct EmailSettings: Codable {
    let server: Server
    let sender: Sender
    let emailTemplates: [EmailTemplate]
    
    enum CodingKeys: String, CodingKey {
        case server, sender
        case emailTemplates = "email_templates"
    }
}

// MARK: - EmailTemplate
struct EmailTemplate: Codable {
    let name: String
    let uri: String
}

// MARK: - Sender
struct Sender: Codable {
    let name, email: String
}

// MARK: - Server
struct Server: Codable {
    let smtpName, smptPort, userLogin, userPassword: String
    
    enum CodingKeys: String, CodingKey {
        case smtpName = "smtp_name"
        case smptPort = "smpt_port"
        case userLogin = "user_login"
        case userPassword = "user_password"
    }
}

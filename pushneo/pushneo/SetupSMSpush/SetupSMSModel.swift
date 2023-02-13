//
//  SetupSMSModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 13/08/22.
//

import Foundation

// MARK: - SMSpushes
struct SMSpushes: Codable {
    let settings: SMSSettings
}

// MARK: - Settings
struct SMSSettings: Codable {
    let smsProvider: SMSProvider
    
    enum CodingKeys: String, CodingKey {
        case smsProvider = "sms_provider"
    }
}

// MARK: - SMSProvider
struct SMSProvider: Codable {
    let name, login, password: String
}

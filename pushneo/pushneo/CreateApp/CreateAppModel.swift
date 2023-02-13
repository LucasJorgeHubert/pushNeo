//
//  CreateAppModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 13/08/22.
//

import Foundation

struct AppCreatedResponse: Decodable {
    let appID: Int
    let appToken: String
    
    enum CodingKeys: String, CodingKey {
        case appID = "app_id"
        case appToken = "app_token"
    }
}

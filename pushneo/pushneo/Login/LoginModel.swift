//
//  LoginModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 12/08/22.
//

import Foundation

class IsValidLogin {
    var validEmail: Bool = false
    var validPassword: Bool = false
    
    func allParametersAreValids() -> Bool {
        return validEmail && validPassword
    }
}


struct AuthLogin: Decodable {
    
    // MARK: - Properties
    let token: String
    let user: UserLogin
    
}

struct UserLogin: Decodable {
    
    // MARK: - Properties
    let id: Int
    let name: String
    let email: String
}

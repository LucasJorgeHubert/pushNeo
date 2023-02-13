//
//  RegisterModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 12/08/22.
//

import Foundation

class IsValidRegister {
    var validFullname: Bool = false
    var validEmail: Bool = false
    var validPassword: Bool = false
    
    func allParametersAreValids() -> Bool {
        return validFullname && validEmail && validPassword
    }
}

struct AuthRegister {
    var fullname: String
    var email: String
    var password: String
    var companyName: String
    var companyAddress: String
    var companyTellphone: String
}

struct AuthRegisterResponse: Decodable {
    var id: Int
}

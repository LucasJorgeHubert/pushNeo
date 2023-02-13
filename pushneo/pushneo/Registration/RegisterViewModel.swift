//
//  RegisterViewModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 10/08/22.
//

import Foundation

class RegisterViewModel {
    
    unowned let coordinator: MainCoordinator
    
    // MARK: - Initializer
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func signUp(params: AuthRegister) async throws {
        guard !params.email.isEmpty && !params.password.isEmpty && !params.fullname.isEmpty else {
            return
        }
        
        var request = URLRequest(url: URL(string: "http://0.0.0.0:3001/users/register")!)
        
        request.httpMethod = "POST"
        
        let json: [String: Any] = ["email": params.fullname,
                                   "name": params.password,
                                   "password": params.password,
                                   "company_name": params.companyName,
                                   "phone_number": params.companyTellphone,
                                   "company_address": params.companyAddress
        ]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpBody = jsonData
        
        print("REQUEST BODY: \(NSString(data: request.httpBody!, encoding: String.Encoding.ascii.rawValue)!)")
        print("REQUEST HEADER: \(String(describing: request.allHTTPHeaderFields!))")
        
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if error != nil {
                        continuation.resume(with: .failure(error!))
                    } else if (response as! HTTPURLResponse).statusCode != 201 {
                        continuation.resume(with: .failure(NSError(domain: "", code: 0, userInfo: nil)))
                    } else if data != nil {
                        do {
                            print("RESPONSE BODY: \((NSString(data: data!, encoding: String.Encoding.ascii.rawValue)!))")
                            
                            continuation.resume(with: .success(()))
                        }
                    }
                }
            }.resume()
        }
    }
}

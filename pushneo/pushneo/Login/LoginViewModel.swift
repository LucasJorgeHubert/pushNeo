//
//  LoginViewModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 11/08/22.
//

import Foundation

class LoginViewModel {
    
    unowned let coordinator: MainCoordinator
    
    // MARK: - Initializer
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func signIn(email: String, password: String, stayLoggedIn: Bool) async throws {
        
        var request = URLRequest(url: URL(string: "http://0.0.0.0:3001/login")!)
        
        request.httpMethod = "POST"
        
        let json: [String: Any] = ["login": email,
                                   "password": password]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpBody = jsonData
        
        print("REQUEST BODY: \(NSString(data: request.httpBody!, encoding: String.Encoding.ascii.rawValue)!)")
        print("REQUEST HEADER: \(String(describing: request.allHTTPHeaderFields!))")
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if error != nil {
                        continuation.resume(with: .failure(error!))
                    } else if (response as! HTTPURLResponse).statusCode != 200 {
                        continuation.resume(with: .failure(NSError(domain: "", code: 0, userInfo: nil)))
                    } else if let data = data {
                        do {
                            let signInResponse = try JSONDecoder().decode(AuthLogin.self, from: data)
                            
                            if stayLoggedIn {
                                UserDefaults.standard.setValue(signInResponse.token, forKey: "token")
                                UserDefaults.standard.synchronize()
                            }
                            
                            print("RESPONSE BODY: \((NSString(data: data, encoding: String.Encoding.ascii.rawValue)!))")
                            
                            continuation.resume(with: .success(()))
                        } catch {
                            continuation.resume(with: .failure(error))
                        }
                    }
                }
            }.resume()
        }
        
    }
}

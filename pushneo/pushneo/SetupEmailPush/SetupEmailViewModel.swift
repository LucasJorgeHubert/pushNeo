//
//  SetupEmailViewModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 14/08/22.
//

import Foundation

class SetupEmailViewModel {
    let coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func createEmailPush(data: EmailPushes) async throws {
        let id = String(UserDefaults.standard.string(forKey: "appID") ?? "")
        var request = URLRequest(url: URL(string: "http://0.0.0.0:3001/apps/\(id)/emails/settings")!)
        request.allHTTPHeaderFields = ["Authorizarion": String(UserDefaults.standard.string(forKey: "token") ?? "")]
        
        request.httpMethod = "POST"
        
        let data = try JSONEncoder().encode(data)
        
        request.httpBody = data
        
        print("REQUEST BODY: \(NSString(data: request.httpBody!, encoding: String.Encoding.ascii.rawValue)!)")
        print("REQUEST HEADER: \(String(describing: request.allHTTPHeaderFields!))")
        
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if error != nil {
                        continuation.resume(with: .failure(error!))
                    } else if (response as! HTTPURLResponse).statusCode != 200 {
                        continuation.resume(with: .failure(NSError(domain: "", code: 0, userInfo: nil)))
                    } else {
                        UserDefaults.standard.setValue(true, forKey: "appSetupCompleted")
                        UserDefaults.standard.synchronize()
                        continuation.resume(with: .success(()))
                    }
                }
            }.resume()
        }
    }
    
    func enableEmailPush() async throws {
        let id = String(UserDefaults.standard.string(forKey: "appID") ?? "")
        var request = URLRequest(url: URL(string: "http://0.0.0.0:3001/apps/\(id)/emails/settings")!)
        request.allHTTPHeaderFields = ["Authorizarion": String(UserDefaults.standard.string(forKey: "token") ?? "")]
        
        request.httpMethod = "PUT"
        
        print("REQUEST HEADER: \(String(describing: request.allHTTPHeaderFields!))")
        
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if error != nil {
                        continuation.resume(with: .failure(error!))
                    } else if (response as! HTTPURLResponse).statusCode != 200 {
                        continuation.resume(with: .failure(NSError(domain: "", code: 000, userInfo: nil)))
                    } else {
                        continuation.resume(with: .success(()))
                    }
                }
            }.resume()
        }
    }
}

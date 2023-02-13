//
//  SetupWebViewModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 13/08/22.
//

import Foundation

class SetupWebViewModel {
    let coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func createWebPush(data: Webpushes) async throws {
        let id = String(UserDefaults.standard.string(forKey: "appID") ?? "")
        var request = URLRequest(url: URL(string: "http://0.0.0.0:3001/apps/\(id)/webpushes/settings")!)
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
                        continuation.resume(with: .failure(NSError(domain: "", code: 000, userInfo: nil)))
                    } else {
                        continuation.resume(with: .success(()))
                    }
                }
            }.resume()
        }
    }
    
    func enableWebPush() async throws {
        let id = String(UserDefaults.standard.string(forKey: "appID") ?? "")
        var request = URLRequest(url: URL(string: "http://0.0.0.0:3001/apps/\(id)/webpushes/settings")!)
        
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

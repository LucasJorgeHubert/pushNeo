//
//  NotificationsViewModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 12/08/22.
//

import Foundation

class NotificationsViewModel {
    
    let coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func fetchWebNotifications() async throws -> (NotificationsResponse) {
        let id = String(UserDefaults.standard.string(forKey: "appID") ?? "")
        var request = URLRequest(url: URL(string: "http://0.0.0.0:3001/apps/\(id)/webpushes/notifications?initdate=20220301&enddate=20220101")!)
        request.allHTTPHeaderFields = ["Authorizarion": String(UserDefaults.standard.string(forKey: "token") ?? "")]
        
        request.httpMethod = "GET"
        
        print("REQUEST HEADER: \(String(describing: request.allHTTPHeaderFields!))")
        
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if error != nil {
                        continuation.resume(with: .failure(error!))
                    } else if (response as! HTTPURLResponse).statusCode != 201 {
                        continuation.resume(with: .failure(NSError(domain: "", code: 000, userInfo: nil)))
                    } else if let data = data {
                        do {
                            let notifications = try JSONDecoder().decode(NotificationsResponse.self, from: data)
                            
                            print("RESPONSE BODY: \((NSString(data: data, encoding: String.Encoding.ascii.rawValue)!))")
                            
                            continuation.resume(with: .success(notifications))
                        } catch {
                            continuation.resume(with: .failure(error))
                        }
                    }
                }
            }.resume()
        }
    }
    
    func fetchSMSNotifications() async throws -> (NotificationsResponse) {
        let id = String(UserDefaults.standard.string(forKey: "appID") ?? "")
        var request = URLRequest(url: URL(string: "http://0.0.0.0:3001/apps/\(id)/sms/notifications?initdate=20220301&enddate=20220101")!)
        
        request.httpMethod = "GET"
        
        print("REQUEST HEADER: \(String(describing: request.allHTTPHeaderFields!))")
        
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if error != nil || (response as! HTTPURLResponse).statusCode != 201 {
                        continuation.resume(with: .failure(error!))
                    } else if let data = data {
                        do {
                            let notifications = try JSONDecoder().decode(NotificationsResponse.self, from: data)
                            
                            print("RESPONSE BODY: \((NSString(data: data, encoding: String.Encoding.ascii.rawValue)!))")
                            
                            continuation.resume(with: .success(notifications))
                        } catch {
                            continuation.resume(with: .failure(error))
                        }
                    }
                }
            }.resume()
        }
    }
    
    func fetchEmailNotifications() async throws -> (NotificationsResponse) {
        let id = String(UserDefaults.standard.string(forKey: "appID") ?? "")
        var request = URLRequest(url: URL(string: "http://0.0.0.0:3001/apps/\(id)/email/notifications?initdate=20220301&enddate=20220101")!)
        
        request.httpMethod = "GET"
        
        print("REQUEST HEADER: \(String(describing: request.allHTTPHeaderFields!))")
        
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if error != nil || (response as! HTTPURLResponse).statusCode != 201 {
                        continuation.resume(with: .failure(error!))
                    } else if let data = data {
                        do {
                            let notifications = try JSONDecoder().decode(NotificationsResponse.self, from: data)
                            
                            continuation.resume(with: .success(notifications))
                        } catch {
                            continuation.resume(with: .failure(error))
                        }
                    }
                }
            }.resume()
        }
    }
}

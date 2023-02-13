//
//  CreateAppViewModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 13/08/22.
//

import Foundation

class CreateAppViewModel {
    
    let coordinator: MainCoordinator?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    func createApp(appName: String) async throws -> (AppCreatedResponse) {
        var request = URLRequest(url: URL(string: "http://0.0.0.0:3001/apps")!)
        request.allHTTPHeaderFields = ["Authorizarion": String(UserDefaults.standard.string(forKey: "token") ?? "")]
        request.httpMethod = "POST"
        
        let json: [String: Any] = ["app_name": appName]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        
        request.httpBody = jsonData
        
        print("REQUEST BODY: \(NSString(data: request.httpBody!, encoding: String.Encoding.ascii.rawValue)!)")
        print("REQUEST HEADER: \(String(describing: request.allHTTPHeaderFields!))")
        
        return try await withCheckedThrowingContinuation { continuation in
            URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    if error != nil || (response as! HTTPURLResponse).statusCode != 200{
                        continuation.resume(with: .failure(error!))
                    } else if let data = data {
                        do {
                            let app = try JSONDecoder().decode(AppCreatedResponse.self, from: data)
                            
                            print("RESPONSE BODY: \((NSString(data: data, encoding: String.Encoding.ascii.rawValue)!))")
                            
                            UserDefaults.standard.setValue(app.appID, forKey: "appID")
                            UserDefaults.standard.synchronize()
                            
                            continuation.resume(with: .success(app))
                        } catch {
                            continuation.resume(with: .failure(error))
                        }
                    }
                }
            }.resume()
        }
    }
}

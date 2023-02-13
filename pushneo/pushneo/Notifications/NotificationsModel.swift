//
//  NotificationsModel.swift
//  pushneo
//
//  Created by Lucas Hubert on 12/08/22.
//

import Foundation

struct NotificationsResponse: Decodable {
    var notifications: [Notification]
}

// MARK: - Notification
struct Notification: Decodable {
    var notificationID: Int
    var sendDate: String
    
    enum CodingKeys: String, CodingKey {
        case notificationID = "notification_id"
        case sendDate = "send_date"
    }
}

struct Notifications {
    var notificationID: Int
    var sendDate: String
    var type: NotificationType
}

enum NotificationType {
    case email
    case sms
    case web
}

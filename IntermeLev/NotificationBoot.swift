//
//  NotificationBoot.swift
//  IntermeLev
//
//  Created by MacBook on 07.07.2022.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .alert, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
    
    func scheduleNotification() {
        
        
        let content = UNMutableNotificationContent()
        
        content.title = "This is title notification"
        content.subtitle = "This is subtitle"
        content.sound = .default
        content.badge = 1
//        let trigger = UNTimeIntervalNotificationTrigger(
//            timeInterval: 5.0,
//            repeats: false)
        var dateComponents = DateComponents()
        dateComponents.hour = 19
        dateComponents.minute = 54
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            // when you want your notification be
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

struct NotificationBoot: View {
    
    var body: some View {
        VStack(spacing: 30) {
            Button("Request Permession") {
                NotificationManager.instance.requestAuthorization()
            }
        
        Button("Schedule notification") {
            NotificationManager.instance.scheduleNotification()
        }
        }
    }
}

struct NotificationBoot_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBoot()
    }
}

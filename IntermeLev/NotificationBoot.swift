//
//  NotificationBoot.swift
//  IntermeLev
//
//  Created by MacBook on 07.07.2022.
//

import SwiftUI

class NotificationManager {
    static let instance = NotificationManager()
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .alert, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("Error: \(error)")
            } else {
                print("Success")
            }
        }
    }
}

struct NotificationBoot: View {
    
    var body: some View {
        Button("Request Permession") {
            NotificationManager.instance.requestAuthorization()
        }
    }
}

struct NotificationBoot_Previews: PreviewProvider {
    static var previews: some View {
        NotificationBoot()
    }
}

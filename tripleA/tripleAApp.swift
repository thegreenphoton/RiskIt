//
//  tripleAApp.swift
//  tripleA
//
//  Created by Brian Sen on 1/21/25.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? ) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct tripleAApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

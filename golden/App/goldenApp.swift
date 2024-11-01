//
//  goldenApp.swift
//  golden
//
//  Created by Zachary Palmer on 10/24/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct goldenApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var colorSelection = ColorSelection()
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                            .environmentObject(colorSelection)
        }
        
    }   
}

//
//  _0210607_RileyDurbin_NYCSchoolsApp.swift
//  20210607-RileyDurbin-NYCSchools
//
//  Created by Riley Durbin on 6/7/21.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Load the information from the CSVs when the application loads
        InformationLoader.load()
        
        return true
    }
}

@main
struct _0210607_RileyDurbin_NYCSchoolsApp: App {
    // Added App Delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

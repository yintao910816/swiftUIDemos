//
//  UserProfileApp.swift
//  UserProfile
//
//  Created by apple on 2022/4/18.
//

import SwiftUI
import ModelData

@main
struct UserProfileApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

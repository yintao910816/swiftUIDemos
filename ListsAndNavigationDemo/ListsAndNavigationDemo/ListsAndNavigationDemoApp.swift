//
//  ListsAndNavigationDemoApp.swift
//  ListsAndNavigationDemo
//
//  Created by apple on 2022/4/14.
//

import SwiftUI

import ModelData

@main
struct ListsAndNavigationDemoApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

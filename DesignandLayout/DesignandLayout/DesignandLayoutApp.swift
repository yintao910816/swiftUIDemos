//
//  DesignandLayoutApp.swift
//  DesignandLayout
//
//  Created by apple on 2022/4/16.
//

import SwiftUI

import ModelData

@main
struct DesignandLayoutApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}

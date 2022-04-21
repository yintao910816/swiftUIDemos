//
//  ContentView.swift
//  ListsAndNavigationDemo
//
//  Created by apple on 2022/4/14.
//

import SwiftUI
import ModelData

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}

//
//  ContentView.swift
//  Animation
//
//  Created by apple on 2022/4/15.
//

import SwiftUI

import ModelData

struct ContentView: View {
    var body: some View {
        HikeView(hike: ModelData().hikes[2])
            .padding()
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

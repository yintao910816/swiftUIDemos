//
//  LandmarkList.swift
//  ListsAndNavigationDemo
//
//  Created by apple on 2022/4/14.
//

import SwiftUI
import ModelData

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly: Bool = false
    
    private var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter{
            (!showFavoritesOnly || $0.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List() {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
                .previewDisplayName(deviceName)
                .environmentObject(ModelData())
        }
    }
}

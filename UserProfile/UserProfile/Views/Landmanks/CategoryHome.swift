//
//  CategoryHome.swift
//  DesignandLayout
//
//  Created by apple on 2022/4/16.
//

import SwiftUI

import ModelData

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile = false

    var body: some View {
        NavigationView{
            List{
                PageView(pages: modelData.features.map({ FeatureCard(landmark: $0) }))
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())

//                modelData.features[0].image
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 200)
//                    .clipped()
//                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) {
                    CategoryRow(categoryName: $0, items: modelData.categories[$0]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset) // 可以让list贴着边缘布局
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
                    .environmentObject(modelData)
            }

        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}

//
//  ProfileSummary.swift
//  UserProfile
//
//  Created by apple on 2022/4/18.
//

import SwiftUI

import ModelData

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)

                Text("Notifications: \(profile.prefersNotifications ? "On": "Off" )")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Completed Badges")
                        .font(.headline)
                    
                    ScrollView {
                        HStack {
                            HikeBadge(name: "First Hike")
                            HikeBadge(name: "Earth Day")
                                .hueRotation(Angle(degrees: 90)) // 色相旋轉：原图的hueRotation旋转0度，范围是0~360度

                            HikeBadge(name: "Tenth Hike")
                                .grayscale(0.5) // 调整灰阶的灰度：原图的灰度为0，范围为0~1，数字越来越大，灰阶效果越来越明显
                                .hueRotation(Angle(degrees: 45))
                        }
                        .padding(.bottom)
                    }
                }
                
                Divider()

                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)
                    
                    HikeView(hike: modelData.hikes[0])
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: .default)
            .environmentObject(ModelData())
    }
}

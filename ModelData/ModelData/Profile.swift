//
//  Profile.swift
//  UserProfile
//
//  Created by apple on 2022/4/18.
//

import Foundation

public struct Profile {
    public var username: String
    public var prefersNotifications = true
    public var seasonalPhoto = Season.winter
    public var goalDate = Date()

    public static let `default` = Profile(username: "g_kumar")

    public enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"

        public var id: String { rawValue }
    }
}

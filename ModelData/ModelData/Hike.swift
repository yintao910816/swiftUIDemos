//
//  Hike.swift
//  ModelData
//
//  Created by apple on 2022/4/15.
//

import Foundation

public struct Hike: Codable, Hashable, Identifiable {
    public var id: Int
    public var name: String
    public var distance: Double
    public var difficulty: Int
    public var observations: [Observation]

    public static var formatter = LengthFormatter()

    public var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }

    public struct Observation: Codable, Hashable {
        public var distanceFromStart: Double

        public var elevation: Range<Double>
        public var pace: Range<Double>
        public var heartRate: Range<Double>
    }
}


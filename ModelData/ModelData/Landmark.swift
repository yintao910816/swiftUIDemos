/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A representation of a single landmark.
*/

import Foundation
import SwiftUI
import CoreLocation

public struct Landmark: Hashable, Codable, Identifiable {
    public var id: Int
    public var name: String
    public var park: String
    public var state: String
    public var description: String
    
    public var isFavorite: Bool
    public var isFeatured: Bool

    private var imageName: String
    public var image: Image {
        Image(imageName)
    }
    
    public var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }

    private var coordinates: Coordinates
    public var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    public var category: Category
    public enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

}

/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Storage for model data.
*/

import Foundation

public final class ModelData: ObservableObject {
    
    @Published public var landmarks: [Landmark] = load("landmarkData.json")
    @Published public var hikes: [Hike] = load("hikeData.json")
    @Published public var profile = Profile.default

    public init() {}
    
    public var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    public var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
}
///Users/apple/swiftUI/swiftUIDemos/ModelData/ModelData.xcodeproj
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    // 此路径是工程路径，并非framework路径
//    let file = Bundle.main.url(forResource: filename, withExtension: nil)
    guard let file = Bundle.init(for: ModelData.self).url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

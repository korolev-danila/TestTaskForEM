//
//  Model.swift
//  TestTaskForEM
//
//  Created by Danila on 20.03.2023.
//

import Foundation

struct Model: Identifiable, Hashable, Codable {
    var id = UUID()
    var name: String
    var price: Double
    var category: String?
    var discount: Double?
    var imageData: Data?
    var imageUrl: String?
    
    /// for details
    var description: String?
    var rating: Double?
    var numberOfReviews: Int?
    var colors: [String]?
    var imageUrls: [String]?
    
    init?(json: [String: Any]) {
        let category = json["category"] as? String
        let name = json["name"] as? String
        let price = json["price"] as? Double
        let discount = json["discount"] as? Double
        let imageUrl = json["image_url"] as? String
        
        let description = json["description"] as? String
        let rating = json["rating"] as? Double
        let numberOfReviews = json["number_of_reviews"] as? Int
        let colors = json["colors"] as? [String]
        let imageUrls = json["image_urls"] as? [String]
        
        self.name = name ?? ""
        self.price = price ?? 0.0
        self.category = category
        self.discount = discount
        self.imageUrl = imageUrl
        
        self.description = description
        self.rating = rating
        self.numberOfReviews = numberOfReviews
        self.colors = colors
        self.imageUrls = imageUrls
    }
    
    static func getArray(from jsonArray: Any) -> [Model]? {
        guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil }
        return jsonArray.compactMap { Model(json: $0)}
    }
}

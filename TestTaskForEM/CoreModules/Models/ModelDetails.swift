//
//  ModelDetails.swift
//  TestTaskForEM
//
//  Created by Danila on 22.03.2023.
//

import Foundation

struct ModelDetails: Hashable, Codable {
    var name: String
    var description: String
    var rating: Double
    var numberOfReviews: Int
    var price: Double
    var colors: [String]
    var imageUrls: [String]
    var imageData: [Data]
    
    init?(json: [String: Any]) {
        let name = json["name"] as? String
        let description = json["description"] as? String
        let rating = json["rating"] as? Double
        let numberOfReviews = json["number_of_reviews"] as? Int
        let price = json["price"] as? Double
        let colors = json["colors"] as? [String]
        let imageUrls = json["image_urls"] as? [String]

        self.name = name ?? ""
        self.description = description ?? ""
        self.rating = rating ?? 0.0
        self.numberOfReviews = numberOfReviews ?? 0
        self.price = price ?? 0.0
        self.colors = colors ?? []
        self.imageUrls = imageUrls ?? []
        self.imageData = []
    }
}

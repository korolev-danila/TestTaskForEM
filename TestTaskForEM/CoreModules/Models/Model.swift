//
//  Model.swift
//  TestTaskForEM
//
//  Created by Danila on 20.03.2023.
//

import Foundation

struct Model: Identifiable, Hashable, Codable {
    var id = UUID()
    var category: String
    var name: String
    var price: Double
    var discount: Double?
    var imageData: Data? 
    var imageUrl: String
    
    init?(json: [String: Any]) {
        let category = json["category"] as? String
        let name = json["name"] as? String
        let price = json["price"] as? Double
        let discount = json["discount"] as? Double
        let imageUrl = json["image_url"] as? String

        self.category = category ?? ""
        self.name = name ?? ""
        self.price = price ?? 0.0
        self.discount = discount
        self.imageUrl = imageUrl ?? ""
    }

    static func getArray(from jsonArray: Any) -> [Model]? {
        guard let jsonArray = jsonArray as? Array<[String: Any]> else { return nil}
        return jsonArray.compactMap { Model(json: $0)}
    }
}

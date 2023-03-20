//
//  Model.swift
//  TestTaskForEM
//
//  Created by Danila on 20.03.2023.
//

import Foundation

struct Model: Hashable {
    var id = UUID()
    var category: String
    var name: String
    var price: Double
    var discount: Double?
    var image: Data?
}

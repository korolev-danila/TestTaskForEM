//
//  NetworkManager.swift
//  TestTaskForEM
//
//  Created by Danila on 20.03.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func getData(request: Request) async throws -> [Model]
    func getImage(url: String) async throws -> Data
}

enum Request {
    case latest
    case flash
}

enum NetworkFetcherError: Error {
    case invalidURL
    case missingData
    case outOfRange
    case failurUpdateImg
}

final class NetworkManager {
    private func updateImgOf(array: inout [Model]) async throws {
        var i = 0
        for item in array {
            if i >= array.count { throw NetworkFetcherError.outOfRange }
            array[i].imageData = try await getImage(url: item.imageUrl)
            i += 1
        }
    }
}

// MARK: - NetworkManagerProtocol
extension NetworkManager: NetworkManagerProtocol {
    
    func getData(request: Request) async throws -> [Model] {
        var key = ""
        var url = ""
        
        switch request {
        case .latest:
            key = "latest"
            url = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
        case .flash:
            key = "flash_sale"
            url = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
        }
        
        guard let url = URL(string: url) else { throw NetworkFetcherError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let asJSON = try JSONSerialization.jsonObject(with: data)
        guard let responts = asJSON as? NSDictionary else { throw NetworkFetcherError.missingData }
        guard let data = responts.object(forKey: key) else { throw NetworkFetcherError.missingData }
        guard var models = Model.getArray(from: data) else { throw NetworkFetcherError.missingData }
        
        try await updateImgOf(array: &models)
        
        return models
    }
    
    func getImage(url: String) async throws -> Data {
        guard let url = URL(string: url ) else { throw NetworkFetcherError.invalidURL }
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}

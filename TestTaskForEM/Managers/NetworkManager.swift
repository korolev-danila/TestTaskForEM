//
//  NetworkManager.swift
//  TestTaskForEM
//
//  Created by Danila on 20.03.2023.
//

import Foundation

protocol NetworkManagerProtocol: AnyObject {
    func getData(request: Request) async throws -> [Model]
    func getDetails() async throws -> Model
    func getSearhText(_ text: String) async throws -> [String]
}

enum Request {
    case latest
    case flash
}

enum Url: String {
    case latest = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    case flash = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    case details = "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239"
    case searchText = "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19"
}

enum NetworkFetcherError: Error {
    case invalidURL
    case missingData
    case outOfRange
}

final class NetworkManager { }

// MARK: - NetworkManagerProtocol
extension NetworkManager: NetworkManagerProtocol {
    
    func getData(request: Request) async throws -> [Model] {
        let key: String
        let url: String
        
        switch request {
        case .latest:
            key = "latest"
            url = Url.latest.rawValue
        case .flash:
            key = "flash_sale"
            url = Url.flash.rawValue
        }
        
        guard let url = URL(string: url) else { throw NetworkFetcherError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let asJSON = try JSONSerialization.jsonObject(with: data)
        guard let respont = asJSON as? NSDictionary else { throw NetworkFetcherError.missingData }
        guard let data = respont.object(forKey: key) else { throw NetworkFetcherError.missingData }
        guard let models = Model.getArray(from: data) else { throw NetworkFetcherError.missingData }
        
        return models
    }
    
    func getDetails() async throws -> Model {
        guard let url = URL(string: Url.details.rawValue) else {
            throw NetworkFetcherError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let asJSON = try JSONSerialization.jsonObject(with: data)
        guard let responts = asJSON as? [String : Any] else { throw NetworkFetcherError.missingData }
        guard let model = Model(json: responts) else { throw NetworkFetcherError.missingData }
        
        return model
    }
    
    func getSearhText(_ text: String) async throws -> [String] {
        guard let url = URL(string: Url.searchText.rawValue) else {
            throw NetworkFetcherError.invalidURL }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let asJSON = try JSONSerialization.jsonObject(with: data)
        guard let responts = asJSON as? NSDictionary else { throw NetworkFetcherError.missingData }
        guard let data = responts.object(forKey: "words") else { throw NetworkFetcherError.missingData }
        guard let strings = data as? [String] else { throw NetworkFetcherError.missingData }
        
        return strings
    }
}

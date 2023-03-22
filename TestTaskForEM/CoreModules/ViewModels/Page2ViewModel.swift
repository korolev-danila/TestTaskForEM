//
//  Page2ViewModel.swift
//  TestTaskForEM
//
//  Created by Danila on 22.03.2023.
//

import Foundation
import Combine

final class Page2ViewModel: ObservableObject {
    private let network: NetworkManagerProtocol
    
    @Published var model: ModelDetails?
    
    private var cancellable = Set<AnyCancellable>()
    private let modelSubj = PassthroughSubject<ModelDetails, Never>()
    
    init(network: NetworkManagerProtocol) {
        self.network = network
        fetchData()
        
        modelSubj
            .receive(on: DispatchQueue.main)
            .sink { model in
                self.model = model
            }
            .store(in: &cancellable)
    }
    
    deinit {
        print("deinit Page2ViewModel")
    }
    
    private func fetchData() {
        Task {
            do {
                modelSubj.send(try await network.getDetails())
            } catch {
                print("failur fetchData()")
            }
        }
    }
}

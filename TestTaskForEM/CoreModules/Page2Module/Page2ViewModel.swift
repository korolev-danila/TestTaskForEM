//
//  Page2ViewModel.swift
//  TestTaskForEM
//
//  Created by Danila on 22.03.2023.
//

import Foundation
import Combine

final class Page2ViewModel: ObservableObject {
    unowned private let network: NetworkManagerProtocol
    
    @Published var model: Model {
        didSet {
            if isAddItem {
                plusItem()
                isAddItem = false
            }
        }
    }
    @Published var price = 0.0
    
    private var countSubj = PassthroughSubject<Int, Never>()
    private(set) var counter = 0 {
        didSet { countSubj.send(counter) }
    }
    private var isAddItem = true
    
    private var cancellable = Set<AnyCancellable>()
    private let modelSubj = PassthroughSubject<Model, Never>()
    
    init(network: NetworkManagerProtocol, model: Model) {
        self.network = network
        self.model = model
        setupBinding()
        fetchData()
    }
    
    deinit {
        print("deinit Page2ViewModel")
    }
    
    private func setupBinding() {
        modelSubj
            .receive(on: DispatchQueue.main)
            .sink { [weak self] model in
                self?.model = model
            }
            .store(in: &cancellable)
        
        countSubj
            .filter { $0 >= 0 }
            .sink { [weak self] count in
                if let price = self?.model.price {
                    self?.price = Double(count) * price
                }
            }
            .store(in: &cancellable)
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
    
    // MARK: -
    func plusItem() {
        counter += 1
    }
    
    func minusItem() {
        if counter <= 0 { return }
        counter -= 1
    }
}

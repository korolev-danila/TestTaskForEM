//
//  Page1ViewModel.swift
//  TestTaskForEM
//
//  Created by Danila on 17.03.2023.
//

import Foundation
import Combine

final class Page1ViewModel: ObservableObject {
    private let network: NetworkManagerProtocol
    
    private var cancellable: AnyCancellable?
    
    @Published private var localLatestArr: [Model] = []
    @Published private var localFlashsArr: [Model] = []
    
    private let latestSubj = PassthroughSubject<[Model], Error>()
    private let flashSubj = PassthroughSubject<[Model], Error>()
    
    private var isFetch = false
    
    @Published var latestArr: [Model] = []
    @Published var flashsArr: [Model] = []
    
    init(network: NetworkManagerProtocol) {
        self.network = network
        
        bindingPublishers()
    }
    
    private func bindingPublishers() {
        cancellable = Publishers.Zip(latestSubj, flashSubj)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure:
                    print("Failure")
                }
            }, receiveValue: { value in
                if value.0.count > 0 && value.1.count > 0 {
                    self.latestArr = value.0
                    self.flashsArr = value.1
                } else if value.0.count == 0 && value.1.count == 0 {
                    self.isFetch = false
                    self.fetchData()
                }
            })
    }
    
    func fetchData() {
        if isFetch { return }
        isFetch = true
            
        Task {
            do {
                latestSubj.send(try await network.getData(request: Request.latest))
                flashSubj.send(try await network.getData(request: Request.flash))
            } catch {
                print("failur fetchData()")
            }
        }
    }
}

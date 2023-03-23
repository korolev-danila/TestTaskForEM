//
//  Page1ViewModel.swift
//  TestTaskForEM
//
//  Created by Danila on 17.03.2023.
//

import Foundation
import Combine
import SwiftUI

final class Page1ViewModel: ObservableObject {
    private let network: NetworkManagerProtocol
    private let coreData: CoreDataProtocol
    
    private var cancellable: AnyCancellable?
    private var isFetch = false
    private let latestSubj = PassthroughSubject<[Model], Error>()
    private let flashSubj = PassthroughSubject<[Model], Error>()
    
    @Published var latestArr: [Model] = []
    @Published var flashsArr: [Model] = []
    @Published var image: UIImage?
    
    init(network: NetworkManagerProtocol, coredata: CoreDataProtocol) {
        self.network = network
        self.coreData = coredata
        bindingPublishers()
    }
    
    deinit {
        print("deinit Page1ViewModel")
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
            }, receiveValue: { [weak self] value in
                if value.0.count > 0 && value.1.count > 0 {
                    self?.latestArr = value.0
                    self?.flashsArr = value.1
                } else if value.0.count == 0 && value.1.count == 0 {
                    self?.isFetch = false
                    self?.fetchData()
                }
            })
    }
    
    // MARK: - methods
    func fetchPerson() {
        do {
            let person = try coreData.getPerson()
            
            if let data = person.personImg {
                image = UIImage(data: data)
            }
        } catch let error {
            print(error.localizedDescription)
        }
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

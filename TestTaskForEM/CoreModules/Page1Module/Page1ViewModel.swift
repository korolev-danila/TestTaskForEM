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
    unowned private let network: NetworkManagerProtocol
    unowned private let coreData: CoreDataProtocol
    
    private var person: Person?
    @Published var imgData: Data?
    
    private var isFetch = false
    private let latestSubj = PassthroughSubject<[Model], Error>()
    private let flashSubj = PassthroughSubject<[Model], Error>()
    @Published var latestArr: [Model] = []
    @Published var flashsArr: [Model] = []
        
    @Published private (set) var products: [String] = []
    private let searchSubj = PassthroughSubject<[String], Never>()
    @Published var searchText = String()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(network: NetworkManagerProtocol, coredata: CoreDataProtocol) {
        self.network = network
        self.coreData = coredata
        createBinding()
        fetchPerson()
    }
    
    deinit {
        print("deinit Page1ViewModel")
    }
    
    // MARK: - createBinding
    private func createBinding() {
        bindSearchText()
        bindSearchSubj()
        bindCollectionSubj()
    }
    
    private func bindSearchText() {
        $searchText
            .debounce(for: .milliseconds(1000), scheduler: RunLoop.main)
            .removeDuplicates()
            .map({ (string) -> String? in
                if string.count < 1 {
                    self.products = []
                    return nil
                }
                return string
            })
            .compactMap{ $0 }
            .sink { (_) in
            } receiveValue: { [weak self] searchField in
                self?.fetchSearchItemFor(searchField)
            }
            .store(in: &cancellables)
    }
    
    private func bindSearchSubj() {
        searchSubj
            .receive(on: DispatchQueue.main)
            .map { [weak self] array in
                return array.filter({ $0.contains(self?.searchText ?? "") })
            }
            .sink { (completed) in
            } receiveValue: { [self] (searchedProducts) in
                products = searchedProducts
            }
            .store(in: &cancellables)
    }
        
    private func bindCollectionSubj() {
        Publishers.Zip(latestSubj, flashSubj)
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
            .store(in: &cancellables)
    }
    
    private func fetchSearchItemFor(_ text: String) {
        Task {
            do {
                searchSubj.send(try await network.getSearhText(text))
            } catch {
                print("failur fetchSearchItemFor()")
            }
        }
    }
    
    private func fetchPerson() {
        do {
            person = try coreData.getPerson()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // MARK: - methods
    func updateProp() {
        imgData = person?.personImg
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

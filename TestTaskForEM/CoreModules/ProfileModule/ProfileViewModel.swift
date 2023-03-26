//
//  ProfileViewModel.swift
//  TestTaskForEM
//
//  Created by Danila on 16.03.2023.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    private unowned let coredata: CoreDataProtocol
    private var person: Person?
    
    @Published var imgData: Data?
    @Published var namePerson = ""
    
    init(_ coreData: CoreDataProtocol) {
        self.coredata = coreData
        fetchPerson()
        updateProp()
    }
    
    deinit {
        print("deinit ProfileViewModel")
    }
    
    private func fetchPerson() {
        do {
            person = try coredata.getPerson()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func updateProp() {
        imgData = person?.personImg
        namePerson = (person?.firstName ?? "") + " " + (person?.lastName ?? "")
    }
    
    // MARK: -
    func saveImage(data: Data?) async {
        person?.personImg = data
        coredata.saveContext()
    }
}

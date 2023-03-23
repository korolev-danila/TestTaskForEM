//
//  ProfileViewModel.swift
//  TestTaskForEM
//
//  Created by Danila on 16.03.2023.
//

import SwiftUI

final class ProfileViewModel: ObservableObject {
    private let coreData: CoreDataProtocol
    private var person: Person?
    
    @Published var image: UIImage?
    @Published var namePerson = ""
    
    init(_ coreData: CoreDataProtocol) {
        self.coreData = coreData
        fetchPerson()
        updateProp()
    }
    
    private func fetchPerson() {
        do {
            person = try coreData.getPerson()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func updateProp() {
        if let data = person?.personImg {
            image = UIImage(data: data)
        }
        namePerson = (person?.firstName ?? "") + " " + (person?.lastName ?? "")
    }
    
    func saveImage() {
        person?.personImg = image?.pngData()
        coreData.saveContext()
    }
}

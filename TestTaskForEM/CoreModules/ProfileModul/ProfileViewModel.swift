//
//  ProfileViewModel.swift
//  TestTaskForEM
//
//  Created by Danila on 16.03.2023.
//

import Foundation

final class ProfileViewModel: ObservableObject {
    private let coreData: CoreDataProtocol
    
    init(_ coreData: CoreDataProtocol) {
        self.coreData = coreData
    }
    
}

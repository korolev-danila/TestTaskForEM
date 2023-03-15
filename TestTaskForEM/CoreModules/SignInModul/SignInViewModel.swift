//
//  SignInViewModel.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import Combine

final class SignInViewModel: ObservableObject {
    private let coreData: CoreDataProtocol
    
    @Published var userFirstName = ""
    @Published var userLastName = ""
    @Published var userEmail = ""
    @Published var userPassword = ""

    init(_ coreData: CoreDataProtocol) {
        self.coreData = coreData
    }
}

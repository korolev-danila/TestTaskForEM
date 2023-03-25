//
//  SignInViewModel.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import Combine
import Foundation

final class SignInViewModel: ObservableObject {
    private unowned let coredata: CoreDataProtocol
    private var persons: [Person] = []
    
    /// for SignInView
    @Published var userFirstName = ""
    @Published var userLastName = ""
    @Published var userEmail = ""
    @Published var formIsValid = false
    @Published var emailIsValid = true
    
    /// for LoginView
    @Published var userFirstLogin = ""
    @Published var userPassword = ""
    @Published var passwordIsValid = false
    
    private var cancellable = Set<AnyCancellable>()
    
    init(_ coreData: CoreDataProtocol) {
        self.coredata = coreData
        self.fetchPersons()
        self.setupBindings()
    }
    
    deinit {
        print("deinit SignIn_ViewModel")
    }
    
    private func setupBindings() {
        isSignUpFormValidPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] (value) in
                self?.formIsValid = value
            }
            .store(in: &cancellable)
        
        isUserEmailValidPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] (value) in
                self?.emailIsValid = value
            }
            .store(in: &cancellable)
        
        isPasswordValidPublisher
            .receive(on: RunLoop.main)
            .sink { [weak self] (value) in
                self?.passwordIsValid = value
            }
            .store(in: &cancellable)
    }
    
    // MARK: -
    func fetchPersons() {
        persons = coredata.fetchMyPersons()
    }
    
    func findPersonInArrayAndCheck() -> Bool {
        for person in persons {
            if person.firstName == userFirstLogin {
                
                guard let password = person.password else {
                    /// need for first login
                    person.password = userPassword
                    coredata.saveContext()
                    coredata.setPerson(person)
                    return true
                }
                
                if password == userPassword {
                    coredata.setPerson(person)
                    return true
                }
            }
        }
        return false
    }
    
    func findOldPersonForEmail() -> Bool {
        for person in persons {
            if person.email == userEmail {
                return true
            }
        }
        return false
    }
    
    func saveNewPerson() -> Bool {
        var person: Person?
        
        do {
            person = try coredata.createNewPerson()
            person?.firstName = userFirstName
            person?.lastName = userLastName
            person?.email = userEmail
            coredata.saveContext()
            coredata.setPerson(person)
            return true
        } catch {
            print("error create coreData.createNewPerson")
            return false
        }
    }
}

// MARK: - Setup validations
private extension SignInViewModel {
    
    var isSignUpFormValidPublisher: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest3(
            isFirstUserNameValidPublisher,
            isLastUserNameValidPublisher,
            isUserEmailValidPublisher)
        .map { isFirstNameValid, isLastNameValid, isEmailValid in
            return isFirstNameValid && isLastNameValid && isEmailValid
        }
        .eraseToAnyPublisher()
    }
    
    var isFirstUserNameValidPublisher: AnyPublisher<Bool, Never> {
        $userFirstName
            .map { name in
                return name.count >= 1
            }
            .eraseToAnyPublisher()
    }
    
    var isLastUserNameValidPublisher: AnyPublisher<Bool, Never> {
        $userLastName
            .map { name in
                return name.count >= 1
            }
            .eraseToAnyPublisher()
    }
    
    var isUserEmailValidPublisher: AnyPublisher<Bool, Never> {
        $userEmail
            .map { email in
                let emailPredicate = NSPredicate(format:"SELF MATCHES %@",
                                                 "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
                return emailPredicate.evaluate(with: email)
            }
            .eraseToAnyPublisher()
    }
    
    var isPasswordValidPublisher: AnyPublisher<Bool, Never> {
        $userPassword
            .map { password in
                return password.count >= 4
            }
            .eraseToAnyPublisher()
    }
}

//
//  SignInViewModel.swift
//  TestTaskForEM
//
//  Created by Danila on 14.03.2023.
//

import Combine
import Foundation

final class SignInViewModel: ObservableObject {
    private let coreData: CoreDataProtocol
    @Published private var persons: [Person]
    
    @Published var userFirstName = ""
    @Published var userLastName = ""
    @Published var userEmail = ""
    
    @Published var userFirstLogin = ""
    @Published var userPassword = ""
    
    @Published var formIsValid = false
    @Published var emailIsValid = true
    @Published var loginIsValid = false
      
    private var publishers = Set<AnyCancellable>()

    init(_ coreData: CoreDataProtocol) {
        self.coreData = coreData
        persons = self.coreData.fetchMyPersons()
        
        setupBindings()
    }
    
    private func setupBindings() {
        isSignUpFormValidPublisher
              .receive(on: RunLoop.main)
              .assign(to: \.formIsValid, on: self)
              .store(in: &publishers)
        
        isUserEmailValidPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.emailIsValid, on: self)
            .store(in: &publishers)
        
        isLoginFormValidPublisher
              .receive(on: RunLoop.main)
              .assign(to: \.loginIsValid, on: self)
              .store(in: &publishers)
    }
    
    // MARK: -
    func findPersonInArray() -> Bool {
        for person in persons {
            if person.firstName == userFirstLogin {
                guard let password = person.password else {
                    person.password = userPassword
                    coreData.saveContext()
                    return true
                }
                
                if password == userPassword {
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
        print("try to save")
        var person: Person?
        
        do {
            person = try coreData.createNewPerson()
            person?.firstName = userFirstName
            person?.lastName = userLastName
            person?.email = userEmail
            coreData.saveContext()
            
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
    
    var isLoginFormValidPublisher: AnyPublisher<Bool, Never> {
          Publishers.CombineLatest(
            isFirstUserNameValidPublisher,
            isPasswordValidPublisher)
              .map { isFirstNameValid, isPasswordValid in
                  return isFirstNameValid && isPasswordValid
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

//
//  MockCoreDataManager.swift
//  TestTaskForEM
//
//  Created by Danila on 15.03.2023.
//

import Foundation

final class MockCoreData: CoreDataProtocol {
    func setPerson(_ person: Person?) {
        
    }
    
    func getPerson() throws -> Person {
        throw CoreDataError.missedPerson
    }
    
    func fetchMyPersons() -> [Person] {
        return []
    }
    
    func resetAllRecords() {
        print("resetAllRecords")
    }
    
    func saveContext() {
        print("save")
    }
    
    func createNewPerson() throws -> Person {
        throw CoreDataError.missedPerson
    }
    
    func deletePerson(_ person: Person) {
        print("deletePerson")
    }
}

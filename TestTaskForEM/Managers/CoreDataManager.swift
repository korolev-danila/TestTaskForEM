//
//  CoreDataManager.swift
//  TestTaskForEM
//
//  Created by Danila on 15.03.2023.
//

import CoreData

protocol CoreDataProtocol: AnyObject {
    func setPerson(_ person: Person?)
    func getPerson() throws -> Person
    func fetchMyPersons() -> [Person]
    func resetAllRecords()
    func saveContext()
    func createNewPerson() throws -> Person
    func deletePerson(_ person: Person)
}

enum CoreDataError: Error {
    case missedPerson
}

final class CoreDataManager {
    private let context: NSManagedObjectContext
    private var person: Person?
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

// MARK: - CoreDataProtocol
extension CoreDataManager: CoreDataProtocol {
    
    func setPerson(_ person: Person?) {
        self.person = person
    }
    
    func getPerson() throws -> Person {
        if let person = person {
            return person
        } else {
            throw CoreDataError.missedPerson
        }
    }
    
    func fetchMyPersons() -> [Person] {
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            let arr = try context.fetch(fetchRequest)
            return arr
        } catch let error as NSError {
            print(error.localizedDescription)
            return []
        }
    }
    
    func resetAllRecords() {
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func saveContext() {
        do {
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func createNewPerson() throws -> Person {
        guard let entity = NSEntityDescription.entity(forEntityName: "Person",
                                                      in: context) else {
            throw CoreDataError.missedPerson
        }
        return Person(entity: entity , insertInto: context)
    }
    
    func deletePerson(_ person: Person) {
        context.delete(person)
        saveContext()
    }
}


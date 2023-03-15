//
//  Person+CoreDataProperties.swift
//  TestTaskForEM
//
//  Created by Danila on 15.03.2023.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var firstName: String
    @NSManaged public var lastName: String
    @NSManaged public var email: String
    @NSManaged public var password: String?
    @NSManaged public var personImg: Data?

}

extension Person : Identifiable {

}

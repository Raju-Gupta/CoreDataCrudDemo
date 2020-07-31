//
//  Person+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Raju Gupta on 16/07/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: String?
    @NSManaged public var address: String?

}

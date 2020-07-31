//
//  DBManager.swift
//  CoreDataDemo
//
//  Created by Raju Gupta on 16/07/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DBManager{
    
    static let share = DBManager()
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    
    lazy var context = persistentContainer.viewContext
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchData() -> [Person] {
        var persons = [Person]()
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Person.description())
        
        do{
            persons = try context.fetch(fetchRequest) as! [Person]
        }
        catch{
            print(error.localizedDescription)
        }
        return persons
    }
}

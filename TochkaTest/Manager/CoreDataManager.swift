//
//  CoreDataManager.swift
//  TochkaTest
//
//  Created by Dmitry Ilyinykh on 04/09/2019.
//  Copyright © 2019 Dmitry Ilyinykh. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "TochkaTest")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        
        return persistentContainer.viewContext
    }
    
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
    
    func fetchAll<T: NSManagedObject>(_: T.Type, predicate: NSPredicate? = nil) -> [T]? {
        
        let entityName = String(describing: T.self)
        let fetchRequest = NSFetchRequest<T>(entityName: entityName)
        
        if let predicate = predicate {
            fetchRequest.predicate = predicate
        }
        var result: [T]?
        
        do {
            result = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
        return result
    }
    
    func fetch<T: NSManagedObject>(_ type: T.Type, predicate: NSPredicate) -> T? {
        
        return fetchAll(type, predicate: predicate)?.first
    }
    
    func replace<T: NSManagedObject>(_ object: T, predicate: NSPredicate) {
        
        if let savedObject = fetch(type(of: object), predicate: predicate) {
            delete(object: savedObject)
        }        
    }
    
    func delete<T: NSManagedObject>(object: T) {
        
        context.delete(object)
        saveContext()        
    }
    
    func deleteAll<T: NSManagedObject>(_: T.Type) {
        
        let delete = NSBatchDeleteRequest(fetchRequest: T.fetchRequest())
        
        do {
            try context.execute(delete)
        } catch {
            print(error.localizedDescription)
        }
        saveContext()
    }
}

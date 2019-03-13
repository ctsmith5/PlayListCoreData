//
//  CoreDataStack.swift
//  PlaylistCoreData
//
//  Created by Colin Smith on 3/12/19.
//  Copyright © 2019 Colin Smith. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PlaylistCoreData")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
                
            }
        }
        return container
    }()
    static var context: NSManagedObjectContext { return container.viewContext}
}



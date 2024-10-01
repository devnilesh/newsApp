//
//  LocalStorage.swift
//  NewsApp
//
//  Created by Nilesh Mahajan on 29/09/24.
//

import CoreData

struct CoreDataStorage {
  static let shared = CoreDataStorage()
  
  let container: NSPersistentContainer
  
  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "BookmarksModel")
    if inMemory {
      container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
    }
    container.loadPersistentStores { description, error in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    }
  }
  
  var context: NSManagedObjectContext {
    return container.viewContext
  }
}

//
//  CoreDataContainer.swift
//  NoSimulatorModel
//
//  Created by Brad Leege on 11/15/24.
//

import Foundation
import CoreData

public class CoreDataContainer: NSPersistentContainer {

    public init(_ inMemory: Bool = false) {
        
        let frameworkBundleIdentifier = "io.leege.NoSimulatorModel"
        guard let customKitBundle = Bundle(identifier: frameworkBundleIdentifier),
              let modelURL = customKitBundle.url(forResource: "NoSimulatorCoreDataModel", withExtension: "momd"),
              let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to load model from bundle")
        }
                
        super.init(name: "NoSimulatorCoreDataModel", managedObjectModel: managedObjectModel)

        if inMemory {
            let description = NSPersistentStoreDescription()
            description.type = NSInMemoryStoreType
            description.shouldAddStoreAsynchronously = false // Make it simpler in test env
                    
            persistentStoreDescriptions = [description]
        }
        
        loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }
    
}

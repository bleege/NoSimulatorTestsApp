//
//  CoreDataManager.swift
//  NoSimulatorModel
//
//  Created by Brad Leege on 11/11/24.
//

import Foundation
import CoreData

public protocol CoreDataManager {
    func saveButtonTap(date: Date)
}

public class DefaultCoreDataManager: CoreDataManager {
    
    private var persistentContainer: NSPersistentContainer?
        
    public init () {
        setupCoreDataStack()
    }
    
    private func setupCoreDataStack() {
        
        let frameworkBundleIdentifier = "io.leege.NoSimulatorModel"
        guard let customKitBundle = Bundle(identifier: frameworkBundleIdentifier),
              let modelURL = customKitBundle.url(forResource: "NoSimulatorCoreDataModel", withExtension: "momd"),
              let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            print("Unable to load model from bundle")
            return
        }
        
        persistentContainer = NSPersistentContainer(name: "NoSimulatorCoreDataModel", managedObjectModel: managedObjectModel)
        
        persistentContainer?.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
    }
    
    public func saveButtonTap(date: Date) {
        
        guard let context = persistentContainer?.viewContext else {
            return
        }
        
        do {
            let buttonTap = ButtonTap(context: context)
            buttonTap.id = UUID()
            buttonTap.dateTapped = date

            try context.save()
        } catch {
            print("Error saving button tap: \(error)")
        }
        
    }
}

//
//  CoreDataManager.swift
//  NoSimulatorModel
//
//  Created by Brad Leege on 11/11/24.
//

import Foundation
import CoreData

public protocol CoreDataManager {
    func saveButtonTap(date: Date) throws
    func loadAllButtonTaps() throws -> [ButtonTap]
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
    
    public func saveButtonTap(date: Date) throws {
        
        guard let context = persistentContainer?.viewContext else {
            throw ModelErrors.noPersistentContainer
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
    
    public func loadAllButtonTaps() throws -> [ButtonTap] {
        guard let context = persistentContainer?.viewContext else {
            throw ModelErrors.noPersistentContainer
        }
        
        let request: NSFetchRequest<ButtonTap> = ButtonTap.fetchRequest()
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching button taps: \(error)")
            return []
        }
    }
}

//
//  CoreDataStore.swift
//  Recipes
//
//  Created by Gary Kagan on 6/28/15.
//  Copyright © 2015 Gary Kagan. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack: NSObject {
    static let defaultStack: CoreDataStack = CoreDataStack()
    
    lazy var appName: String = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String
    
    lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        
        /// We assume that the model name will be the same as the app name.  In the future I will factor this out with a new initializer that lets you specify the model name if it differs from the app name
        let modelURL = NSBundle.mainBundle().URLForResource(self.appName, withExtension: "momd")
        if (modelURL == nil) {
            fatalError("Could not find model")
        }
        
        /// We assume that the persistent store name will be the same as the app name.  In the future I will factor this out with a new initializer that lets you specify the persistent store name if it differs from the app name.
        let persistentStoreURL = self.applicationDocumentsDirectory.URLByAppendingPathComponent("\(self.appName).sqlite")
        
        let managedObjectModel = NSManagedObjectModel(contentsOfURL: modelURL!)!
        
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        let persistentStoreOptions = [ NSInferMappingModelAutomaticallyOption : true, NSMigratePersistentStoresAutomaticallyOption : true, NSSQLitePragmasOption : [ "synchronous" : "OFF" ] ]
        
        do {
            try coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: persistentStoreURL, options: persistentStoreOptions)
        } catch {
            // Report any error we got.
            var dict = [String: AnyObject]()
            dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
            dict[NSLocalizedFailureReasonErrorKey] = "There was an error creating or loading the application's saved data."
            
            dict[NSUnderlyingErrorKey] = error as NSError
            let wrappedError = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
            // Replace this with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()

        }
        
        return coordinator
    }()
    
    lazy var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.gkagan.Recipes" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1]
    }()
    
    let privateQueueContext: NSManagedObjectContext = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
    let mainQueueContext: NSManagedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
    let synchronizationQueue = dispatch_queue_create("com.gkagan.coreDataSynchronization", nil)
    
    override init() {
        super.init()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contextDidSavePrivateQueue:", name: NSManagedObjectContextDidSaveNotification, object: self.privateQueueContext)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "contextDidSaveMainQueue:", name: NSManagedObjectContextDidSaveNotification, object: self.mainQueueContext)
        
        privateQueueContext.persistentStoreCoordinator = persistentStoreCoordinator
        mainQueueContext.persistentStoreCoordinator = persistentStoreCoordinator
    }
    
    /// Sync our main queue context with our freshly saved private queue context
    func contextDidSavePrivateQueue(notification: NSNotification) {
        dispatch_sync(synchronizationQueue) {
            self.mainQueueContext.mergeChangesFromContextDidSaveNotification(notification)
        }
    }
    
    /// Sync our private queue context with our freshly saved main queue context
    func contextDidSaveMainQueue(notification: NSNotification) {
        dispatch_sync(synchronizationQueue) {
            self.privateQueueContext.mergeChangesFromContextDidSaveNotification(notification)
        }
    }
}

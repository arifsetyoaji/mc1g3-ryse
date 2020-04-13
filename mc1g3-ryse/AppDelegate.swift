//
//  AppDelegate.swift
//  mc1g3-ryse
//
//  Created by Grace Cindy on 03/04/20.
//  Copyright © 2020 Grace Cindy. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print(paths[0])
        
        window = UIWindow.init(frame: UIScreen.main.bounds)

        if isAppAlreadyLaunchedOnce() {
            goToMain()
        } else {
            goToOnboard()
        }
        
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
        self.saveContext()
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "rimainderApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func goToOnboard() {
        let onboardStoryboard = UIStoryboard(name: "Onboard", bundle: nil)
        
        let onboardVC = onboardStoryboard.instantiateViewController(identifier: "onboardVC")
        
        let onboardNav = UINavigationController(rootViewController: onboardVC)
        
        self.window?.rootViewController = onboardNav
    }
    
    func goToMain() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let mainVC = mainStoryboard.instantiateViewController(identifier: "mainVC")
        
        let mainNav = UINavigationController(rootViewController: mainVC)
        
        self.window?.rootViewController = mainNav
    }
    
    func isAppAlreadyLaunchedOnce() -> Bool{
        let defaults = UserDefaults.standard.bool(forKey: "isAppAlreadyLaunchedOnce")
        if defaults {
            print("App already launch")
            return true
        } else {
            UserDefaults.standard.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
        
    }
    
}


//
//  AppDelegate.swift
//  friendFinder
//
//  Created by Daniel Thompson on 2/24/17.
//  Copyright © 2017 Daniel Thompson. All rights reserved.
//

import UIKit
import CoreData
import Fakery

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // with this event handler the code will run upon startup of the application
        // first we import the faker cocoapod which will be used to generate dummy data
        
        let faker = Faker(locale: "en_US")
        
        // then, we set up our data sources -- managedobjectcontext for writing to db,
        // user defaults for storing meta information that persists for entire app installation
        
        let moc = persistentContainer.viewContext
        let defaults = UserDefaults.standard
        
        // print(defaults.value(forKey: "GeneratedPeople"))
        
        // we only want to generate data if it hasn't been generated before (helper function defined below)
        if !keyIsPresentInUserDefaults(key: "GeneratedPeople") {
            
            print("generating data...")
            
            // generates a large list of random people
            // who will become friends? Only destiny will decide.. Provided your code works.
            for i in 1...250 {
                
                let newPerson = Person(context: moc)
                
                newPerson.name = faker.name.firstName() + " " + faker.name.lastName()
                
                newPerson.age = 18 + Int(arc4random_uniform(90))
                
                let streetAdress = faker.address.streetAddress()
                let city = faker.address.city()
                let state = faker.address.stateAbbreviation()
                let postCode = faker.address.postcode()
                newPerson.address = streetAdress + " " + city + " " + state + " " + postCode
                
                let now = Date()
                let units: Set<Calendar.Component> = [.hour, .day, .month, .year]
                var components = Calendar.current.dateComponents(units, from: now)
                let randomAmt = Int(arc4random_uniform(60))
                let randomDaysAgo:Int = components.day! - randomAmt
                components.setValue(randomDaysAgo, for: .day)
                components.day = randomDaysAgo
                let randomTimeAgo = Calendar(identifier: .gregorian).date(from: components)!
                newPerson.date_joined = randomTimeAgo
                
                switch i % 4 {
                case 0:
                    newPerson.hobby = "Cycling"
                    newPerson.likes_sports = true
                case 1:
                    newPerson.hobby = "Cooking"
                    newPerson.likes_sports = false
                case 2:
                    newPerson.hobby = "MMORPGs"
                    newPerson.likes_sports = false
                case 3:
                    newPerson.hobby = "Drinking"
                    newPerson.likes_sports = true
                default:
                    newPerson.hobby = "MMORPGs"
                    newPerson.likes_sports = false
                }
                
            }
            
            saveContext()
            
            defaults.set(true, forKey: "GeneratedPeople")
            
        }
        
        return true
    }
    
    func keyIsPresentInUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
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
        let container = NSPersistentContainer(name: "friendFinder")
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

}


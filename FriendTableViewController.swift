//
//  FriendTableViewController.swift
//  friendFinder
//
//  Created by Daniel Thompson on 2/26/17.
//  Copyright © 2017 Daniel Thompson. All rights reserved.
//

import UIKit
import CoreData

class FriendTableViewController: UITableViewController {
    
    
    // declare variables
    var filter: String?
    var loggedInPerson: Person?
    var loggedInPersonState: String?
    
    
    // prepare for fetching people data
    var people = [Person]()
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    
    // view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // call filter function with correct filter
        people = fetchPeople(withFilter: filter ?? "the Same Hobby")

    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)

        cell.textLabel?.text = people[indexPath.row].name

        return cell
    }
    
    
    
    // fetch the correct people based on filter
    func fetchPeople(withFilter:String) -> [Person] {
        
        let friendRequest: NSFetchRequest<Person> = Person.fetchRequest()
        var friendPredicate: NSPredicate?
        let locationPredicate = NSPredicate(format: "address CONTAINS[c] %@", loggedInPersonState!)
        let notMePredicate = NSPredicate(format: "name != %@", (loggedInPerson?.name)!)
        
        switch withFilter {
            case "the Same Hobby":
                friendPredicate = NSPredicate(format: "hobby == %@", (loggedInPerson?.hobby)!)
            case "Joined Recently":
                friendPredicate = NSPredicate(format: "date_joined > %@", (loggedInPerson?.date_joined)! as NSDate)
            case "a Similar Age":
                let age = (loggedInPerson?.age)!
                friendPredicate = NSPredicate(format: "(age >= %@) && (age <= %@)", argumentArray: [(age - 5), (age + 5)])
            case "a Liking For Sports":
                let likesSports = (loggedInPerson?.likes_sports)!
                friendPredicate = NSPredicate(format: "likes_sports == %@", NSNumber(value: likesSports))
        default:
            print("ERROR!")
        }
        
        friendRequest.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [friendPredicate!, locationPredicate, notMePredicate])
        
        
        
        do {
            let fetchedPeople: [Person] = try moc.fetch(friendRequest)
            return fetchedPeople
        } catch {
            print(error)
            // alert that no people could be found
            return [Person]()
        }
        
    
    }

}

//
//  FriendTimeController.swift
//  friendFinder
//
//  Created by Daniel Thompson on 2/26/17.
//  Copyright © 2017 Daniel Thompson. All rights reserved.
//

import UIKit
import CoreData

class FriendTimeController: UIViewController {
    
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var loggedInPerson: Person?
    var loggedInPersonAddressInfo: [[String: String]]?
    var loggedInPersonState: String?
    var peopleInAreaCount: Int?
    
    @IBOutlet weak var peopleInAreaLabel: UILabel!
    @IBOutlet weak var loggedInPersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loggedInPerson = findRandomPersonToLogIn()
        loggedInPersonLabel.text = loggedInPerson?.name
        
        loggedInPersonAddressInfo = getAddress(from: (loggedInPerson?.address)!)
        loggedInPersonState = (loggedInPersonAddressInfo?[0]["State"])!
        
        peopleInAreaCount = findPeopleCount(location: loggedInPerson!.address!)
        peopleInAreaLabel.text = "\(peopleInAreaCount!) other people in \(loggedInPersonState!)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func findRandomPersonToLogIn() -> Person? {
        
        let friendRequest: NSFetchRequest<Person> = Person.fetchRequest()
        
        do {
            let fetchedPeople: [Person] = try moc.fetch(friendRequest)
            let randomIndex = Int(arc4random_uniform(UInt32(fetchedPeople.count)))
            let chosenOne = fetchedPeople[randomIndex]
            
            return chosenOne
            
        } catch {
            print(error)
            return nil
        }
        
    }
    
    func findPeopleCount(location: String) -> Int {
        
        let fetchRequestForPeopleAtLocation: NSFetchRequest<Person> = Person.fetchRequest()
        
        let statePredicate = NSPredicate(format: "%K CONTAINS[c] %@", "address", loggedInPersonState!)
        fetchRequestForPeopleAtLocation.predicate = statePredicate
        
        // results will be an optional (failed try results in nil value)
        // after getting results, we either return count or 0
        let nearbyPeople = try? moc.count(for: fetchRequestForPeopleAtLocation)
        return nearbyPeople ?? 0

    }
    
    func getAddress(from dataString: String) -> [[String: String]] {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.address.rawValue)
        let matches = detector.matches(in: dataString, options: [], range: NSRange(location: 0, length: dataString.utf16.count))
        
        var resultsArray =  [[String: String]]()
        // put matches into array of Strings
        for match in matches {
            if match.resultType == .address,
                let components = match.addressComponents {
                resultsArray.append(components)
            } else {
                print("no components found")
            }
        }
        return resultsArray
    }

}

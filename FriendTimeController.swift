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
    
    
    
    // create reference to AppDelegate managed object context
    let moc = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // declare variables that will be used to pass data and compose interface
    var loggedInPerson: Person?
    var loggedInPersonAddressInfo: [[String: String]]?
    var loggedInPersonState: String?
    var peopleInAreaCount: Int?
    
    // outlet labels for modifying view text
    @IBOutlet weak var peopleInAreaLabel: UILabel!
    @IBOutlet weak var loggedInPersonLabel: UILabel!
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // find random person from all available people in the database
        loggedInPerson = findRandomPersonToLogIn()
        loggedInPersonLabel.text = loggedInPerson?.name
        
        
        // parse address information and save state for later querying
        if let realLoggedInPerson = loggedInPerson {
            loggedInPersonAddressInfo = AddressHelpers.getAddress(from: (realLoggedInPerson.address)!)
            loggedInPersonState = (loggedInPersonAddressInfo?[0]["State"])!
            
            // generate count of eligible friends (people who live in same state)
            peopleInAreaCount = findPeopleCount(location: loggedInPerson!.address!)
            peopleInAreaLabel.text = "\(peopleInAreaCount!) other people in \(loggedInPersonState!)"
        }
        
        
    }
    
    
    
    
    
    // MARK: Segue relate code ::::::::::::::::::::::::::
    
    @IBAction func friendTimeButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "friendTime", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! FriendFinderController
        vc.loggedInPerson = loggedInPerson
        vc.loggedInPersonState = loggedInPersonState
    }
    
    
    
    
    
    // MARK: Challenge - find info for interface (find person, find count of people in state)
    
    // determine how many other people live in logged in user's state
    func findPeopleCount(location: String) -> Int {
        
        // hint -- check out countForFetchRequest
        
        return -1
        
    }
    
    // find random person from all available people in database
    func findRandomPersonToLogIn() -> Person? {
        
        // log in user as one random person
        
        return nil
        
    }
    
    
    

}

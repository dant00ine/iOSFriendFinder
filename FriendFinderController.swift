//
//  FriendFinderController.swift
//  friendFinder
//
//  Created by Daniel Thompson on 2/26/17.
//  Copyright © 2017 Daniel Thompson. All rights reserved.
//

import UIKit

class FriendFinderController: UIViewController {
    
    
    // set up outlets and variables
    @IBOutlet weak var locationLabel: UILabel!
    
    var loggedInPerson: Person?
    var loggedInPersonState: String?
    
    
    // view controller lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        locationLabel.text = loggedInPersonState ?? "No state T_T"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let filter = sender as? String
        
        // pass data to construct filter for tableView query
        let vc = segue.destination as? FriendTableViewController
        vc?.filter = filter
        vc?.loggedInPerson = loggedInPerson
        vc?.loggedInPersonState = loggedInPersonState
        
    }
    
    
    // action outlets
    @IBAction func friendFilterButtonPressed(_ sender: UIButton) {
        
        let buttonTitle = sender.currentTitle
        performSegue(withIdentifier: "findFriends", sender: buttonTitle)
    }
}

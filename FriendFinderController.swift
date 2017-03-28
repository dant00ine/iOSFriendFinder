//
//  FriendFinderController.swift
//  friendFinder
//
//  Created by Daniel Thompson on 2/26/17.
//  Copyright © 2017 Daniel Thompson. All rights reserved.
//

import UIKit

class FriendFinderController: UIViewController {
    
    var loggedInPerson: Person?
    var loggedInPersonState: String?

    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationLabel.text = loggedInPersonState!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let filter = sender as? String
        
        let vc = segue.destination as? FriendTableViewController
        vc?.filter = filter
        vc?.loggedInPerson = loggedInPerson
        vc?.loggedInPersonState = loggedInPersonState
        
    }
    
    @IBAction func friendFilterButtonPressed(_ sender: UIButton) {
        
        let buttonTitle = sender.currentTitle
        performSegue(withIdentifier: "findFriends", sender: buttonTitle)
    }
}

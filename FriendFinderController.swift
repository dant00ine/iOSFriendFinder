//
//  FriendFinderController.swift
//  friendFinder
//
//  Created by Daniel Thompson on 2/26/17.
//  Copyright © 2017 Daniel Thompson. All rights reserved.
//

import UIKit
//
//class sortButton: UIButton {
//    
//    
//    
////    print(self.title)
//    
//}

class FriendFinderController: UIViewController {
    
    var thisPerson: Person?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let filter = sender as! String
        
    }
    
    @IBAction func friendFilterButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "findFriends", sender: sender.title)
    }
}

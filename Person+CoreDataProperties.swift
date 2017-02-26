//
//  Person+CoreDataProperties.swift
//  friendFinder
//
//  Created by Daniel Thompson on 2/26/17.
//  Copyright © 2017 Daniel Thompson. All rights reserved.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person");
    }

    @NSManaged public var address: String?
    @NSManaged public var hobby: String?
    @NSManaged public var likes_sports: Bool
    @NSManaged public var name: String?

}

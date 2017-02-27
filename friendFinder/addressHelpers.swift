//
//  addressHelpers.swift
//  friendFinder
//
//  Created by Daniel Thompson on 2/26/17.
//  Copyright © 2017 Daniel Thompson. All rights reserved.
//

import Foundation

class AddressHelpers {
    static func getAddress(from dataString: String) -> [[String: String]] {
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



//
//  Card.swift
//  Concentration3
//
//  Created by Boris Chen on 1/9/2019.
//  Copyright © 2019 Boris Chen. All rights reserved.
//

import Foundation

struct Card{
    var isFacedUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    static func getIdentifier() -> Int{
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        let identifier = Card.getIdentifier()
        self.identifier = identifier
    }
}

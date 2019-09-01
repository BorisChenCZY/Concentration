//
//  Card.swift
//  Concentration3
//
//  Created by Boris Chen on 1/9/2019.
//  Copyright © 2019 Boris Chen. All rights reserved.
//

import Foundation

struct Card: Hashable{
    var isFacedUp = false
    var isMatched = false
    private var identifier: Int
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    
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

//
//  Concentration.swift
//  Concentration3
//
//  Created by Boris Chen on 1/9/2019.
//  Copyright © 2019 Boris Chen. All rights reserved.
//

import Foundation

class Concentration{
    var cards = [Card]()
    var oneAndOnlyOneFacedUpIndex:Int?
    var flipCount = 0
    var score = 0
    var encounteredIdentifiers = Set<Int>()
    
    init(numberOfCards:Int) {
        for _ in 1...numberOfCards{
            let card = Card()
            cards += [card, card]
        }
        cards.shuffle()
        flipCount = 0
    }
    
    func selectCard(of index:Int){
        flipCount += 1
        
        if let facedUpIndex = oneAndOnlyOneFacedUpIndex, facedUpIndex != index {
            if (cards[facedUpIndex].identifier == cards[index].identifier)
            {
                cards[facedUpIndex].isMatched = true
                cards[index].isMatched = true
                score += 2
            } else {
                if encounteredIdentifiers.contains(cards[facedUpIndex].identifier){
                    score -= 1
                }
                encounteredIdentifiers.insert(cards[index].identifier)
                encounteredIdentifiers.insert(cards[facedUpIndex].identifier)
            }
            oneAndOnlyOneFacedUpIndex = nil
            cards[index].isFacedUp = true
        } else {
            for facedDownIndex in cards.indices {
                cards[facedDownIndex].isFacedUp = false
            }
            oneAndOnlyOneFacedUpIndex = index
            cards[index].isFacedUp = true
        }
        
        
    }
    
}

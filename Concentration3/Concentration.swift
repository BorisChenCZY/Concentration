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
    var oneAndOnlyOneFacedUpIndex:Int? {
        get {
            return cards.indices.filter{ cards[$0].isFacedUp }.oneAndOnly
        }
        
        set {
            for index in cards.indices {
                cards[index].isFacedUp = (newValue == index)
            }

        }
    }
    
    var flipCount = 0
    var score = 0
    var encounteredIdentifiers = Set<Card>()
    
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
            if (cards[facedUpIndex] == cards[index])
            {
                cards[facedUpIndex].isMatched = true
                cards[index].isMatched = true
                score += 2
            } else {
                if encounteredIdentifiers.contains(cards[facedUpIndex]){
                    score -= 1
                }
                encounteredIdentifiers.insert(cards[index])
                encounteredIdentifiers.insert(cards[facedUpIndex])
            }
            // oneAndOnlyOneFacedUpIndex = nil
            cards[index].isFacedUp = true
        } else {
            oneAndOnlyOneFacedUpIndex = index
            // cards[index].isFacedUp = true
        }
        
        
    }
    
}

extension Collection {
    var oneAndOnly:Element? {
        return count == 1 ? self.first : nil;
    }
}

//
//  ViewController.swift
//  Concentration3
//
//  Created by Boris Chen on 31/8/2019.
//  Copyright © 2019 Boris Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfCards: (buttonArray.count + 1) / 2)
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var buttonArray: [UIButton]!
    
    @IBAction func touchButton(_ sender: UIButton) {
        if let cardNumber = buttonArray.firstIndex(of: sender) {
            game.selectCard(of: cardNumber)
            updateViewFromModel()
        } else {
            print("This is a bad button")
        }
    }
    
    func updateViewFromModel(){
        for cardIndex in buttonArray.indices {
            let card = game.cards[cardIndex]
            let sender = buttonArray[cardIndex]
            if (card.isFacedUp){
                sender.setTitle(getEmoji(of: card.identifier), for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                sender.setTitle("", for: UIControl.State.normal)
                sender.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
        counterLabel.text = "Flips: \(game.flipCount)"
        scoreLabel.text = "Scores: \(game.score)"
    }
    
    var emojiChoices = ["👻", "💯", "😈", "😸", "🔫", "🍑", "🍎","🍬", "😱"]
    var emojiDict = [Int:String]()
    
    func getEmoji(of identifier:Int) -> String{
        if emojiDict[identifier] == nil, emojiChoices.count > 0 {
            let removeIndex = Int(arc4random_uniform((UInt32(emojiChoices.count))))
            let emoji = emojiChoices.remove(at: removeIndex)
            emojiDict[identifier] = emoji;
        }
        return emojiDict[identifier] ?? "?"
    }

    @IBAction func touchNewGame(_ sender: UIButton) {
        game = Concentration(numberOfCards: (buttonArray.count + 1) / 2)
        emojiChoices = ["👻", "💯", "😈", "😸", "🔫", "🍑", "🍎","🍬", "😱"]
        emojiDict = [Int:String]()
        updateViewFromModel()
    }
}


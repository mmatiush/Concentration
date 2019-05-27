//
//  ViewController.swift
//  Concentration
//
//  Created by Maksym MATIUSHCHENKO on 4/6/19.
//  Copyright © 2019 Maksym MATIUSHCHENKO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private lazy var game = Concentration(numberOfPairsOfCars: numberOfPairsOfCars)
    
    var numberOfPairsOfCars: Int {
        return (cardButtons.count + 1) / 2
    }
    
    private(set) var flipCount = 0 {
        didSet {
            let attribuetes: [NSAttributedStringKey:Any] = [
                .strokeWidth : 0.5,
                .strokeColor : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            ]
            let attrtibutedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attribuetes)
            flipCountLabel.attributedText = attrtibutedString
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in the CardButtons")
        }

    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceup {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
            }

        }
    }
    
//    private var emojiChoices = ["🦇", "😱", "🙀" , "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    private var emojiChoices = "🦇😱🙀😈🎃👻🍭🍬🍎"

    private var emoji = [Card:String]()
    
    private func emoji(for card: Card ) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emoji.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

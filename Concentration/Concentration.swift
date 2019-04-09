//
//  Concentration.swift
//  Concentration
//
//  Created by Maksym MATIUSHCHENKO on 4/8/19.
//  Copyright © 2019 Maksym MATIUSHCHENKO. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    
    var indexOfOneAndOnlyOneFaceUpCard: Int?
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyOneFaceUpCard, matchIndex != index {
                if cards[matchIndex].idnetifier == cards[index].idnetifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyOneFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceup = false
                }
                cards[index].isFaceup = true
                indexOfOneAndOnlyOneFaceUpCard = index
            }
        }
    }

    init(numberOfPairsOfCars: Int) {
        for _ in 1...numberOfPairsOfCars {
            let card = Card()
            cards += [card, card]
        }
        // TODO: Shuffle the cards
    }
}

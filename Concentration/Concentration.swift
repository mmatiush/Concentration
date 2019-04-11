//
//  Concentration.swift
//  Concentration
//
//  Created by Maksym MATIUSHCHENKO on 4/8/19.
//  Copyright © 2019 Maksym MATIUSHCHENKO. All rights reserved.
//

import Foundation

class Concentration {
    
    private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyOneFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceup {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceup = (index == newValue)
            }
        }
    }

    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyOneFaceUpCard, matchIndex != index {
                if cards[matchIndex].idnetifier == cards[index].idnetifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceup = true
            } else {
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

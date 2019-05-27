//
//  Card.swift
//  Concentration
//
//  Created by Maksym MATIUSHCHENKO on 4/8/19.
//  Copyright © 2019 Maksym MATIUSHCHENKO. All rights reserved.
//

import Foundation

struct Card {
    var isFaceup =  false
    var isMatched = false
    private var idnetifier: Int
    
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        idnetifier = Card.getUniqueIdentifier()
    }
    
}

extension Card: Hashable        {
    var hashValue: Int {
        return idnetifier
    }
    
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.idnetifier == rhs.idnetifier
    }
}


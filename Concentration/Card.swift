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
    var idnetifier: Int
    
    static var identifierFactory = 0
    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        idnetifier = Card.getUniqueIdentifier()
    }
    
}

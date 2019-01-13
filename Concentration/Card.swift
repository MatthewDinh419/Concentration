//
//  Card.swift
//  Concentration
//
//  Created by Matthew Dinh on 12/27/18.
//  Copyright © 2018 Matthew Dinh. All rights reserved.
//

import Foundation

struct Card: Hashable{
    var hashValue: Int{
        return identifier
    }
    static func ==(lhs: Card, rhs: Card) ->  Bool{
        return lhs.identifier == rhs.identifier
    }
    var isMatched = false
    var isFaceUp = false
    var identifier: Int
    private static var global_ident = 0
    
    private static func UpdateIdent() -> Int{
        global_ident += 1
        return global_ident
    }
    
    init() {
        self.identifier = Card.UpdateIdent()
    }
}

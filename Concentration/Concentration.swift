//
//  Concentration.swift
//  Concentration
//
//  Created by Matthew Dinh on 12/27/18.
//  Copyright © 2018 Matthew Dinh. All rights reserved.
//

import Foundation

class Concentration{
    private(set) var cards = [Card]()
    private(set) static var indexOfFaceUpCard: Int?
    public static var points = 0
    private(set) var flipCount = 0
    
    func chooseCard(at index: Int){
        flipCount += 1
        if !cards[index].isMatched{
            if let matchIndex = Concentration.indexOfFaceUpCard, matchIndex != index{ //A card is already faced up already
                if cards[index] == cards[matchIndex]{ //Match
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                }
                cards[index].isFaceUp = true
                Concentration.indexOfFaceUpCard = nil
            }
            else{
                //No cards or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                Concentration.indexOfFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        for _ in cards.indices{
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            cards += [cards.remove(at: randomIndex)]
        }
    }
}

//
//  ViewController.swift
//  Concentration
//
//  Created by Matthew Dinh on 12/27/18.
//  Copyright © 2018 Matthew Dinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SelectThemeDelegate{
    private lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    private var backgroundColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    private var cardColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    @IBOutlet private weak var newGameButton: UIButton!
    @IBOutlet private var cardButtons: [UIButton]!
    private var emoji_list = "😂😇🙃😍😛😘😎😌😡😭"
    private var card_to_emoji_dict = [Card: String]()
    @IBOutlet private weak var pointLabel: UILabel!
    private var emojis_seen = [String]()
    private var finished = true
    
    override func viewDidLoad(){
        super.viewDidLoad()
    }
    
    @IBAction private func newThemeTapped() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let selectionVC = sb.instantiateViewController(withIdentifier: "SelectThemeViewController") as! SelectThemeViewController
        selectionVC.selectionDelegate = self
        present(selectionVC, animated: true, completion: nil)
    }
    
    internal func didTapChoice(emojiList: String, backgroundColor_: UIColor, cardColor_: UIColor){
        emoji_list = emojiList
        backgroundColor = backgroundColor_
        self.view.backgroundColor = backgroundColor_
        cardColor = cardColor_
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        pointLabel.textColor = cardColor
        newGameButton.setTitle("New Game", for: UIControl.State.normal)
        newGameButton.backgroundColor = cardColor
        if cardColor_ == #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1){
            newGameButton.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        for index in cardButtons.indices{
            let button = cardButtons[index]
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = cardColor
        }
        Concentration.points = 0
        pointLabel.text = "Points: " + String(Concentration.points)
    }

    private var counter = 0
    @IBAction private func TapCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender){
            var matchEmoji = "?"
            if Concentration.indexOfFaceUpCard != nil{
                matchEmoji = emoji(for: game.cards[Concentration.indexOfFaceUpCard!])
            }
            game.chooseCard(at: cardNumber)
            counter += 1
            if counter == 2{
                let cardEmoji = emoji(for: game.cards[cardNumber])
                if emojis_seen.contains(matchEmoji), emojis_seen.contains(cardEmoji){
                    if !game.cards[cardNumber].isMatched{ //Both have been seen, no match
                        Concentration.points -= 2
                    }
                    else{
                        Concentration.points += 1
                    }
                    //Both have been seen, there is match no points awarded/deducted
                }
                else if (emojis_seen.contains(matchEmoji) && !emojis_seen.contains(cardEmoji)) ||
                    (!emojis_seen.contains(matchEmoji) && emojis_seen.contains(cardEmoji)){
                    if game.cards[cardNumber].isMatched{ //One has been seen, there is a match
                        Concentration.points += 1
                    }
                    else{ //One has been seen, no match
                        Concentration.points -= 1
                    }
                    if !emojis_seen.contains(matchEmoji){
                        emojis_seen.append(matchEmoji)
                    }
                    else{
                        emojis_seen.append(cardEmoji)
                    }
                }
                else{ //No cards have been seen
                    if game.cards[cardNumber].isMatched{
                        Concentration.points += 2
                    }
                    else{
                        emojis_seen += [matchEmoji,cardEmoji]
                    }
                }
                counter = 0
            }
            UpdateViewFromModel()
        }
    }
    
    private func UpdateViewFromModel(){
        finished = true
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : cardColor
            }
            if !card.isMatched{
                finished = false
            }
        }
        if finished{
            print(backgroundColor, cardColor)
            didTapChoice(emojiList: emoji_list, backgroundColor_: backgroundColor, cardColor_: cardColor)
        }
        pointLabel.text = "Points: " + String(Concentration.points)
    }
    
    private func emoji(for card: Card) -> String{
        if card_to_emoji_dict[card] == nil, emoji_list.count > 0{
            let randomIndex = emoji_list.index(emoji_list.startIndex, offsetBy: emoji_list.count.arc4random)
            card_to_emoji_dict[card] = String(emoji_list.remove(at: randomIndex))
        }
        return card_to_emoji_dict[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0{
            return Int(arc4random_uniform(UInt32(self)))
        }
        else{
            return 0
        }
    }
}

//
//  SelectTheme.swift
//  Concentration
//
//  Created by Matthew Dinh on 1/3/19.
//  Copyright © 2019 Matthew Dinh. All rights reserved.
//

import Foundation
import UIKit

protocol SelectThemeDelegate {
    func didTapChoice(emojiList: String, backgroundColor_: UIColor, cardColor_: UIColor)
}

class SelectThemeViewController: UIViewController{
    
    var selectionDelegate: SelectThemeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func defaultTapped() {
        selectionDelegate?.didTapChoice(emojiList: "😂😇🙃😍😛😘😎😌😡😭", backgroundColor_: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), cardColor_: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func halloweenTapped() {
        selectionDelegate?.didTapChoice(emojiList: "😇😈👻👽🙀🤡💀🎃👺🧛‍♀️", backgroundColor_: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), cardColor_: #colorLiteral(red: 1, green: 0.4912648167, blue: 0, alpha: 1))
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func christmasTapped() {
        selectionDelegate?.didTapChoice(emojiList: "🎅🎄🤶🎁⛄️❄️☃️🤰👨‍👩‍👧‍👧👪", backgroundColor_: #colorLiteral(red: 1, green: 0.9362711068, blue: 0.01573334029, alpha: 1), cardColor_: #colorLiteral(red: 1, green: 0.108322438, blue: 0, alpha: 1))
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func animalsTapped() {
        selectionDelegate?.didTapChoice(emojiList: "🦔🐀🐄🐍🐑🦉🦊🐶🐵🐷", backgroundColor_: #colorLiteral(red: 0.6273854382, green: 0.6666666865, blue: 0.5055868967, alpha: 1), cardColor_: #colorLiteral(red: 0.4120296993, green: 0.1538292254, blue: 0, alpha: 1))
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func clothingTapped() {
        selectionDelegate?.didTapChoice(emojiList: "👙👗👔👚👕👖🧤🧢👒🧦", backgroundColor_: #colorLiteral(red: 1, green: 0.9362711068, blue: 0.01573334029, alpha: 1), cardColor_: #colorLiteral(red: 0.9121397345, green: 0, blue: 0.786966416, alpha: 1))
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func foodTapped() {
        selectionDelegate?.didTapChoice(emojiList: "🌭🌮🍔🍙🍟🥗🍖🍕🍞🍝", backgroundColor_: #colorLiteral(red: 0.9121397345, green: 0.7359497547, blue: 0.8164760405, alpha: 1), cardColor_: #colorLiteral(red: 0, green: 0.2060808623, blue: 0.9121397345, alpha: 1))
        dismiss(animated: true, completion: nil)
    }
}

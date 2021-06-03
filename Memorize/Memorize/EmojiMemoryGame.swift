//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jonathan Horsman on 6/2/21.
//

import SwiftUI

class EmojiMemoryGame {

    static let smileysList = ["😜", "😊", "😉","😇", "🤩", "🥳", "😎", "🤓", "🤠", "🤑", "🤕", "😤"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            smileysList[pairIndex]
        }
    }
    
    private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}


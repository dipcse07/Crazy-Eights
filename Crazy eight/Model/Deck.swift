

import Foundation
import SpriteKit

final class Deck {

    public let numberOfCardsInDeck = 54
    public var cards: [Card] = []

    init(shuffled: Bool = false, parentNode: SKNode) {
        //52 cards
        for suit in CardSuit.allSuits() {
            for value in CardValue.standartValues() {
                cards.append(Card(cardSuit: suit, cardValue: value, parentNode: parentNode))
            }
        }
        
        //2 special cards. Jokers
        for value in CardValue.specialValues() {
            cards.append(Card(cardSuit: .joker, cardValue: value, parentNode: parentNode))
        }
        
        if shuffled {
            cards.shuffle()
        }
    }
    
    func drawCard() -> Card {
        assert(!cards.isEmpty, "Deck was empty while drawing form it")
        return cards.removeFirst()
    }
    
    func shufleDeck() {
        cards.shuffle()
    }
}

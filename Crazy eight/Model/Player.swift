
import Foundation

final class Player {
    fileprivate var cards: [Card] = []
}

extension Player {
    //MARK: - Public functions
    func addCard(card: Card) {
        self.cards.append(card)
    }
    
    func removeCards(cards: [Card]) {
        self.cards.remove(objects: cards)
    }
    
    func orderCards() {
        cards.sort { card1, card2 in card1 < card2 }
    }
}

private extension Card {
    //MARK: - Private functions 
    
}

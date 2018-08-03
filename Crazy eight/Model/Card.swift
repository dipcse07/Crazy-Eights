

import SpriteKit

enum CardLevel :CGFloat {
    case board = 10
    case moving = 100
    case enlarged = 200
}

enum CardSuit: String {
    case spade, diamond, heart, club, joker
    
    static func allSuits() -> [CardSuit] {
        return [.spade, .diamond, .heart, .club]
    }
}

enum CardValue: Int {
    case two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace, blackJoker, redJocker
    
    static func standartValues() -> [CardValue] {
        return [.two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king, .ace]
    }
    
    static func specialValues() -> [CardValue] {
        return [.blackJoker, .redJocker]
    }
    
    func texture(suit: CardSuit) -> SKTexture {
        switch self {
        case .ace:
            return SKTexture(imageNamed: "ace_\(suit.rawValue)")
        case .two:
            return SKTexture(imageNamed: "two_\(suit.rawValue)")
        case .three:
            return SKTexture(imageNamed: "three_\(suit.rawValue)")
        case .four:
            return SKTexture(imageNamed: "four_\(suit.rawValue)")
        case .five:
            return SKTexture(imageNamed: "five_\(suit.rawValue)")
        case .six:
            return SKTexture(imageNamed: "six_\(suit.rawValue)")
        case .seven:
            return SKTexture(imageNamed: "seven_\(suit.rawValue)")
        case .eight:
            return SKTexture(imageNamed: "eight_\(suit.rawValue)")
        case .nine:
            return SKTexture(imageNamed: "nine_\(suit.rawValue)")
        case .ten:
            return SKTexture(imageNamed: "ten_\(suit.rawValue)")
        case .jack:
            return SKTexture(imageNamed: "jack_\(suit.rawValue)")
        case .queen:
            return SKTexture(imageNamed: "queen_\(suit.rawValue)")
        case .king:
            return SKTexture(imageNamed: "king_\(suit.rawValue)")
        case .blackJoker:
            return SKTexture(imageNamed: "black_\(suit.rawValue)")
        case .redJocker:
            return SKTexture(imageNamed: "red_\(suit.rawValue)")
        }
    }
}

final class Card: SKSpriteNode {
    
    //MARK: Private Properties
    fileprivate let cardSuit: CardSuit
    fileprivate let cardValue: CardValue
    fileprivate let frontTexture: SKTexture
    fileprivate let backTexture: SKTexture
    fileprivate var parentNode: SKNode
    fileprivate var faceUp = true
    
    //Mark: Public Properties
    var suit: CardSuit {
        get { return self.cardSuit }
    }
    
    var value: CardValue {
        get { return self.cardValue }
    }
    
    init(cardSuit: CardSuit, cardValue: CardValue, parentNode: SKNode) {
        self.cardSuit = cardSuit
        self.cardValue = cardValue
        self.backTexture = SKTexture(imageNamed: "card_back")
        self.backTexture.usesMipmaps = true
        self.frontTexture = cardValue.texture(suit: cardSuit)
        self.frontTexture.usesMipmaps = true
        self.parentNode = parentNode
        super.init(texture: frontTexture, color: .clear, size: frontTexture.size().scaled(scale: 0.5))
        
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var description: String {
        return "(\(self.value), \(self.suit))"
    }
}

extension Card {
    //MARK: - Helpers
    func flip() {
        if faceUp {
            self.texture = backTexture
        } else {
            self.texture = frontTexture
        }
        faceUp = !faceUp
        self.updateFocusIfNeeded()
    }
}

private extension Card {
    //MARK: - Animations
    func dropAnimation(card: Card) {
        card.removeAction(forKey: "pickup")
        card.run(SKAction.scale(to: 1.0, duration: 0.25), withKey: "drop")
    }
    
    func pickUpAnimation(card: Card) {
        card.removeAction(forKey: "drop")
        card.run(SKAction.scale(to: 1.3, duration: 0.15), withKey: "pickup")
    }
}

extension Card {
    //MARK:- Touches
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: parentNode)
            if let card = atPoint(location) as? Card {
                card.position = location
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: parentNode)
            if let card = atPoint(location) as? Card {
                if touch.tapCount > 1 {
                    card.flip()
                }
                pickUpAnimation(card: card)
                card.zPosition = CardLevel.moving.rawValue
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self.parent!)
            if let card = atPoint(location) as? Card {
                card.zPosition = CardLevel.board.rawValue
                dropAnimation(card: card)
                card.removeFromParent()
                parentNode.addChild(card)
            }
        }
    }
}

//MARK:- Comparable
func < (lhs: Card, rhs: Card) -> Bool {
    return lhs.cardValue.rawValue < rhs.cardValue.rawValue
}

func == (lhs: Card, rhs: Card) -> Bool {
    return lhs.value == rhs.value && lhs.suit == rhs.suit
}

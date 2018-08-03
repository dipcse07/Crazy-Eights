//
//  cardDevide.swift
//  Crazy eight
//
//  Created by Admin on 3/8/18.
//  Copyright © 2018 MD.SAZID HASAN DIP. All rights reserved.
//

import UIKit

import Foundation

class cardDevide {
    
    var card = ["ace_club", "eight_club", "five_club", "four_club", "jack_club", "king_club", "nine_club", "queen_club", "seven_club", "six_club", "ten_club", "three_club", "two_club", "ace_diamond", "eight_diamond", "five_diamond", "four_diamond", "jack_diamond", "king_diamond", "nine_diamond", "queen_diamond", "seven_diamond", "six_diamond", "ten_diamond", "three_diamond", "two_diamond", "ace_heart", "eight_heart", "five_heart", "four_heart", "jack_heart", "king_heart", "nine_heart", "queen_heart", "seven_heart", "six_heart", "ten_heart", "three_heart", "two_heart", "ace_spade", "eight_spade", "five_spade", "four_spade", "jack_spade", "king_spade", "nine_spade", "queen_spade", "seven_spade", "six_spade", "ten_spade", "three_spade", "two_spade"]
    
    var cardshuffled = [String]()
    var user1 = [String]()
    var user2 = [String]()
    
    func cardAllot(){
    
        for i in 0..<card.count{
            let rand = Int (arc4random_uniform(UInt32(card.count)))
            cardshuffled.append(card[rand])
            card.remove(at: rand )
            
            
            
        }
        
        
        print(cardshuffled.indices)
        
        for i in 0..<8{
            
            user1.append(cardshuffled[i])
            cardshuffled.remove(at: i)
            
            
            
            user2.append(cardshuffled[i])
            cardshuffled.remove(at: i)
            
            
        }
        
    }
   
    
    
}

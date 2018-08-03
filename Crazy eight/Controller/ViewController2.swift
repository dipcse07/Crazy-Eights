//
//  ViewController2.swift
//  Crazy eight
//
//  Created by MD.SAZID HASAN DIP on 13/11/17.
//  Copyright © 2017 MD.SAZID HASAN DIP. All rights reserved.
//

import Foundation
import UIKit
class ViewController2: UIViewController {
    
    
    
    
    let cardDevid = cardDevide()
    

    
    
    @IBOutlet weak var b1image: UIImageView!
    
    @IBOutlet weak var b2image: UIImageView!
  
    @IBOutlet weak var b3image: UIImageView!
    
    
    @IBOutlet weak var b4image: UIImageView!
    
    @IBOutlet weak var b5image: UIImageView!
    
    @IBOutlet weak var b6image: UIImageView!
    
    @IBOutlet weak var b7image: UIImageView!
    
    @IBOutlet weak var b8image: UIImageView!
    
    
    
    @IBAction func DeckShuffle(_ sender: UIButton) {
        
        FirstStack.isHidden = false
        SecondStack.isHidden = false
        
        cardDevid.cardAllot()
        
        if let image = UIImage(named: cardDevid.user1[0]){
            
            b1image.image = image
            b1image.isHidden = false
            
        }
        
        if let image = UIImage(named: cardDevid.user1[1]){
            
            b2image.image = image
             b2image.isHidden = false
            
        }
        if let image = UIImage(named: cardDevid.user1[2]){
            
            b3image.image = image
             b3image.isHidden = false
            
        }
        if let image = UIImage(named: cardDevid.user1[3]){
            
            b4image.image = image
             b4image.isHidden = false
            
        }
        if let image = UIImage(named: cardDevid.user1[4]){
            
            b5image.image = image
             b5image.isHidden = false
            
        }
        if let image = UIImage(named: cardDevid.user1[5]){
            
            b6image.image = image
             b6image.isHidden = false
            
        }
        if let image = UIImage(named: cardDevid.user1[6]){
            
            b7image.image = image
             b7image.isHidden = false
            
        }
        if let image = UIImage(named: cardDevid.user1[7]){
            
            b8image.image = image
             b8image.isHidden = false
            
        }
        
        
        
        
    }
    
    
    
    
    @IBOutlet weak var FirstStack: UIStackView!
    @IBOutlet weak var SecondStack: UIStackView!
    
}

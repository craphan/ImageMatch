//
//  CardModel.swift
//  ImageMatch
//
//  Created by Carly Raphan on 4/25/19.
//  Copyright © 2019 highpoint.edu. All rights reserved.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        var generatedCards = [Card]()
        
        for _ in 1...8 {
            let randomNum = arc4random_uniform(13) + 1
            
            var card1 = Card()
            card1.imageName = "card\(randomNum)"
            generatedCards.append(card1)
            
            var card2 = Card()
            card2.imageName = "card\(randomNum)"
            generatedCards.append(card2)
        }
        
        return generatedCards
    }
}

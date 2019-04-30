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
        
        //generates random pair of cards between numbers
        //1 and 4, so that there are 8 cards
        //when landscape view on simulator, 4 cards even per row
        //when vertical view on simulator, 2 cards per row (not even)
        // ----- need to either code app to automatically switch to
        //       horizontal view, or adjust collection view constraints
        
        for _ in 1...4 {
            let randomNum = arc4random_uniform(4) + 1
            
            //log the number to see four sets of cards
            print("generate random number \(randomNum)" )
            
            var card1 = Card()
            card1.imageName = "card\(randomNum)"
            generatedCards.append(card1)
            
            var card2 = Card()
            card2.imageName = "card\(randomNum)"
            generatedCards.append(card2)
        }
        //printing number of cards to make sure it works
        print(generatedCards.count)
        
        return generatedCards
    }
}

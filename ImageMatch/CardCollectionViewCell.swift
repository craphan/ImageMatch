//
//  CardCollectionViewCell.swift
//  ImageMatch
//
//  Created by Carly Raphan on 4/25/19.
//  Copyright © 2019 highpoint.edu. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var backImageView: UIImageView!
    
    var card:Card?
    
    func setCard(_ card:Card) {
        //keeps track of the card that gets passed in
        self.card = card
        
        //making sure card cells are not reused
        if card.isMatched == true {
            //if matched imageviews are zero
            backImageView.alpha = 0
            frontImageView.alpha = 0
            return
        }
//ERRORS HERE 
     /* else {
         //image views should be here
         //Causing errors 
            backImageView.alpha = 1
            frontImageView.alpha = 1
        }*/
    
        
        frontImageView.image = UIImage(named: card.imageName)
        //Determine flipped state
        if card.isFlipped == true {
            //make sure front is there
            UIView.transition(from: backImageView, to: frontImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        else {
            //make sure back is there
            UIView.transition(from: frontImageView, to: backImageView, duration: 0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
    }
    
    func flipCard() {
        
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.4, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipBack() {
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
           UIView.transition(from: self.frontImageView, to: self.backImageView, duration: 0.4, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
        }
    }
    
    func remove() {
        //remove imageviews
        backImageView.alpha = 0
        //animate
        UIView.animate(withDuration: 0.4, delay: 0.5, options: .curveEaseIn, animations: {
            self.frontImageView.alpha = 0
        }, completion: nil)
    }
}//end of file

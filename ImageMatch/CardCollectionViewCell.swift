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
        UIView.transition(from: frontImageView, to: backImageView, duration: 0.4, options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
    }
}

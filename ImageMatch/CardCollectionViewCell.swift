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
    
    var card: Card?
    
    func setCard(_ card: Card) {
        //keeps track of the card that gets passed in
        self.card = card
        
        frontImageView.image = UIImage(named: card.imageName)
    }
    
    func flipCard() {
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.3, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
    }
    
    func flipBack() {
        
    }
}

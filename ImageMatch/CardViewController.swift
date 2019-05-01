//
//  ViewController.swift
//  ImageMatch
//
//  Created by Carly Raphan on 4/15/19.
//  Copyright © 2019 highpoint.edu. All rights reserved.
//

import UIKit

class CardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var model = CardModel()
    var cards = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //connects collection view delegate and datasource properties to view controller
        
        cards = model.getCards()
        
        collectionView.delegate = self
        collectionView.dataSource = self
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Get a cardCollectionViewCell object
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        //Get the card that collection view is going to display
        let card = cards[indexPath.row]
        
        //set card for the cell
       cell.setCard(card)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //debug
        print("A cell is tapped: \(indexPath.row)")
        //get cell
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        //Get card user selected
        //FLIPPING ERROR MAY BE HERE
        var card = cards[indexPath.row]
        
        if card.isFlipped == false {
            //flip card front
            cell.flipCard()
            
            //set to true
            card.isFlipped = true
            
        }
        else {
            //flip card back
            cell.flipBack()
            
            //keep set to false
            card.isFlipped = false
        }
    }

}


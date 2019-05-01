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
    
    var firstFlipIndex:IndexPath?
    
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
        var card = cards[indexPath.row]
        
        if card.isFlipped == false && card.isMatched == false {
            
            //flip card front
            cell.flipCard()
            
            //set to true
            card.isFlipped = true
            
            //debugging
            if card.isFlipped == true {
                print("true")
            }
            else {
                print("error")
            }
            //determine order of flipping: first or second
            if firstFlipIndex == nil {
                //first card
                firstFlipIndex = indexPath
            }
            else {
                //second card
                //preform matching logic
                checkMatches(indexPath)
            }//end else
            
        }//end big else
        
    }//end func didselect
    func checkMatches(_ secondFlipIndex:IndexPath) {
        
        //get card cells that were revealed
        let cardOneCell = collectionView.cellForItem(at: firstFlipIndex!) as? CardCollectionViewCell
        let  cardTwoCell = collectionView.cellForItem(at: secondFlipIndex) as? CardCollectionViewCell
        //get cards for the two revealed cards
        var cardOne = cards[firstFlipIndex!.row]
        var cardTwo = cards[secondFlipIndex.row]
        
        //compare
        if cardOne.imageName == cardTwo.imageName {
            print("It's a match")
            
            cardOne.isMatched = true
            cardTwo.isMatched  = true
            
            //remove from cells
            cardOneCell?.remove()
            cardTwoCell?.remove()
        }
        else {
            print("It's not a match")
            
            //matching
            cardOne.isFlipped = false
            cardTwo.isFlipped = false
            
            //flip back
            cardOneCell?.flipBack()
            cardTwoCell?.flipBack()
            
        }
        
        //tell collection view to reload cells of first card if it is nil
        if cardOneCell == nil {
            collectionView.reloadItems(at: [firstFlipIndex!])
        }
        
        //reset the property for tracking 
        firstFlipIndex = nil 
    }

}//End view bracket


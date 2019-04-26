//
//  ViewController.swift
//  ImageMatch
//
//  Created by Carly Raphan on 4/15/19.
//  Copyright © 2019 highpoint.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    var model = CardModel()
    var cards = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //connects collection view delegate and datasource properties to view controller
        collectionView.delegate = self
        collectionView.dataSource = self
        cards = model.getCards()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

}


//
//  ViewController.swift
//  ImageMatch
//
//  Created by Carly Raphan on 4/15/19.
//  Copyright © 2019 highpoint.edu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var model = CardModel()
    var cards = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cards = model.getCards()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


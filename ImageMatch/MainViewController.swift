//
//  MainViewController.swift
//  ImageMatch
//
//  Created by Christina Wolff on 4/26/19.
//  Copyright © 2019 highpoint.edu. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    //said buttons with seques
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "HighScores"?: //segues to view list of high scores
            let highScoreViewController = segue.destination as! HighScoreViewController
        case "Login"?: //segues to login in as user
            let loginViewController = segue.destination as! LoginViewController
        case "GameMode"?: //segues to option picker to choose "game mode"
            let cardViewController = segue.destination as! CardViewController
        default:
            preconditionFailure("Unexpected segue indentifier.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Peek at core data
        //  Don't think any of this is useful just yet
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        let context = appDelegate.persistentContainer.viewContext
//
//        let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
//        let newUser = NSManagedObject(entity: entity!, insertInto: context)
//
//        newUser.setValue("tjue", forKey: "username")
//        newUser.setValue("1234", forKey: "password")
//        newUser.setValue("5.4", forKey: "high score")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

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
    
    //  VARIABLES
    //  ------------------------------------
    var usernameArr:[String] = []
    var highScoreArr:[Float] = []
    
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
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Player")
        
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try context.fetch(request)
            
            if results.count > 0
            {
                for result in results as! [NSManagedObject]
                {
                    if let username = result.value(forKey: "username") as? String
                    {
                        usernameArr.append(username)
                    }
                    if let highScore = result.value(forKey: "highScore") as? Float
                    {
                        highScoreArr.append(highScore)
                    }
                }
                
                print(usernameArr)
                print(highScoreArr)
            }
        }
        catch
        {
            //  PROCESS ERRORS
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

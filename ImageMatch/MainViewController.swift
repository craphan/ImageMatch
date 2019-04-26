//
//  MainViewController.swift
//  ImageMatch
//
//  Created by Christina Wolff on 4/26/19.
//  Copyright © 2019 highpoint.edu. All rights reserved.
//

import UIKit
class MainViewController: UIViewController {
    //said buttons with seques
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "HighScores"?: //segues to view list of high scores
            let highScoreViewController = segue.destination as! HighScoreViewController
        case "Login"?: //segues to login in as user
            let loginViewController = segue.destination as! LoginViewController
        case "GameMode"?: //segues to option picker to choose "game mode"
            let optionPickerViewController = segue.destination as! OptionPickerViewController
        default:
            preconditionFailure("Unexpected segue indentifier.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

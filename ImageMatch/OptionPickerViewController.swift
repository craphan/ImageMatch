//
//  OptionPickerViewController.swift
//  ImageMatch
//
//  Created by Christina Wolff on 4/26/19.
//  Copyright © 2019 highpoint.edu. All rights reserved.
//

import UIKit

class OptionPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    //images
    @IBOutlet var pickerView:UIPickerView!
    
    let gameModes = ["Animals", "Fruits", "Sports", "Colors"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gameModes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gameModes[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        /*item.department = gameModes[row]
    }*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "Play"?: //segues to view list of high scores
            let cardViewController = segue.destination as! CardViewController
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

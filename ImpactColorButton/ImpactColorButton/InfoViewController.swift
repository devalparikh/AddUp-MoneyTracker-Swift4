//
//  InfoViewController.swift
//  ImpactColorButton
//
//  Created by Deval Parikh on 6/26/18.
//  Copyright © 2018 Deval Parikh. All rights reserved.
//

import UIKit
let defaults = UserDefaults.standard
class InfoViewController: UIViewController {
    
    //Variable to store AmountRemaining in user defaults
    //var Amount = GlobalVars.AmountRemaining
    
    @IBOutlet weak var ResetButton: DesignableButton!
    @IBOutlet weak var NameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //GlobalVars.AmountRemaining = "0"
        //defaults.set(Amount, forKey: "key")
        NameLabel.text = defaults.string(forKey: "key")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  ImpactColorButton
//
//  Created by Deval Parikh on 6/26/18.
//  Copyright © 2018 Deval Parikh. All rights reserved.
//

import UIKit



struct GlobalVars {
    //User defualt saves and loops back to InfoViewController.swift
    static var AmountRemaining = defaults.string(forKey: "key") as! String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var UpdateButton: DesignableButton!
    @IBOutlet weak var AmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.set(GlobalVars.AmountRemaining, forKey: "key")
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        
        // We'll force unwrap with the !, if you've got defined data you may need more error checking
        let priceString = currencyFormatter.string(from: Double(GlobalVars.AmountRemaining)! as NSNumber)!
        AmountLabel.text = priceString
    }

    @IBAction func UpdateButtonAction(_ sender: Any) {
//        performSegue(withIdentifier: "HomeToMain", sender: self)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var vc = segue.destination as! UpdateViewController
//        vc.AmountRemainingUpdateVC = self.AmountRemaining
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}


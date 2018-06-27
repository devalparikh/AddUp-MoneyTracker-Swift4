//
//  AddPopUpViewController.swift
//  ImpactColorButton
//
//  Created by Deval Parikh on 6/26/18.
//  Copyright © 2018 Deval Parikh. All rights reserved.
//

import UIKit

class AddPopUpViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var AddTextField: UITextField!
    @IBOutlet weak var AddButton: DesignableButton!
    var AddAmount = ""
    var RawAddAmount = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AddTextField.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)


        // Do any additional setup after loading the view.
    }
    @objc func myTextFieldDidChange(_ textField: UITextField) {
        
        if let amountString = AddTextField.text?.currencyInputFormatting() {
            textField.text = amountString
            RawAddAmount = amountString
            RawAddAmount.remove(at: RawAddAmount.startIndex)
            RawAddAmount = RawAddAmount.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        }
    }

    @IBAction func AddButtonAction(_ sender: Any) {
        
        print(RawAddAmount)
        if (self.RawAddAmount == ""){
            
        } else {
            GlobalVars.AmountRemaining = String(Double(GlobalVars.AmountRemaining)! + Double(self.RawAddAmount)!)
            defaults.set(GlobalVars.AmountRemaining, forKey: "key")
        }
//        self.AddAmount = AddTextField.text!
//        performSegue(withIdentifier: "AddToMain", sender: self)
        defaults.set(GlobalVars.AmountRemaining, forKey: "Amount")
        dismiss(animated: true)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var vc = segue.destination as! ViewController
//        vc.AmountRemaining = String(Double(vc.AmountRemaining)! + Double(self.AddAmount)!)
//    }
    
}


extension String {
    
    // formatting text for currency textField
    func currencyInputFormatting() -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.currencySymbol = "$"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        
        return formatter.string(from: number)!
    }
}

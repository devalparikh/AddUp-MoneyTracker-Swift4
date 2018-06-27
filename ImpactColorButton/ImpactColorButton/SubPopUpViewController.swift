//
//  SubPopUpViewController.swift
//  ImpactColorButton
//
//  Created by Deval Parikh on 6/26/18.
//  Copyright © 2018 Deval Parikh. All rights reserved.
//

import UIKit

class SubPopUpViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var SubAmountTextField: UITextField!
    @IBOutlet weak var SubButton: DesignableButton!
    var SubAmount = ""
    var RawSubAmount = ""
    override func viewDidLoad() {
        SubAmountTextField.addTarget(self, action: #selector(myTextFieldDidChange), for: .editingChanged)
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @objc func myTextFieldDidChange(_ textField: UITextField) {
        
        if let amountString = SubAmountTextField.text?.currencyInputFormatting() {
            textField.text = amountString
            RawSubAmount = amountString
            RawSubAmount.remove(at: RawSubAmount.startIndex)
            RawSubAmount = RawSubAmount.replacingOccurrences(of: ",", with: "", options: .literal, range: nil)
        }
    }
    
    @IBAction func SubButtonAction(_ sender: Any) {
        self.SubAmount = SubAmountTextField.text!
        GlobalVars.AmountRemaining = String(Double(GlobalVars.AmountRemaining)! - Double(self.RawSubAmount)!)
        defaults.set(GlobalVars.AmountRemaining, forKey: "key")
//        performSegue(withIdentifier: "SubToMain", sender: self)
        dismiss(animated: true)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var vc = segue.destination as! ViewController
//        vc.AmountRemaining = String(Double(vc.AmountRemaining)! - Double(self.SubAmount)!)
//    }
    
}


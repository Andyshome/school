//
//  finalMarkCalc.swift
//  school
//
//  Created by Triad on 2018-03-27.
//  Copyright © 2018 Baraam. All rights reserved.
//

import UIKit

class finalMarkCalc: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var currentGradeOutlet: UITextField!
    @IBOutlet weak var desiredGradeOutlet: UITextField!
    @IBOutlet weak var examWeightOutlet: UITextField!
    @IBOutlet weak var examMarkOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //change the keyboard type to number to make sure you do not enter any strings
        currentGradeOutlet.keyboardType = UIKeyboardType.numberPad
        desiredGradeOutlet.keyboardType = UIKeyboardType.numberPad
        examWeightOutlet.keyboardType = UIKeyboardType.numberPad
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        //auto layout
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        // Do any additional setup after loading the view, typically from a nib.
        
        currentGradeOutlet.inputAccessoryView = toolBar
        desiredGradeOutlet.inputAccessoryView = toolBar
        examWeightOutlet.inputAccessoryView = toolBar
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //set up the default value
    var currentGrade = 0.00
    var desiredGrade = 0.00
    var examWeight = 0.00
    var examMark = 0.00
    
    @IBAction func calcButton(_ sender: Any) {
        // to vertify the text field is not empty
        if currentGradeOutlet.text != "" && desiredGradeOutlet.text != "" && examWeightOutlet.text != "" {
          
            currentGrade = Double(currentGradeOutlet.text!)!
            desiredGrade = Double(desiredGradeOutlet.text!)!
            examWeight = Double(examWeightOutlet.text!)! / 100
            
            examMark = ((desiredGrade - currentGrade) / examWeight) + currentGrade
            examMarkOutlet.text = String("\(examMark)%")
            
            if examMark > 100 || examMark < 0 {
                let alert = UIAlertController(title: "Better start your prayers", message: "There's always next year!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "I've made mistakes...", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "It's possible! Work hard!", message: "May the odds forever be in your favour", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Pray for me", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
            }
            
        } else {
            print("empty")
              let emptyAlert = UIAlertController(title: "Emptiness", message: "Not letting you get away with it that easily", preferredStyle: .alert)
            emptyAlert.addAction(UIAlertAction(title: "I apologize oh great BAA APP", style: .cancel, handler: nil))
             present(emptyAlert, animated: true)
            
        }
    }
 
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
}

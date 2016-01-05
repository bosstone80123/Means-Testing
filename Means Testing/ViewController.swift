//
//  ViewController.swift
//  Means Testing
//
//  Created by Jon Slaughter on 12/25/15.
//  Copyright © 2015 Jon Slaughter. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet var StatePicker: UIPickerView! = UIPickerView()
    @IBOutlet var StateTextBox: UITextField! = UITextField()
    @IBOutlet var MaritalStatusPicker: UIPickerView! = UIPickerView()
    @IBOutlet var MaritalStatusTextBox: UITextField! = UITextField()
    @IBOutlet var HouseholdSizeTextBox: UITextField!
    @IBOutlet var HouseHoldSize: UIStepper!
    @IBAction func HouseholdSizeStepper(sender: UIStepper) {
        HouseholdSizeTextBox.text = Int(sender.value).description
    }
    
    
    var StatePickerData = ["Alabama","Alaska","Arizona","Arkansas","California","Colorado","Connecticut","Delaware",
        "District of Columbia","Florida","Georgia","Guam","Hawaii","Idaho","Illinois","Indiana","Iowa","Kansas","Kentucky",
        "Louisiana","Maine","Maryland","Massachusetts","Michigan","Minnesota","Mississippi","Missouri","Montana","Nebraska",
        "Nevada","New Hampshire","New Jersey","New Mexico","New York","North Carolina","North Dakota","Northern Mariana Islands",
        "Ohio","Oklahoma","Oregon","Pennsylvania","Puerto Rico","Rhode Island","South Carolina","South Dakota","Tennessee",
        "Texas","Utah","Vermont","Virginia","Virgin Islands","Washington","West Virginia","Wisconsin","Wyoming"]
    var MaritalStatusData = ["Individual","Individual Married","Joint"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StatePicker.hidden=true
        StatePicker.delegate = self
        MaritalStatusPicker.hidden=true
        MaritalStatusPicker.delegate=self
        HouseholdSizeTextBox.text = Int(HouseHoldSize.value).description
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
          return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == StatePicker{
            return StatePickerData.count
        } else if pickerView == MaritalStatusPicker{
            return MaritalStatusData.count
        }
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == StatePicker{
            return StatePickerData[row]
        } else if pickerView == MaritalStatusPicker{
           return MaritalStatusData[row]
        }
        return ""
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == StatePicker{
            StateTextBox.text = StatePickerData[row]
            StatePicker.hidden = true
        } else if pickerView == MaritalStatusPicker{
            MaritalStatusTextBox.text = MaritalStatusData[row]
            MaritalStatusPicker.hidden = true
        }
    }
    

    func textFieldShouldBeginEditing(textField: UITextField) -> Bool{
        if  textField.tag == 1{
            StatePicker.hidden = false
        }
        else if textField.tag == 3{
            MaritalStatusPicker.hidden = false
        }
        return false
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


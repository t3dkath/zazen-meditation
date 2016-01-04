//
//  SettingsVC.swift
//  zazen-meditation
//
//  Created by Kath Faulkner on 02/01/2016.
//  Copyright © 2016 T3D. All rights reserved.
//

import UIKit

class SettingsVC: ViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var leadinLbl: UIButton!
    @IBOutlet weak var leadinTimeLbl: UILabel!
    @IBOutlet weak var zazen1Lbl: UIButton!
    @IBOutlet weak var zazen1TimeLbl: UILabel!
    @IBOutlet weak var kinhinLbl: UIButton!
    @IBOutlet weak var kinhinTimeLbl: UILabel!
    @IBOutlet weak var zazen2Lbl: UIButton!
    @IBOutlet weak var zazen2TimeLbl: UILabel!
    
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var labelsStack: UIStackView!
    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var timePickerBtn: UIButton!
    @IBOutlet weak var beginBtn: UIButton!
    
    var labels: [UILabel]?
    let minutes = Array(1...60)
    
    var selectedLabel: UILabel!
    var selectedKey: String!
    var selectedTime: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker.delegate = self
        timePicker.dataSource = self
        
        if Meditation.instance.objectType == objectType.ZAZEN.rawValue {
            kinhinLbl.alpha = ALPHA_VALUE
            kinhinLbl.enabled = false
            kinhinTimeLbl.alpha = ALPHA_VALUE
            zazen2Lbl.alpha = ALPHA_VALUE
            zazen2Lbl.enabled = false
            zazen2TimeLbl.alpha = ALPHA_VALUE
        }

        leadinTimeLbl.text = Meditation.instance.leadInTime.timeString
        zazen1TimeLbl.text = Meditation.instance.zazen1Time.timeString
        kinhinTimeLbl.text = Meditation.instance.kinhinTime.timeString
        zazen2TimeLbl.text = Meditation.instance.zazen2Time.timeString
        
        labels = [leadinLbl.titleLabel!, leadinTimeLbl, zazen1Lbl.titleLabel!, zazen1TimeLbl, kinhinLbl.titleLabel!, kinhinTimeLbl, zazen2Lbl.titleLabel!, zazen2TimeLbl]
        addPageLetterSpacing(labels!)
    }
    
    @IBAction func onBeginPressed(sender: AnyObject) {
        performSegueWithIdentifier("ZazenSegue", sender: self)
    }

    @IBAction func timerLabelPressed(sender: UIButton) {
        switch(sender.tag) {
            case 0 :
                selectedLabel = leadinTimeLbl
                selectedKey = "leadInTime"
                selectedTime = Meditation.instance.leadInTime
            case 1 :
                selectedLabel = zazen1TimeLbl
                selectedKey = "zazen1Time"
                selectedTime = Meditation.instance.zazen1Time
            case 2 :
                selectedLabel = kinhinTimeLbl
                selectedKey = "kinhinTime"
                selectedTime = Meditation.instance.kinhinTime
            default :
                selectedLabel = zazen2TimeLbl
                selectedKey = "zazen2Time"
                selectedTime = Meditation.instance.zazen2Time
        }
        
        openTimePicker()
    }
    
    
    func openTimePicker() {
        timePicker.selectRow(selectedTime - 1, inComponent: 0, animated: true)
        labelsStack.alpha = 0.3
        timePicker.hidden = false
        timePickerBtn.hidden = false
        beginBtn.hidden = true
        infoBtn.hidden = true
    }
    
    @IBAction func closeTimePicker() {
        labelsStack.alpha = 1
        timePicker.hidden = true
        timePickerBtn.hidden = true
        beginBtn.hidden = false
        infoBtn.hidden = false
    }
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return minutes.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(minutes[row].timeString)
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Meditation.instance.saveTime(minutes[row], key: selectedKey)
        
        selectedLabel.text = String(minutes[row].timeString)
        addPageLetterSpacing(labels!)
    }
}

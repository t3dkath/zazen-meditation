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
    
    @IBOutlet weak var bellLargeBtn: UIButton!
    @IBOutlet weak var bellLargeStick: UIImageView!
    @IBOutlet weak var bellSmallBtn: UIButton!
    @IBOutlet weak var bellSmallStick: UIImageView!
    
    
    var labels: [UILabel]?
    let minutes = Array(1...60)
    
    var selectedLabel: UILabel!
    var selectedKey = "leadinTime"
    var selectedTime: Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBells()
        
        timePicker.delegate = self
        timePicker.dataSource = self
        
        timePicker.selectRow(0, inComponent: 0, animated: true)
        
        if Meditation.instance.objectType == objectType.ZAZEN.rawValue {
            kinhinLbl.alpha = ALPHA_VALUE
            kinhinLbl.enabled = false
            kinhinTimeLbl.alpha = ALPHA_VALUE
            zazen2Lbl.alpha = ALPHA_VALUE
            zazen2Lbl.enabled = false
            zazen2TimeLbl.alpha = ALPHA_VALUE
        }

        leadinTimeLbl.text = Meditation.instance.leadinTime.inSecondsDisplay
        zazen1TimeLbl.text = Meditation.instance.zazen1Time.timeString
        kinhinTimeLbl.text = Meditation.instance.kinhinTime.timeString
        zazen2TimeLbl.text = Meditation.instance.zazen2Time.timeString
        
        labels = [leadinLbl.titleLabel!, leadinTimeLbl, zazen1Lbl.titleLabel!, zazen1TimeLbl, kinhinLbl.titleLabel!, kinhinTimeLbl, zazen2Lbl.titleLabel!, zazen2TimeLbl]
        addPageLetterSpacing(labels!)
    }
    
    @IBAction func onChangeBell(sender: UIButton) {
        switch(sender.tag) {
        case 0 :
            Meditation.instance.bellType = "Large"
            bellLargeStick.alpha = 1
            bellSmallStick.alpha = 0
        default :
            Meditation.instance.bellType = "Small"
            bellLargeStick.alpha = 0
            bellSmallStick.alpha = 1
        }
        
        setupBells()
        bells1.stop()
        bells1.currentTime = 0
        bells1.play()
    }
    
    @IBAction func onBeginPressed(sender: AnyObject) {
        bells1.stop()
        bells1.currentTime = 0
        performSegueWithIdentifier("ZazenSegue", sender: self)
    }

    @IBAction func timerLabelPressed(sender: UIButton) {
        switch(sender.tag) {
            case 0 :
                selectedLabel = leadinTimeLbl
                selectedKey = "leadinTime"
                selectedTime = Meditation.instance.leadinTime
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
        timePicker.selectRow(0, inComponent: 0, animated: true)
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
        if selectedKey == "leadinTime" {
            return String(minutes[row].inSecondsDisplay)
        } else {
            return String(minutes[row].timeString)
        }
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Meditation.instance.saveTime(minutes[row], key: selectedKey)
        
        if selectedKey == "leadinTime" {
            selectedLabel.text = String(minutes[row].inSecondsDisplay)
        } else {
            selectedLabel.text = String(minutes[row].timeString)
        }
        
        
        addPageLetterSpacing(labels!)
    }
}

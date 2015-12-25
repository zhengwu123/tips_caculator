//
//  ViewController.swift
//  Tips Calculator
//
//  Created by New on 12/24/15.
//  Copyright © 2015 New. All rights reserved.
//@author zheng wu , 0027374097 , wu673@purdue.edu

import UIKit
var tableString = [String]()
class ViewController: UIViewController {

    @IBOutlet var label6: UILabel!
    @IBOutlet var label5: UILabel!
    @IBOutlet var label4: UILabel!
    @IBOutlet var label3: UILabel!
    @IBOutlet var Label2: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipsLabel: UILabel!
    @IBOutlet var seg: UISegmentedControl!
    @IBOutlet var billText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if NSUserDefaults.standardUserDefaults().objectForKey("tableString") != nil {
        tableString = NSUserDefaults.standardUserDefaults().objectForKey("tableString") as! [String]
        // Do any additional setup after loading the view, typically from a nib.
        }
        tipsLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }
      var total = 0.0
    @IBAction func OnEditChange(sender: AnyObject) {
        var percentages = [0.15,0.18,0.20,0.25]
        let percent = percentages[seg.selectedSegmentIndex]
        let billAmount = NSString(string: billText.text!).doubleValue
        let tips = billAmount * percent
        total = billAmount+tips
        
        tipsLabel.text = String(format: "$: %.2f", tips)
        totalLabel.text = String(format: "$: %.2f", total)
        Label2.text = String(format: "Shared by two people, $: %.2f each", total/2)
        label3.text = String(format: "Shared by three people, $: %.2f each", total/3)
        label4.text = String(format: "Shared by four people, $: %.2f each", total/4)
        label5.text = String(format: "Shared by five people, $: %.2f each", total/5)
        label6.text = String(format: "Shared by six people, $: %.2f each", total/6)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    var shortDate: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.stringFromDate(NSDate())
    }

    @IBAction func pressed(sender: AnyObject) {
        let stringtotal:String = String(format:"%.2f", total)
       
         tableString.append( shortDate + " spend $" + stringtotal)
        NSUserDefaults.standardUserDefaults().setObject(tableString, forKey: "tableString")
    }
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
   

}


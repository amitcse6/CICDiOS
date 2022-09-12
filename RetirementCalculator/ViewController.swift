//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by AMIT on 9/7/22.
//

import UIKit
import AppCenter
import AppCenterAnalytics
import AppCenterCrashes

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello world")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Crashes.hasCrashedInLastSession {
            let alert = UIAlertController(title: "Oops", message: "Sorry about that, an error occured.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "It's cool", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        Analytics.trackEvent("navigate_to_calculate")
    }
    
    @IBAction func buttonEvent(_ sender: Any) {
        //Crashes.generateTestCrash()
        let properties = ["current_age": "20", "planned_retirement_age": "40"]
        Analytics.trackEvent("calculate_requirement_amount", withProperties: properties)
    }
}


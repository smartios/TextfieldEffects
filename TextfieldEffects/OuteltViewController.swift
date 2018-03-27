//
//  OuteltViewController.swift
//  TextfieldEffects
//
//  Created by Vaibhav Agarwal on 3/27/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit

class OuteltViewController: UIViewController {

    //@IBOutlet weak var textfield: EffectsTextfield!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //names
//        textfield.activePlaceHoldertext = "First Name"
//        textfield.inactivePlaceHoldertext = "Enter First Name"
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKey))
        self.view.addGestureRecognizer(tap)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func hideKey()
    {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

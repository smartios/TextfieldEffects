//
//  ViewController.swift
//  TextfieldEffects
//
//  Created by Vaibhav Agarwal on 3/26/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if(indexPath.row == 0 || indexPath.row == 1)
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            let fld = cell.viewWithTag(1) as! EffectsTextfield
            fld.delegate = self
            fld.activePlaceHoldertext = "First Name"
            fld.inactivePlaceHoldertext = "Enter First Name"
            fld.activeImageViewColor = hexStringToUIColor(hex: "718F94")
            fld.inactiveImageViewColor = hexStringToUIColor(hex: "646E68")
            fld.activePlaceHolderFontColor = hexStringToUIColor(hex: "E6C79C")
            fld.inactivePlaceHolderFontColor = hexStringToUIColor(hex: "7B9EA8")
            //        fld.activeTextFieldBorderColor = hexStringToUIColor(hex: "19a3c0").cgColor
            //        fld.activeTextFieldBorderWidth = 1.0
            //        fld.activeTextFieldCornerRadius = 10
        }
        else
        {
            cell = tableView.dequeueReusableCell(withIdentifier: "cell2")!
            let fld = cell.viewWithTag(1) as! SlidingPlaceHolderTextField
            fld.delegate = self
        }
        
        return cell
    }
}


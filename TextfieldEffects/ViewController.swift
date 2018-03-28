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
        tableView.register(UINib(nibName: "CustomizableTableViewCell", bundle: nil), forCellReuseIdentifier: "customizableCell")
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 90
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 3
        {
            return UITableViewAutomaticDimension
        }
        
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if(indexPath.row == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            let fld = cell.viewWithTag(1) as! EffectsTextfield
            fld.delegate = self
            fld.activePlaceHoldertext = "First Name"
            fld.inactivePlaceHoldertext = "Enter First Name"
            fld.activeImageViewColor = hexStringToUIColor(hex: "718F94")
            fld.inactiveImageViewColor = hexStringToUIColor(hex: "646E68")
            fld.activePlaceHolderFontColor = hexStringToUIColor(hex: "E6C79C")
            fld.inactivePlaceHolderFontColor = hexStringToUIColor(hex: "7B9EA8")
//            fld.activeTextFieldBorderColor = hexStringToUIColor(hex: "19a3c0").cgColor
//            fld.activeTextFieldBorderWidth = 1.0
//            fld.activeTextFieldCornerRadius = 10
            
            return cell
        }
        else if indexPath.row == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3")!
            cell.selectionStyle = .none
            let fld = cell.viewWithTag(1) as! BottomEffectsTextFields
            fld.delegate = self
            fld.activePlaceHoldertext = "First Name"
            fld.inactivePlaceHoldertext = "Enter First Name"
            fld.activeImageViewColor = hexStringToUIColor(hex: "718F94")
            fld.inactiveImageViewColor = hexStringToUIColor(hex: "646E68")
            fld.activePlaceHolderFontColor = hexStringToUIColor(hex: "E6C79C")
            fld.inactivePlaceHolderFontColor = hexStringToUIColor(hex: "7B9EA8")
            
            return  cell
        }
        else if indexPath.row == 3
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customizableCell") as! CustomizableTableViewCell
  
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2")!
            let fld = cell.viewWithTag(1) as! SlidingPlaceHolderTextField
            fld.delegate = self
            fld.activePlaceHoldertext = "First Name"
            fld.inactivePlaceHoldertext = "Enter First Name"
           // fld.needCornerRadius = true
            
            return cell
        }
        
        let cell = UITableViewCell()
        return cell
        
    }
}


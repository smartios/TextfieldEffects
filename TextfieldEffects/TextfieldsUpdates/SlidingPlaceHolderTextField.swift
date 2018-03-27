//
//  SlidingPlaceHolderTextField.swift
//  TextfieldEffects
//
//  Created by Vaibhav Agarwal on 3/27/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.

import UIKit

class SlidingPlaceHolderTextField: UITextField {
    
    var padding = UIEdgeInsets()
    let placeHolderLabel = UILabel()
    let imageView = UIImageView()
    
    //MARK:-  Inspectables placeholder attributes
    @IBInspectable var activePlaceHolderFontColor: UIColor = UIColor.black
        {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    @IBInspectable var inactivePlaceHolderFontColor: UIColor! = UIColor.black
        {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    
    @IBInspectable var activePlaceHoldertext: String = "Active placeHolderLabel" {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    @IBInspectable var inactivePlaceHoldertext: String = "Inactive placeHolderLabel"
        {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    
    @IBInspectable var activePlaceHolderFontSize:Int = 9 {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    @IBInspectable var inactivePlaceHolderFontSize:Int = 12 {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    
    //MARK:-  Inspectables textfield attributes
    @IBInspectable var textFieldTextColor: UIColor = UIColor.black {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    
    //background color of textfield
    @IBInspectable var activeTextFieldBGColor: UIColor = UIColor.clear {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    
    @IBInspectable var inactiveTextFieldBGColor: UIColor = UIColor.clear {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    
    //background color of placeholder
    @IBInspectable var activeplaceholderBGColor: UIColor = hexStringToUIColor(hex: "7B9EA8") {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    
    @IBInspectable var inactiveplaceholderBGColor: UIColor = hexStringToUIColor(hex: "F2E9E4") {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    
    //MARK:- default view functions
    override func awakeFromNib() {
        super.awakeFromNib()
        setdefaultViewsSettings()
    }
    
    func setdefaultViewsSettings()
    {
        placeHolderLabel.numberOfLines = 0
        self.addSubview(placeHolderLabel)
        self.addSubview(imageView)
    }
    
    override func draw(_ rect: CGRect) {
        
        padding = UIEdgeInsets(top: 10, left: 5, bottom: 0, right: (self.frame.size.width)*0.25)
        
        if (self.text?.isEmpty)! && !(self.isEditing)
        {
            hideTextfield()
//            placeHolderLabel.frame = CGRect(x: 0, y: 0, width: (self.frame.size.width), height: self.frame.size.height)
//            setInactiveTextfieldAttributes()
        }
    }
    
    //MARK:- show/hide textfield
    
    func hideTextfield()
    {
        setInactiveTextfieldAttributes()
        UIView.animate(withDuration: 0.4) {
            self.placeHolderLabel.frame = CGRect(x: 0, y: 0, width: (self.frame.size.width), height: self.frame.size.height)
        }
    }
    
    func showTextfield()
    {
        UIView.animate(withDuration: 0.4) {
            self.placeHolderLabel.frame = CGRect(x: (self.frame.size.width)*0.75, y: 0, width: (self.frame.size.width)*0.25, height: self.frame.size.height)
        }
        setActiveTextfieldAttributes()
    }
    
    //MARK:- setting attirbutes
    func setActiveTextfieldAttributes()
    {
        //active textfield background color
        self.backgroundColor = activeTextFieldBGColor
        
        //placeholder label attributes
        placeHolderLabel.font.withSize(CGFloat(activePlaceHolderFontSize))
        placeHolderLabel.textColor = activePlaceHolderFontColor
        placeHolderLabel.text = activePlaceHoldertext
        placeHolderLabel.backgroundColor = activeplaceholderBGColor
        self.placeHolderLabel.layer.cornerRadius = 0
    }
    
    func setInactiveTextfieldAttributes()
    {
        //imageview below textfield color
        self.backgroundColor = inactiveTextFieldBGColor
        
        //placeholder label attributes
        placeHolderLabel.font.withSize(CGFloat(inactivePlaceHolderFontSize))
        placeHolderLabel.textColor = inactivePlaceHolderFontColor
        placeHolderLabel.backgroundColor = inactiveplaceholderBGColor
        placeHolderLabel.alpha = 0.6
        placeHolderLabel.text = inactivePlaceHoldertext
        self.placeHolderLabel.layer.cornerRadius = 20
    }
    
    
    override open func willMove(toSuperview newSuperview: UIView!) {
        
        if newSuperview != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidEndEditing), name: NSNotification.Name.UITextFieldTextDidEndEditing, object: self)
            
            NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidBeginEditing), name: NSNotification.Name.UITextFieldTextDidBeginEditing, object: self)
        } else {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    
    //MARK:- textfield delegates
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    @objc func textFieldDidEndEditing()
    {
        if (self.text?.isEmpty)!
        {
            hideTextfield()
        }
    }
    
    @objc func textFieldDidBeginEditing(){
        showTextfield()
    }
}

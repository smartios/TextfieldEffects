//
//  SlidingPlaceHolderTextField.swift
//  TextfieldEffects
//
//  Created by Vaibhav Agarwal on 3/27/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.

import UIKit

class SlidingPlaceHolderTextField: UITextField {
    
    //MARK:- Views and Values
    var padding = UIEdgeInsets()
    let placeHolderLabel = UILabel()
    let imageView = UIImageView()
    var needCornerRadius = false
    
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
    
    @IBInspectable var activePlaceHolderFontSize:CGFloat = 13 {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    @IBInspectable var inactivePlaceHolderFontSize:CGFloat = 15 {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    
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
    
    //MARK:-  Inspectables textfield attributes
    @IBInspectable var textFieldTextColor: UIColor = UIColor.black {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    
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
    
    @IBInspectable var activeImageViewBGColor: UIColor = hexStringToUIColor(hex: "F2E9E4")
    
    
    //MARK:- Lifecycle functions
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //set the views when nib is loaded
        setdefaultViewsSettings()
    }
    
    
    /// This is automatically called when the view is added to the supervew
    ///
    /// -Notifications for textfield begin and edit is added to get the event to trigger functions
    ///
    override open func willMove(toSuperview newSuperview: UIView!) {
        
        if newSuperview != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidEndEditing), name: NSNotification.Name.UITextFieldTextDidEndEditing, object: self)
            
            NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidBeginEditing), name: NSNotification.Name.UITextFieldTextDidBeginEditing, object: self)
        } else {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    /// This is called after the view is fully loaded to set the frames
    ///
    override func draw(_ rect: CGRect) {
        
        padding = UIEdgeInsets(top: 10, left: 5, bottom: 0, right: (self.frame.size.width)*0.25)
        
        if (self.text?.isEmpty)! && !(self.isEditing)
        {
            hideTextfield()
        }
    }
    
    
    /// Placeholder label and bottom imageview is added to the textfield
    func setdefaultViewsSettings()
    {
        placeHolderLabel.numberOfLines = 0
        self.addSubview(placeHolderLabel)
        self.addSubview(imageView)
    }
    
    
    //MARK:- show/hide textfield
    
    
    /// The textfield is hidden by overlapping it with the label
    /// label is slided to the left in uiview animation
    /// imageview is also hidden by making its width and height 0
    func hideTextfield()
    {
        UIView.animate(withDuration: 0.4, animations: {
            self.placeHolderLabel.frame = CGRect(x: 2, y: 2, width: (self.frame.size.width)-4, height: self.frame.size.height-4)
            self.imageView.frame = CGRect(x: 0, y: self.frame.size.height-2, width: 0, height: 0)
        })
        
        self.setInactiveTextfieldAttributes()
    }
    
    
    /// The textfield is shown by sliding it to 3/4 of the screen
    /// label is slided to the right in uiview animation
    /// imageview is shown in a uiview animation
    func showTextfield()
    {
        self.imageView.backgroundColor = activeImageViewBGColor
        UIView.animate(withDuration: 0.4, animations: {
            self.placeHolderLabel.frame = CGRect(x: (self.frame.size.width)*0.75, y: 0, width: (self.frame.size.width)*0.25, height: self.frame.size.height)
            self.imageView.frame = CGRect(x: 0, y: self.frame.size.height-2, width: ((self.frame.size.width)*0.75)-2, height: 2)
        })
        
        self.setActiveTextfieldAttributes()
    }
    
    //MARK:- setting attirbutes
    
    
    /// This is called when the textfield is shown.
    /// It is triggered from showTextfield()
    /// All the placeholder and textfields attributes are set here for active state
    func setActiveTextfieldAttributes()
    {
        //active textfield background color
        self.backgroundColor = activeTextFieldBGColor
        
        //placeholder label attributes
        placeHolderLabel.textAlignment = .center
        placeHolderLabel.font = UIFont(name: placeHolderLabel.font.fontName, size: activePlaceHolderFontSize)
        placeHolderLabel.textColor = activePlaceHolderFontColor
        placeHolderLabel.text = activePlaceHoldertext
        placeHolderLabel.backgroundColor = activeplaceholderBGColor
        self.placeHolderLabel.clipsToBounds = true
        self.placeHolderLabel.layer.cornerRadius = 0
    }
    
    
    /// This is called when the textfield is hidden.
    /// It is triggered from hideTextfield()
    /// All the placeholder and textfields attributes are set here for inactive state
    func setInactiveTextfieldAttributes()
    {
        //imageview below textfield color
        self.backgroundColor = inactiveTextFieldBGColor
        
        //placeholder label attributes
        placeHolderLabel.textAlignment = .left
        placeHolderLabel.font = UIFont(name: placeHolderLabel.font.fontName, size: inactivePlaceHolderFontSize)
        placeHolderLabel.textColor = inactivePlaceHolderFontColor
        placeHolderLabel.backgroundColor = inactiveplaceholderBGColor
        placeHolderLabel.alpha = 0.6
        self.placeHolderLabel.clipsToBounds = true
        
        
        //if corner radius is needed
        //need to be set when using this textfield
        //in default it is false
        if(needCornerRadius)
        {
            placeHolderLabel.text = "  " + inactivePlaceHoldertext
            self.placeHolderLabel.layer.cornerRadius = self.placeHolderLabel.frame.size.height/3.5
        }
        else
        {
            placeHolderLabel.text = " " + inactivePlaceHoldertext
            self.placeHolderLabel.layer.cornerRadius = 0
        }
    }
    
    
    //MARK:- textfield delegates
    
    
    /// to set the editing inset of the textfield
    ///
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    
    /// It is triggered from the notification when textfield begins editing
    /// if the textfield is empty the textfield will be hidden
    /// if the textfield is not empty the textfield will be shown
    @objc func textFieldDidEndEditing()
    {
        if (self.text?.isEmpty)!
        {
            hideTextfield()
        }
    }
    
    /// It is triggered from the notification when textfield ends editing
    @objc func textFieldDidBeginEditing(){
        showTextfield()
    }
}

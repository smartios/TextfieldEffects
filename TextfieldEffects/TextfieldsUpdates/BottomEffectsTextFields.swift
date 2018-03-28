//
//  BottomEffectsTextFields.swift
//  TextfieldEffects
//
//  Created by Vaibhav Agarwal on 3/28/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit

@IBDesignable
class BottomEffectsTextFields: UITextField {
    
    //MARK:- views
    let placeHolderLabel = UILabel()
    let imageView = UIImageView()
    
    //var EffectsTextfieldDelegate: EffectsTextfieldDelegate?
    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 10, right: 0)
    
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
    
    //MARK:-  Inspectables imageview attributes
    @IBInspectable var activeImageViewColor: UIColor = UIColor.black {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    @IBInspectable var inactiveImageViewColor: UIColor = UIColor.black {
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
    
    //MARK:- Lifecycle Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        setdefaultViewsSettings()
    }
    
    
    /// This is called after the view is loaded
    ///
    override func draw(_ rect: CGRect) {
        if(self.text?.isEmpty)!
        {
            inActiveStateAttributes()
        }
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
    
    
    /// adding default valued on the textfield
    func setdefaultViewsSettings()
    {
        self.addSubview(placeHolderLabel)
        self.addSubview(imageView)
    }
    
    //MARK:- setting attributes
    
    
    /// set the textfield attributes for active state
    func setActiveTextfieldAttributes()
    {
        //active textfield background color
        self.backgroundColor = activeTextFieldBGColor
        
        //imageview below textfield color
        imageView.backgroundColor = activeImageViewColor
        
        //placeholder label attributes
        placeHolderLabel.font.withSize(CGFloat(activePlaceHolderFontSize))
        placeHolderLabel.textColor = activePlaceHolderFontColor
        placeHolderLabel.text = activePlaceHoldertext
    }
    
    
    /// set the textfield attributes for inactive state
    func setInactiveTextfieldAttributes()
    {
        //imageview below textfield color
        self.backgroundColor = inactiveTextFieldBGColor
        
        //imageview below textfield color
        imageView.backgroundColor = inactiveImageViewColor
        
        //placeholder label attributes
        placeHolderLabel.font.withSize(CGFloat(inactivePlaceHolderFontSize))
        placeHolderLabel.textColor = inactivePlaceHolderFontColor
        placeHolderLabel.alpha = 0.6
        placeHolderLabel.text = inactivePlaceHoldertext
    }
    
    //MARK:- setting views
    
    
    /// to set frame of placeholder label on top of the textfield
    func activeStateAttributes()
    {
        if(self.text?.isEmpty)!
        {
            self.imageView.frame = CGRect(x: 1, y: self.frame.size.height-13, width: self.frame.size.width-2, height: 0)
            self.placeHolderLabel.frame = CGRect(x: 3, y: (self.frame.size.height)+5, width: self.frame.size.width-6, height: 0)
            
            self.imageView.backgroundColor = activeImageViewColor
            
            UIView.animate(withDuration: 0.4, animations: {
                self.placeHolderLabel.frame = CGRect(x: 3, y: (self.frame.size.height)-8, width: self.frame.size.width-6, height: 15)
                self.imageView.frame = CGRect(x: 1, y: self.frame.size.height-13 , width: self.frame.size.width-2, height: 2)
            })
        }
    }
    
    /// to set frame of placeholder label in middle of the textfield
    func inActiveStateAttributes()
    {
        //setting placeHolderLabel on the textview
        self.imageView.frame = CGRect(x: 1, y: self.frame.size.height-13, width: self.frame.size.width-2, height: 0)
        self.placeHolderLabel.frame = CGRect(x: 3, y: (self.frame.size.height)+5, width: self.frame.size.width-6, height: 0)
        
        if(self.text?.isEmpty)!
        {
            UIView.animate(withDuration: 0.4, animations: {
                
                self.placeHolderLabel.frame = CGRect(x: 3, y: (self.frame.size.height)-8, width: self.frame.size.width-6, height: 15)
                self.imageView.frame = CGRect(x: 1, y: self.frame.size.height-13, width: self.frame.size.width, height: 1)
            })
            
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
    
    /// It is triggered from the notification when textfield ends editing
    /// if the textfield is empty the textfield will be show in inactive state
    /// if the textfield is not empty the textfield will be show in active state
    @objc func textFieldDidEndEditing()
    {
        if(self.text?.isEmpty)!
        {
            setInactiveTextfieldAttributes()
            self.inActiveStateAttributes()
        }
    }
    
    /// It is triggered from the notification when textfield begins editing
    @objc func textFieldDidBeginEditing(){
        
        if(self.text?.isEmpty)!
        {
            setActiveTextfieldAttributes()
            activeStateAttributes()
        }
    }
}

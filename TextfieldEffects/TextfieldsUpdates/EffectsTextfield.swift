//
//  EffectsTextfield.swift
//  TextfieldEffects
//
//  Created by Vaibhav Agarwal on 3/26/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit

//@objc protocol EffectsTextfieldDelegate: class {
//    @objc optional  func EffectstextFieldDidBeginEditing(_ sender: EffectsTextfield)
//    @objc optional  func EffectstextFieldShouldReturn(_ sender: EffectsTextfield)
//    @objc optional  func EffectstextFieldDidEndEditing(_ sender: EffectsTextfield) -> Bool
//    @objc optional  func EffectstextFieldShouldChange(_ sender: EffectsTextfield, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
//}

@IBDesignable
//UITextFieldDelegate
class EffectsTextfield: UITextField {
    
    
    let placeHolderLabel = UILabel()
    let imageView = UIImageView()
    //var EffectsTextfieldDelegate: EffectsTextfieldDelegate?
    let padding = UIEdgeInsets(top: 10, left: 5, bottom: 0, right: 0)
    
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
    
    
    //MARK:-  Inspectables layer attributes
    @IBInspectable var activeTextFieldBorderWidth: CGFloat = 0
        {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    @IBInspectable var activeTextFieldBorderColor: CGColor = UIColor.clear.cgColor
        {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    @IBInspectable var activeTextFieldCornerRadius: CGFloat = 0
        {
        didSet{
            self.setInactiveTextfieldAttributes()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setdefaultViewsSettings()
    }
    
    
    //MARK:- setting attirbutes
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
        self.layer.cornerRadius = activeTextFieldCornerRadius
      
        
    }
    
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
        self.layer.cornerRadius = activeTextFieldCornerRadius
    
    }

    
    func setLayerAttributes(active: Bool)
    {
        if(active)
        {
            //active textfield border attributes
            self.layer.borderWidth = activeTextFieldBorderWidth
            self.layer.borderColor = activeTextFieldBorderColor
        }
        else
        {
            //active textfield border attributes
            self.layer.borderWidth = 0
            self.layer.borderColor = UIColor.clear.cgColor
        }
    }
    
    func setdefaultViewsSettings()
    {
        self.addSubview(placeHolderLabel)
        self.addSubview(imageView)
    }
    
    override func draw(_ rect: CGRect) {
        self.setLayerAttributes(active: false)
       PlaceHolderAnimation_Down()
    }
    
    override open func willMove(toSuperview newSuperview: UIView!) {
        
        if newSuperview != nil {
            NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidEndEditing), name: NSNotification.Name.UITextFieldTextDidEndEditing, object: self)
            
            NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidBeginEditing), name: NSNotification.Name.UITextFieldTextDidBeginEditing, object: self)
        } else {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    //MARK:- setting views
    
    func PlaceHolderAnimation_Up()
    {
        //setting placeHolderLabel above the textview
        if(self.text?.isEmpty)!
        {
            self.imageView.frame = CGRect(x: 1, y: self.frame.size.height, width: 0, height: 2)
            self.imageView.backgroundColor = activeImageViewColor
            
            UIView.animate(withDuration: 0.4, animations: {
                self.placeHolderLabel.frame = CGRect(x: 5, y: 5, width: self.frame.size.width-6, height: 15)
                
                if(self.activeTextFieldBorderWidth == 0)
                {
                    self.imageView.frame = CGRect(x: 1, y: self.frame.size.height+1 , width: self.frame.size.width-2, height: 2)
                }
                else
                {
                    self.setLayerAttributes(active: true)
                }
                
            })
        }
    }
    
    
    func PlaceHolderAnimation_Down()
    {
        //setting placeHolderLabel on the textview
        if(self.text?.isEmpty)!
        {
            placeHolderLabel.frame = CGRect(x: 3, y: self.center.y, width: self.frame.size.width-6, height: 15)
            imageView.frame = CGRect(x: 1, y: self.frame.size.height, width: self.frame.size.width, height: 1)
            
            if(self.activeTextFieldBorderWidth != 0)
            {
                self.setLayerAttributes(active: false)
            }
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
        if(self.text?.isEmpty)!
        {
            
            setInactiveTextfieldAttributes()
            self.PlaceHolderAnimation_Down()
        }
    }
    
    @objc func textFieldDidBeginEditing(){

        setActiveTextfieldAttributes()
        PlaceHolderAnimation_Up()
    }
}

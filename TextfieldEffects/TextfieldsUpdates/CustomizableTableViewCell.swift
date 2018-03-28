//
//  CustomizableTableViewCell.swift
//  TextfieldEffects
//
//  Created by Vaibhav Agarwal on 3/28/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit

@IBDesignable
class CustomizableTableViewCell: UITableViewCell {
    
    //MARK:- NSLayoutConstraints
    @IBOutlet weak var headerLabelHeight: NSLayoutConstraint!
    @IBOutlet weak var rightButtonWidth: NSLayoutConstraint!
    @IBOutlet weak var leftButtonWidth: NSLayoutConstraint!
    
    //MARK:- Outlets of Views
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var bottomImageView: UIImageView!
    
    @IBInspectable var bottomImageViewBGColor: UIColor = UIColor.clear
        {
        didSet{
            settingViews()
        }
    }
    
    //MARK:- Error Label Inspectables
    @IBInspectable var errorLabelBorderWidth: CGFloat = 0
        {
        didSet{
            setErrorLabelAttributes()
        }
    }
    
    @IBInspectable var errorLabelBorderColor: UIColor = UIColor.clear
        {
        didSet{
            setErrorLabelAttributes()
        }
    }
    
    @IBInspectable var errorLabelFontSize: CGFloat = 9
        {
        didSet{
            setErrorLabelAttributes()
        }
    }
    
    @IBInspectable var errorLabelFont: String = ""
        {
        didSet{
            setErrorLabelAttributes()
        }
    }
    
    @IBInspectable var errorLabelFontColor: UIColor = UIColor.black
        {
        didSet{
            setErrorLabelAttributes()
        }
    }
    
    @IBInspectable var errorLabelBGColor: UIColor = UIColor.clear
        {
        didSet{
            setErrorLabelAttributes()
        }
    }
    var errorLabelText: String = ""
    
    
    //MARK:- Lifecycle Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    /// This is called after the view is fully loaded to set the frames
    ///
    override func draw(_ rect: CGRect) {
        settingViews()
    }
    
    
    /// Values of views will be set here for the first time
    /// if error label text is given it will also be set
    func settingViews()
    {
        bottomImageView.backgroundColor = bottomImageViewBGColor
        if(errorLabelText != "")
        {
            setErrorLabelAttributes()
        }
        setTableViewCellProperties()
    }
    
    /// tableview cell properties are set
    func setTableViewCellProperties()
    {
        self.selectionStyle = .none
        self.clipsToBounds = true
    }
    
    //MARK:- show/hide Right Button
    
    /// to show the right button
    func showRightButton()
    {
        rightButtonWidth.constant = 40
    }
    
    
    func hideRightButton()
    {
        rightButtonWidth.constant = 0
    }
    
    //MARK:- show/hide Left Button
    
    /// to show the left button
    func showLeftButton()
    {
        leftButtonWidth.constant = 40
    }
    
    /// to hide the left button
    func hideLeftButton()
    {
        leftButtonWidth.constant = 0
    }
    
    //MARK:- show/hide Header Label
    
    /// to show the Header Label
    func showHeaderLabel()
    {
        headerLabelHeight.constant = 21
    }
    
    /// to hide the Header Label
    func hideHeaderLabel()
    {
        headerLabelHeight.constant = 0
    }
    
    //MARK:- Error Label Attributes
    
    
    /// adding error label attributes only when the errorLabelText != ""
    func setErrorLabelAttributes()
    {
        errorLabel.backgroundColor = errorLabelBGColor
        errorLabel.text = errorLabelText
        errorLabel.textColor = errorLabelFontColor
        errorLabel.layer.borderColor = errorLabelBorderColor.cgColor
        errorLabel.layer.borderWidth = errorLabelBorderWidth
        if(errorLabelFont != "")
        {
            errorLabel.font = UIFont(name: errorLabelFont, size: errorLabelFontSize)
        }
    }
}

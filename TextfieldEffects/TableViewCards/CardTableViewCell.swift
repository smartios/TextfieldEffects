//
//  CardTableViewCell.swift
//  TextfieldEffects
//
//  Created by Vaibhav Agarwal on 3/29/18.
//  Copyright © 2018 Vaibhav Agarwal. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var subHeadingLabel: UILabel!
    @IBOutlet weak var MessageLabel: UILabel!
    @IBOutlet weak var date_time_Label: UILabel!
    @IBOutlet weak var menuLabel: UIButton!
    @IBOutlet weak var favLabel: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
}

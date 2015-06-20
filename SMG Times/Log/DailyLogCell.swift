//
//  DailyLogCell.swift
//  SMG Times
//
//  Created by Sveta Dedunovich on 6/20/15.
//  Copyright (c) 2015 lumenela. All rights reserved.
//

import UIKit

class DailyLogCell: UITableViewCell {
    
    @IBOutlet var dayLabel : UILabel?
    @IBOutlet var dateLabel : UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DailyLogCell", bundle: NSBundle.mainBundle())
    }
    
    static func fromNib() -> DailyLogCell? {
        var objects = NSBundle.mainBundle().loadNibNamed("DailyLogCell", owner: nil, options: nil)
        if let UIElements = objects {
            var cell = UIElements.first as! DailyLogCell
            return cell
        }
        return nil
    }
    
}

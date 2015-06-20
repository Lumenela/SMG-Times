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

    var dailyRecord : DailyRecord? {
        didSet {
            if let record = dailyRecord {
                self.dayLabel?.text = record.day
                self.dateLabel?.text = record.shortDateString
            }
        }
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
    
    static func height() -> CGFloat {
        return 66
    }
    
}

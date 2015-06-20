//
//  DetailedLogCell.swift
//  SMG Times
//
//  Created by Vladimir Hudnitsky on 6/20/15.
//  Copyright (c) 2015 lumenela. All rights reserved.
//

import Foundation
import UIKit

class DetailedLogCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var timeLabel: UILabel!    
    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var timeIcon: UIImageView!
    @IBOutlet weak var bgLbl: UIImageView!
    
    var timeRecord : TimeRecord? {
        didSet {
            if let record = timeRecord {
                self.nameLabel?.text = record.type.name
                self.timeLabel?.text = String(record.time)
                self.timeIcon?.image = UIImage(named: record.type.icon_name)
                self.bgLbl?.image = UIImage(named: record.type.bg_name)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "DetailedCell", bundle: NSBundle.mainBundle())
    }
    
    static func fromNib() -> DetailedLogCell? {
        var objects = NSBundle.mainBundle().loadNibNamed("DetailedCell", owner: nil, options: nil)
        if let UIElements = objects {
            var cell = UIElements.first as! DetailedLogCell
            return cell
        }
        return nil
    }
    
    static func height() -> CGFloat {
        return 220
    }
}

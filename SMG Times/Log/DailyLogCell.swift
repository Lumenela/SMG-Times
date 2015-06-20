//
//  DailyLogCell.swift
//  SMG Times
//
//  Created by Sveta Dedunovich on 6/20/15.
//  Copyright (c) 2015 lumenela. All rights reserved.
//

import UIKit
import SnapKit


class DailyLogCell: UITableViewCell {
    
    @IBOutlet var dayLabel : UILabel?
    @IBOutlet var dateLabel : UILabel?
    
    @IBOutlet var timeLabel1 : UILabel?
    @IBOutlet var timeLabel2 : UILabel?
    @IBOutlet var timeLabel3 : UILabel?
    @IBOutlet var tag1 : TagView?
    @IBOutlet var tag2 : TagView?
    @IBOutlet var tag3 : TagView?
    
    var tags : Array<TagView>?
    var timeLabels : Array<UILabel>?
    
    var dailyRecord : DailyRecord? {
        didSet {
            if let record = dailyRecord {
                self.dayLabel?.text = record.day
                self.dateLabel?.text = record.shortDateString
                self.updateTags()
            }
        }
    }
    
    func updateTags() {
        for i in 0 ... 2 {
            if let label = self.timeLabels?[i] {
                label.hidden = true
            }
            if let tag = self.tags?[i] {
                tag.hidden = true
            }
        }
        
        var index = 0
        if let recordList = self.dailyRecord?.timeRecordList {
            let records = recordList.filter({($0 as TimeRecord).time > 0})
            for timeRecord in records {
                if let label = self.timeLabels?[index] {
                    label.text = String(format : "%d", timeRecord.time)
                    label.hidden = false
                }
                if let tag = self.tags?[index] {
                    tag.activity = timeRecord.type
                    tag.hidden = false
                }
                index++
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.timeLabels = [self.timeLabel1!, self.timeLabel2!, self.timeLabel3!]
        self.tags = [self.tag1!, self.tag2!, self.tag3!]
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

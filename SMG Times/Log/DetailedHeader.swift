//
//  DetailedHeader.swift
//  SMG Times
//
//  Created by Sveta Dedunovich on 6/21/15.
//  Copyright (c) 2015 lumenela. All rights reserved.
//

import UIKit

class DetailedHeader: UIView {

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
        if let records = self.dailyRecord?.timeRecordList {
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


    static func height() -> CGFloat {
        return 70.0
    }

    static func fromNib() -> DetailedHeader? {
        var objects = NSBundle.mainBundle().loadNibNamed("DetailedHeader", owner: nil, options: nil)
        if let UIElements = objects {
            return UIElements.first as? DetailedHeader
        }
        return nil
    }
}

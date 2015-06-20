//
//  DailyRecord.swift
//  SMG Times
//
//  Created by Sveta Dedunovich on 6/20/15.
//  Copyright (c) 2015 lumenela. All rights reserved.
//

import Foundation


class DailyRecord {
    var timeRecordList : Array<TimeRecord>?
    var date : NSDate?
    
    var day : String {
        get {
            if let aDate = self.date {
                return aDate.weekdayName
            }
            return ""
        }
    }
    
    var shortDateString : String {
        get {
            if let aDate = self.date {
                return aDate.monthAndDayString
            }
            return ""
        }
    }
    
    static func fake() -> Array<DailyRecord> {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        let mondayDate = formatter.dateFromString("Jun 15 2015")
        
        let monday = DailyRecord()
        monday.date = mondayDate
        monday.timeRecordList = [TimeRecord(type: Activity.development(), time: 6), TimeRecord(type: Activity.communication(), time: 1), TimeRecord(type: Activity.management(), time: 1)]
        
        let tuesday = DailyRecord()
        tuesday.date = mondayDate?.dateByAddingDays(1)
        tuesday.timeRecordList = [TimeRecord(type: Activity.development(), time: 8)]
        
        let wednesday = DailyRecord()
        wednesday.date = mondayDate?.dateByAddingDays(2)
        wednesday.timeRecordList = [TimeRecord(type: Activity.development(), time: 6), TimeRecord(type: Activity.communication(), time: 2)]
        
        let thursday = DailyRecord()
        thursday.date = mondayDate?.dateByAddingDays(3)
        thursday.timeRecordList = [TimeRecord(type: Activity.development(), time: 8)]
        
        let friday = DailyRecord()
        friday.date = mondayDate?.dateByAddingDays(4)
        friday.timeRecordList = [TimeRecord(type: Activity.development(), time: 6), TimeRecord(type: Activity.communication(), time: 1), TimeRecord(type: Activity.management(), time: 1)]
        
        return [monday, tuesday, wednesday, thursday, friday]
    }
}
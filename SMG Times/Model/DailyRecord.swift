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
                return aDate.weekdayName;
            }
            return "";
        }
    }
    
    var shortDateString : String {
        get {
            if let aDate = self.date {
                return aDate.monthAndDayString;
            }
        }
    }
}
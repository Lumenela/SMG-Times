//
//  TimeRecord.swift
//  SMG Times
//
//  Created by Sveta Dedunovich on 6/20/15.
//  Copyright (c) 2015 lumenela. All rights reserved.
//

import Foundation


class TimeRecord {
    var type : Activity
    var time = 0
    
    init(type : Activity, time : NSInteger) {
        self.type = type
        self.time = time
    }
}
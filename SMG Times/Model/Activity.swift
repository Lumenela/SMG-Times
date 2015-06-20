//
//  Activity.swift
//  SMG Times
//
//  Created by Sveta Dedunovich on 6/20/15.
//  Copyright (c) 2015 lumenela. All rights reserved.
//

import Foundation


enum ActivityType {
    case Development
    case Management
    case Communication
}


struct Activity {
    var name: String
    var shortName: String
    var type: ActivityType
    
    static func development() -> Activity {
        let activity = Activity(name: "Development", shortName: "Dev", type: ActivityType.Development)
        return activity;
    }
    
    static func management() -> Activity {
        let activity = Activity(name: "Management", shortName: "PM", type: ActivityType.Management)
        return activity;
    }
    
    static func communication() -> Activity {
        let activity = Activity(name: "Communication", shortName: "Communic.", type: ActivityType.Communication)
        return activity;
    }
}
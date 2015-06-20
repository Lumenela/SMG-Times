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
    var icon_name: String
    var small_icon_name: String
    var bg_name: String
    
    static func development() -> Activity {
        let activity = Activity(name: "Development", shortName: "DEV", type: ActivityType.Development, icon_name: "dev", small_icon_name: "dev-small", bg_name: "dev_large")
        return activity;
    }
    
    static func management() -> Activity {
        let activity = Activity(name: "Management", shortName: "PM", type: ActivityType.Management, icon_name: "pm", small_icon_name: "pm-small", bg_name: "pm_large")
        return activity;
    }
    
    static func communication() -> Activity {
        let activity = Activity(name: "Communication", shortName: "COMMUNIC.", type: ActivityType.Communication, icon_name: "com", small_icon_name: "com-small", bg_name: "com_large")
        return activity;
    }
}
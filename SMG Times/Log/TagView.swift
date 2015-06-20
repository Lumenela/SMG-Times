//
//  TagView.swift
//  SMG Times
//
//  Created by Sveta Dedunovich on 6/20/15.
//  Copyright (c) 2015 lumenela. All rights reserved.
//

import UIKit

class TagView: UIView {
    
    @IBOutlet var label : UILabel?
    @IBOutlet var icon : UIImageView?
    
    var activity : Activity? {
        didSet {
            if let theActivity = self.activity {
                self.label?.text = theActivity.shortName
                self.icon?.image = UIImage(named: theActivity.small_icon_name)
            }
        }
    }
}

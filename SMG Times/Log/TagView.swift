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
                switch theActivity.type {
                case .Development :
                    self.icon?.image = UIImage(named: "dev-small")
                case .Communication :
                    self.icon?.image = UIImage(named: "com-small")
                case .Management :
                    self.icon?.image = UIImage(named: "pm-small")
                }
            }
        }
    }
}

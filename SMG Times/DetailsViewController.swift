//
//  DetailsViewController.swift
//  SMG Times
//
//  Created by Vladimir Hudnitsky on 6/20/15.
//  Copyright (c) 2015 lumenela. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewController: UITableViewController{
    var record: DailyRecord?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerNib(DetailedLogCell.nib(), forCellReuseIdentifier: "DetailedCell")
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = self.record?.timeRecordList {
            return list.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("DetailedCell", forIndexPath: indexPath) as! DetailedLogCell
        cell.timeRecord = self.record?.timeRecordList?[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return DetailedLogCell.height()
    }

    
}
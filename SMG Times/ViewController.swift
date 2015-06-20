//
//  ViewController.swift
//  SMG Times
//
//  Created by Sveta Dedunovich on 6/20/15.
//  Copyright (c) 2015 lumenela. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var records : Array<DailyRecord>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.records = DailyRecord.fake()
        self.tableView.registerNib(DailyLogCell.nib(), forCellReuseIdentifier: "Cell")
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let list = self.records {
            return list.count
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! DailyLogCell
        cell.dailyRecord = self.records?[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return DailyLogCell.height()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let record = self.records?[indexPath.row]
        let detailsController = self.storyboard?.instantiateViewControllerWithIdentifier("DetailsViewController") as! DetailsViewController
        detailsController.record = record!
        self.presentViewController(detailsController, animated: true, completion: nil)
    }

}


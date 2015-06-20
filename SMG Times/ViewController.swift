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
    var selectedRecord : DailyRecord?
    var toolbar : UIToolbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.records = DailyRecord.fake()
        self.tableView.registerNib(DailyLogCell.nib(), forCellReuseIdentifier: "Cell")
    }
    
    override func viewDidAppear(animated: Bool) {
        toolbar = UIToolbar()
        toolbar!.barStyle = UIBarStyle.Default
        toolbar!.sizeToFit()
        
        let toolbarHeight: CGFloat = 60
        let viewBounds: CGRect = self.view.bounds
        let rootViewHeight: CGFloat = CGRectGetHeight(viewBounds)
        let rootViewWidth: CGFloat = CGRectGetWidth(viewBounds)
        let rectArea: CGRect = CGRectMake(0, rootViewHeight - toolbarHeight, rootViewWidth, toolbarHeight)
        toolbar?.frame = rectArea
        let greenButton: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        greenButton.setTitle("LOG TIME", forState: UIControlState.Normal)
        greenButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        greenButton.frame=CGRectMake(0, 0, rootViewWidth, 60)
        greenButton.backgroundColor = UIColor(red: CGFloat(0), green: CGFloat(255), blue: CGFloat(0), alpha: CGFloat(100))
        toolbar?.addSubview(greenButton)
        self.navigationController!.view.addSubview(toolbar!)
    }

    override func viewDidDisappear(animated: Bool) {
        self.toolbar!.removeFromSuperview()
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
        if let list = self.records {
            self.selectedRecord = list[indexPath.row]
            self.performSegueWithIdentifier("Detail", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Detail" {
            let details = segue.destinationViewController as! DetailsViewController
            details.record = self.selectedRecord
        }
    }
    
//    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 60
//    }
//    
//    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footer: UIView = UIView(frame: CGRectMake(0, 0, 320, 60))
//        let greenButton: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
//        greenButton.setTitle("LOG TIME", forState: UIControlState.Normal)
//        greenButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
//        greenButton.frame=CGRectMake(0, 0, 320, 60)
//        greenButton.backgroundColor = UIColor(red: CGFloat(0), green: CGFloat(230), blue: CGFloat(118), alpha: CGFloat(100))
//        footer.addSubview(greenButton)
//        return footer
//    }
    
}


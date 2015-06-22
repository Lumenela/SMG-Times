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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        toolbar = UIToolbar()
        toolbar!.barStyle = UIBarStyle.Default
        toolbar!.sizeToFit()
        
        
        let toolbarHeight: CGFloat = 80
        let viewBounds: CGRect = self.view.bounds
        let rootViewHeight: CGFloat = CGRectGetHeight(viewBounds)
        let rootViewWidth: CGFloat = CGRectGetWidth(viewBounds)
        let rectArea: CGRect = CGRectMake(0, rootViewHeight, rootViewWidth, toolbarHeight+40)
        toolbar?.frame = rectArea
        let greenButton: UIButton = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        let logTitle = NSAttributedString(string: "LOG TIME", attributes: [NSFontAttributeName : UIFont.systemFontOfSize(30), NSForegroundColorAttributeName : UIColor.whiteColor()])
        greenButton.setAttributedTitle(logTitle, forState: UIControlState.Normal)
        greenButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        greenButton.frame=CGRectMake(0, 0, rootViewWidth, toolbarHeight)
        greenButton.backgroundColor = UIColor(red: CGFloat(0), green: CGFloat(230.0/255.0), blue: CGFloat(118.0/255.0), alpha: CGFloat(100))
        greenButton.addTarget(self, action: "log", forControlEvents: UIControlEvents.TouchUpInside)
        toolbar?.addSubview(greenButton)
        self.navigationController!.view.addSubview(toolbar!)
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            toolbar?.frame = CGRectMake(0, rootViewHeight - toolbarHeight, rootViewWidth, toolbarHeight+40)
        }, completion: nil)
        
        self.navigationItem.title = "CityIndex"
    }
    func log() {
        self.navigationController?.popViewControllerAnimated(true)
        let alert = UIAlertController(title: "SMG Times", message: "Thanks for loggin your time this week. You're awesome!", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.navigationController!.presentViewController(alert, animated: true, completion: nil)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            if let aToolbar = self.toolbar {
                aToolbar.frame = CGRectMake(0, CGRectGetHeight(self.view.frame), aToolbar.frame.size.width, aToolbar.frame.size.width)
            }
            }, completion: {(completed: Bool) -> Void in
                self.toolbar!.removeFromSuperview()
            })
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
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
}


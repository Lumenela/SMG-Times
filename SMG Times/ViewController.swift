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

}


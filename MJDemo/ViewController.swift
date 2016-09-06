//
//  ViewController.swift
//  MJDemo
//
//  Created by 陈旭 on 16/9/1.
//  Copyright © 2016年 陈旭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.mj_header = mj_header
        // 哈哈哈哈

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    lazy var mj_header:WOWRefreshHeader = {

        let h = WOWRefreshHeader(refreshingTarget:self, refreshingAction:#selector(pullToRefresh))
        h.automaticallyChangeAlpha = true
        return h
    }()

    func pullToRefresh()  {
        // 模拟刷新两秒结束
//        let time:NSTimeInterval = 2.0
//        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
//        dispatch_after(delay, dispatch_get_main_queue()) { 
//            self.tableView.mj_header.endRefreshing()
//        }
        delay(2.0) { 
         self.tableView.mj_header.endRefreshing()
        }
    }

}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let ss = "cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ss)
        if cell == nil {
            cell =  UITableViewCell(style: .Default ,reuseIdentifier: ss)
            
        }
        cell?.backgroundColor = UIColor.yellowColor()
        return cell!
    }
}


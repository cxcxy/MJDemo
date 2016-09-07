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

func insertStudent() {
    let name = "aa"
//    let age = "cc"
    let sql = "INSERT INTO t_searchModel(searchStr)VALUES(?);"
    
    searchModel.shareInstance.db.executeUpdate(sql, withArgumentsInArray: [name])
}
func loadStudent() {
    
    let sql = "SELECT * FROM t_searchModel;"
    
    let resultSet = searchModel.shareInstance.db.executeQuery(sql, withArgumentsInArray: nil)
    
    while resultSet.next() {
//        let id = resultSet.intForColumn("searchStr")
        let name = resultSet.stringForColumn("searchStr")
//        let age = resultSet.intForColumn("age")
        
        print("id = \(name)")
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
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0{
            insertStudent()
        }
        if indexPath.row == 1 {
            loadStudent()
        }
    }
}


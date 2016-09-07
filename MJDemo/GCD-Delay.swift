//
//  GCD-Delay.swift
//  MJDemo
//
//  Created by 陈旭 on 16/9/2.
//  Copyright © 2016年 陈旭. All rights reserved.
//

import Foundation

typealias Task = (cancel : Bool) -> Void
/**
 延时加载 －s
 */
func delay(time:NSTimeInterval,task:()->()) -> Task? {
    func dispatch_later(block:()->()) {

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(time * Double(NSEC_PER_SEC))),
                       
dispatch_get_main_queue(),block)
    }
    var closure: dispatch_block_t? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                dispatch_async(dispatch_get_main_queue(), internalClosure);
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(cancel: false)
        }
    }
   
    return result;
}

func cancel(task:Task?) {
    task?(cancel: true)
}

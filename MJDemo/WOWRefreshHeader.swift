//
//  WOWRefreshHeader.swift
//  MJDemo
//
//  Created by 陈旭 on 16/9/1.
//  Copyright © 2016年 陈旭. All rights reserved.
//

import UIKit

class WOWRefreshHeader: MJRefreshHeader {
    var img : YYAnimatedImageView! = nil

    override func prepare() {
        super.prepare()
        self.mj_h = 80
        
        let image = YYImage(named: "loadRefresh")
        img = YYAnimatedImageView(image: image)
        
        img.frame = CGRectMake(0,0,50,50)
        img.center = self.center
        
        self.addSubview(img)
    
        
    }
    override func placeSubviews() {
        super.placeSubviews()

        img.center = CGPointMake(UIScreen.mainScreen().bounds.size.width/2, self.center.y + 80)

    }
    
    override func scrollViewContentOffsetDidChange(change: [NSObject : AnyObject]!) {
        super.scrollViewContentOffsetDidChange(change)
    }
    override func scrollViewContentSizeDidChange(change: [NSObject : AnyObject]!) {
        super.scrollViewContentSizeDidChange(change)
    }
    override func scrollViewPanStateDidChange(change: [NSObject : AnyObject]!) {
        super.scrollViewPanStateDidChange(change)
    }

}


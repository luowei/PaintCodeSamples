//
//  MyClocksView.swift
//  ClockBoard
//
//  Created by luowei on 2016/10/17.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class MyClocksView: UIView {

    override func drawRect(rect: CGRect) {
        ClocksKit.drawClockPlayground(frame: self.bounds)
    }

}

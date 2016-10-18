//
//  MyActivityView.swift
//  ActivityBoard
//
//  Created by luowei on 2016/10/18.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class MyActivityView: UIView {

    override func drawRect(rect: CGRect) {
        LWActivity.drawMyActivity(frame: self.bounds)
    }
    

}

//
//  MyCustomBtn.swift
//  ButtonView
//
//  Created by luowei on 2016/10/17.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class MyCustomBtn: UIView {

    
    override func draw(_ rect: CGRect) {
        MyStyleKit.drawCanvas1(frame: self.bounds, btnText: "点击我")
    }
    

}

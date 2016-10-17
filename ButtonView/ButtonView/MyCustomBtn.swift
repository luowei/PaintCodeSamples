//
//  MyCustomBtn.swift
//  ButtonView
//
//  Created by luowei on 2016/10/17.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class MyCustomBtn: UIView {
    private var _isPressed = false
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        _isPressed = true
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        _isPressed = false
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        MyStyleKit.drawMyCustomButton(frame: self.bounds, btnText: "点击我", presse: _isPressed)
    }
    

}

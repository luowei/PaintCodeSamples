//
//  MyCustomBtn.swift
//  ButtonView
//
//  Created by luowei on 2016/10/17.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

@IBDesignable
class MyCustomBtn: UIView {
    private var _isPressed = false
    private var _innerText = "点击我"
    
    @IBInspectable var btnText:String{
        set(newText){
            _innerText = newText
            self.setNeedsDisplay()
        }
        get{
            return _innerText
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        _isPressed = true
        self.setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        _isPressed = false
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        MyStyleKit.drawMyCustomButton(self.bounds, btnText: _innerText, presse: _isPressed)
    }
    

}

//
//  MySinMotionView.swift
//  SinMotion
//
//  Created by luowei on 2016/10/17.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class MySinMotionView: UIView {

    private var _x:CGFloat = 0.0
    var x :CGFloat{
        set(newX){
            if(newX > 1){
                _x = 1
            }else if(newX < 0){
                _x = 0
            }else{
                _x = newX
            }
            self.setNeedsDisplay()
        }
        get{
            return _x * 280
        }
    }
    
    override func draw(_ rect: CGRect) {
        MyStyleKit.drawSinMotion(frame: self.bounds, x: x)
    }


}

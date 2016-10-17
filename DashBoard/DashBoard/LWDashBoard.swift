//
//  LWDashBoard.swift
//  DashBoard
//
//  Created by luowei on 2016/10/17.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class LWDashBoard: UIView {

    private var _pressure:CGFloat = 0
    var pressure:CGFloat{
        set(newPressure){
            if newPressure > 1.0 {
                _pressure = 1.0
            }else if newPressure < 0 {
                _pressure = 0.0
            }else{
                _pressure = newPressure
            }
            self.setNeedsDisplay()
        }
        get{
            return _pressure
        }
    }
    
    override func drawRect(rect: CGRect) {
        MyStyleKit.drawDashBoard(self.bounds, pressure: pressure)
    }
 

}

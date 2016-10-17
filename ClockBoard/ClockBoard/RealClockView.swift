//
//  RealClockView.swift
//  ClockBoard
//
//  Created by luowei on 2016/10/17.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class RealClockView: UIView {

    private var _hour:CGFloat = 0
    private var _minute:CGFloat = 0
    
    var hour:CGFloat{
        set(newHour){
            if newHour > 12 {
                _hour = 12
            }else if newHour < 0 {
                _hour = 0
            }else{
                _hour = newHour
            }
            self.setNeedsDisplay()
        }
        get{
            return _hour
        }
    }
    
    var minute:CGFloat{
        set(newMinute){
            if newMinute > 60 {
                _minute = 60
            }else if newMinute < 0 {
                _minute = 0
            }else{
                _minute = newMinute
            }
            self.setNeedsDisplay()
        }
        get{
            return _minute
        }
    }
    
    override func drawRect(rect: CGRect) {
        RealClockKit.drawMyClocks(frame: self.bounds, myHour: hour, myMinute: minute)
    }

}

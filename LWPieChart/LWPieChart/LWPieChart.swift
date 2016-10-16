//
//  LWPieChart.swift
//  LWPieChart
//
//  Created by luowei on 2016/10/16.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class LWPieChart: UIView {

    
    private var _innerRatio:CGFloat = 0.25
    @IBInspectable var ratio:CGFloat{
        set(newRatio){
            if newRatio > 1.0 {
                _innerRatio = 1.0
            }else if newRatio < 0 {
                _innerRatio = 0.0
            }else{
                _innerRatio = newRatio
            }
            self.setNeedsDisplay()
        }
        get{
            return _innerRatio
        }
    }
    
    private var _innerColor:UIColor = UIColor.green
    @IBInspectable var color:UIColor{
        set(newColor){
            _innerColor = newColor
            self.setNeedsDisplay()
        }
        get{
            return _innerColor
        }
    }
    
    override func draw(_ rect: CGRect) {
        LWPieChartDraw.drawPie(frame: self.bounds, color: color, ratio: ratio)
    }
    

}

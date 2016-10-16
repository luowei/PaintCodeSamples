//
//  LWProgressBar.swift
//  LWProgressBar
//
//  Created by luowei on 2016/10/15.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

@IBDesignable
class LWProgressBar: UIView {

    private var _innerProgress:CGFloat = 0.5
    
    var progress: CGFloat{
        set(newProgress){
            if newProgress > 1.0 {
                _innerProgress = 1.0
            }else if newProgress < 0{
                _innerProgress = 0.0
            }else{
                _innerProgress = newProgress
            }
            self.setNeedsDisplay()
        }
        get{
            return _innerProgress * bounds.width
        }
    }

    override func draw(_ rect: CGRect) {
        LWProgressDraw.drawR(frame: self.bounds, progress: progress)
    }

    override func awakeFromNib() {
        super.awakeFromNib()  
    }

}

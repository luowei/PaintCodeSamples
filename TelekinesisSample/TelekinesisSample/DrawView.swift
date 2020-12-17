//
//  DrawView.swift
//  TelekinesisSample
//
//  Created by luowei on 2016/11/11.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit
import Telekinesis

class DrawView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(setNeedsDisplay(_:)), name: NSNotification.Name.TelekinesisDidChangeStyleKit, object: nil)
        
    }

    override func draw(_ rect: CGRect) {
        MyStyleKit.drawOvalCanvas()
    }
    
}

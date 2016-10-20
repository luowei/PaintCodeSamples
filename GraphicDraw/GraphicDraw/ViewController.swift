//
//  ViewController.swift
//  GraphicDraw
//
//  Created by luowei on 2016/10/20.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myView: MyView!
    @IBOutlet weak var hConstrant:NSLayoutConstraint!
    @IBOutlet weak var wConstrant:NSLayoutConstraint!
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }
    
    func updateTime(){
        MyClockKit.hours = CGFloat(Date().hour())
        MyClockKit.minutes = CGFloat(Date().minute())
        MyClockKit.seconds = CGFloat(Date().second())
        
        self.myView.setNeedsDisplay()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        guard let t = timer as Timer? else {
            return
        }
        t.invalidate()
    }
    
    @IBAction func frameChange(_ sender: UISlider) {
        wConstrant.constant = CGFloat(sender.value * 440)
        hConstrant.constant = CGFloat(sender.value * 440)
    }

}


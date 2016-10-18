//
//  ViewController.swift
//  ClockBoard
//
//  Created by luowei on 2016/10/17.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightCons: NSLayoutConstraint!
    @IBOutlet weak var widthCons: NSLayoutConstraint!
    @IBOutlet weak var realClockView: RealClockView!
    @IBOutlet weak var clocksView: MyClocksView!
    private var timer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTime(){
        ClocksKit.hours1 = CGFloat(NSDate().hour())
        ClocksKit.minutes1 = CGFloat(NSDate().minute())
        ClocksKit.seconds1 = CGFloat(NSDate().second())
        ClocksKit.hours2 = CGFloat(NSDate().hour())
        ClocksKit.minutes2 = CGFloat(NSDate().minute())
        ClocksKit.seconds2 = CGFloat(NSDate().second())
        ClocksKit.hours3 = CGFloat(NSDate().hour())
        ClocksKit.minutes3 = CGFloat(NSDate().minute())
        ClocksKit.seconds3 = CGFloat(NSDate().second())
        
        clocksView.setNeedsDisplay()
    }
    
    deinit {
        guard let t = timer as NSTimer? else {
            return
        }
        t.invalidate()
        timer = nil
    }

    @IBAction func realSizeChange(sender: UISlider) {
        heightCons.constant = 50 + CGFloat(sender.value) * 300
        widthCons.constant = 50 + CGFloat(sender.value) * 300
        //self.view.setNeedsLayout()
    }
    
    @IBAction func realMinChange(sender: UISlider) {
        realClockView.minute = CGFloat(sender.value)
    }
    @IBAction func realHorChange(sender: UISlider) {
        realClockView.hour = CGFloat(sender.value)
    }
    

}


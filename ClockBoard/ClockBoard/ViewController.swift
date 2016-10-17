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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


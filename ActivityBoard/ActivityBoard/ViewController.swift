//
//  ViewController.swift
//  ActivityBoard
//
//  Created by luowei on 2016/10/18.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myActivityView: MyActivityView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moveChange(sender: UISlider) {
        LWActivity.moveLevel = CGFloat(sender.value)
        self.myActivityView.setNeedsDisplay()
    }
    @IBAction func exerciseChange(sender: UISlider) {
        LWActivity.exerciseLevel = CGFloat(sender.value)
        self.myActivityView.setNeedsDisplay()
    }
    @IBAction func standChange(sender: UISlider) {
        LWActivity.standLevel = CGFloat(sender.value)
        self.myActivityView.setNeedsDisplay()
    }

}


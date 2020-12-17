//
//  ViewController.swift
//  LWPieChart
//
//  Created by luowei on 2016/10/16.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pieChart: LWPieChart!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func slideMoved(_ sender: UISlider) {
        pieChart.ratio = CGFloat(sender.value)
    }

}


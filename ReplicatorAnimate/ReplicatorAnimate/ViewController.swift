//
//  ViewController.swift
//  ReplicatorAnimate
//
//  Created by luowei on 2016/10/24.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var moving :Bool = false

    @IBOutlet weak var indicatorView: IndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moveAction(_ sender: UIButton) {
        if !moving {
            self.indicatorView.addReplicatorAnimation()
            sender.setTitle("Stop", for: .normal)
            moving = true
        }else{
            self.indicatorView.removeAllAnimations()
            sender.setTitle("Start", for: .normal)
            moving = false
        }
    }

}


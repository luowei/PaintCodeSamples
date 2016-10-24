//
//  ViewController.swift
//  HamburgerAnimation
//
//  Created by luowei on 2016/10/24.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hamburgView: HumburgView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moveAction(_ sender: UIButton) {
        hamburgView.addAllAnimation()
    }
    @IBAction func stopAction(_ sender: UIButton) {
        hamburgView.removeAllAnimations()
    }

}


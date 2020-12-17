//
//  MyCollectionViewCollectionViewController.swift
//  GraphicDraw
//
//  Created by luowei on 2016/10/19.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyCollectionViewController: UICollectionViewController {

    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        guard let t = timer as Timer? else { return }
        RunLoop.current.add(t, forMode: .commonModes)
    }
    
    @objc func updateTime(){
        MyClockKit.hours = CGFloat(Date().hour())
        MyClockKit.minutes = CGFloat(Date().minute())
        MyClockKit.seconds = CGFloat(Date().second())
        
        guard let visibleCells = self.collectionView?.visibleCells as [UICollectionViewCell]? else{
            return
        }
        for v:UICollectionViewCell in visibleCells {
            guard let myCell = v as? MyCell as MyCell? else {
                break
            }
            myCell.clockView.setNeedsDisplay()
            
        }
    }

    deinit {
        guard let t = timer as Timer? else {
            return
        }
        t.invalidate()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
        (cell as? MyCell)?.clockView.setNeedsDisplay()
    
        return cell
    }
    

    // MARK: UICollectionViewDelegate

    
}

//
//  MyView.swift
//  GraphicDraw
//
//  Created by luowei on 2016/10/19.
//  Copyright © 2016年 wodedata. All rights reserved.
//

import UIKit

@IBDesignable
class MyView: UIView {
    
    @IBInspectable var borderWidth:CGFloat{
        set(newWidth){
            self.layer.borderWidth = newWidth
            self.setNeedsDisplay()
        }
        get{
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor{
        set(newColor){
            self.layer.borderColor = newColor.cgColor
            self.setNeedsDisplay()
        }
        get{
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }

    
    override func draw(_ rect: CGRect) {
        
        MyClockKit.drawClock(frame: self.bounds)
        
//        //MARK:画一根线段
//        let linePath = UIBezierPath()
//        linePath.move(to: CGPoint(x: 30, y: 50))
//        linePath.addLine(to: CGPoint(x: 190, y: 50))
//        UIColor.black.setStroke()
//        linePath.lineWidth = 2
//        linePath.stroke()
        
//        //MARK:画一根虚线段
//        let dashLinePath = UIBezierPath()
//        dashLinePath.move(to: CGPoint(x: 30, y: 50))
//        dashLinePath.addLine(to: CGPoint(x: 190, y: 50))
//        UIColor.black.setStroke()
//        dashLinePath.lineWidth = 2
//
//        guard let context = UIGraphicsGetCurrentContext() as CGContext? else{ return }
//        context.saveGState()
//        context.setLineDash(phase: 0, lengths: [10,5])
//        dashLinePath.stroke()
//        context.restoreGState()
        

//        //MARK:画一根折线
//        let breakenLinPath = UIBezierPath()
//        breakenLinPath.move(to: CGPoint(x: 30, y: 120))
//        breakenLinPath.addLine(to: CGPoint(x: 109.5, y: 90))
//        breakenLinPath.addLine(to: CGPoint(x: 190, y: 120))
//        UIColor.black.setStroke()
//        breakenLinPath.lineWidth = 2
//        breakenLinPath.stroke()
        
        
//        //MARK:画一根曲线
//        let curvePath = UIBezierPath()
//        curvePath.move(to: CGPoint(x: 30, y: 180))
//        curvePath.addCurve(to: CGPoint(x: 110, y: 140), controlPoint1: CGPoint(x: 30, y: 180), controlPoint2: CGPoint(x: 70, y: 140))
//        curvePath.addCurve(to: CGPoint(x: 190, y: 180), controlPoint1: CGPoint(x: 150, y: 140), controlPoint2: CGPoint(x: 190, y: 180))
//        UIColor.black.setStroke()
//        curvePath.lineWidth = 2
//        curvePath.stroke()
//        
//        //MARK:绘制一个矩形
//        let rectangleRect = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(20, 20, 20, 20))
//        let rectanglePath = UIBezierPath(rect: rectangleRect)
//        //填充颜色
//        UIColor.gray.setFill()
//        rectanglePath.fill()
 
        
//        let polygonRect = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(20, 20, 20, 20))
        
//        //MARK:绘制三角形
//        let polygon3Path = UIBezierPath()
//        polygon3Path.move(to: CGPoint(x: polygonRect.minX + 100, y: polygonRect.minY + 40.5))
//        polygon3Path.addLine(to: CGPoint(x: polygonRect.minX + 151.53, y: polygonRect.minY + 129.75))
//        polygon3Path.addLine(to: CGPoint(x: polygonRect.minX + 48.47, y: polygonRect.minY + 129.75))
//        polygon3Path.close()
//        UIColor.green.setFill()
//        polygon3Path.fill()
        
//        //MARK:绘制五边形
//        let polygon5Path = UIBezierPath()
//        polygon5Path.move(to: CGPoint(x: polygonRect.minX + 100, y: polygonRect.minY + 40.5))
//        polygon5Path.addLine(to: CGPoint(x: polygonRect.minX + 156.59, y: polygonRect.minY + 81.61))
//        polygon5Path.addLine(to: CGPoint(x: polygonRect.minX + 134.97, y: polygonRect.minY + 148.14))
//        polygon5Path.addLine(to: CGPoint(x: polygonRect.minX + 65.03, y: polygonRect.minY + 148.14))
//        polygon5Path.addLine(to: CGPoint(x: polygonRect.minX + 43.41, y: polygonRect.minY + 81.61))
//        polygon5Path.addLine(to: CGPoint(x: polygonRect.minX + 100, y: polygonRect.minY + 40.5))
//        polygon5Path.close()
//        UIColor.green.setFill()
//        polygon5Path.fill()
        
        
//        //MARK:绘制一个圆形
//        let ovalRect = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(20, 20, 20, 20))
//        let ovalPath = UIBezierPath(ovalIn: ovalRect)

        
//         //MARK:填充颜色
//        UIColor.darkGray.setFill()
//        ovalPath.fill()

        
//        //MARK:填充图片
//        guard let context = UIGraphicsGetCurrentContext() as CGContext?,
//            let image = UIImage(named: "image.png") as UIImage? else{
//                return
//        }
//        context.saveGState()
//        ovalPath.addClip()
//        image.draw(in: ovalRect)
//        context.restoreGState()
        
        
//        //MARK:填充边框
//        UIColor.green.setStroke()
//        ovalPath.lineWidth = 1
//        ovalPath.stroke()
        
        
//        //MARK:绘制一段文字
//        let rectangleStyle = NSMutableParagraphStyle()
//        rectangleStyle.alignment = .center
//        let rectangleFontAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue", size: 12)!, NSForegroundColorAttributeName: UIColor.blue, NSParagraphStyleAttributeName: rectangleStyle]
//        let textRect = UIEdgeInsetsInsetRect(self.bounds, UIEdgeInsetsMake(90, 20, 90, 20))
//        "Hello\nWorld".draw(in:textRect, withAttributes: rectangleFontAttributes)
        
    }
    

}

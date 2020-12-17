//
//  MyClockKit.swift
//  GraphicDraw
//
//  Created by luowei on 2016/10/19.
//  Copyright (c) 2016 wodedata. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

open class MyClockKit : NSObject {

    open static var hours: CGFloat = CGFloat(Date().hour())
    open static var minutes: CGFloat = CGFloat(Date().minute())
    open static var seconds: CGFloat = CGFloat(Date().second())
    
    //// Drawing Methods

    open class func drawClock(frame: CGRect = CGRect(x: 0, y: 0, width: 120, height: 120)) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()


        //// Variable Declarations
        let secondAngle: CGFloat = -seconds / 60.0 * 360
        let minuteAngle: CGFloat = -(minutes / 60.0 * 360 + secondAngle / 60.0)
        let hourAngle: CGFloat = -hours / 12.0 * 360 + minuteAngle / 12.0

        //MARK: Clock Edge Drawing
        let clockEdgePath = UIBezierPath(ovalIn: CGRect(x: frame.minX + floor(frame.width * 0.08333 + 0.5), y: frame.minY + floor(frame.height * 0.08333 + 0.5), width: floor(frame.width * 0.91667 + 0.5) - floor(frame.width * 0.08333 + 0.5), height: floor(frame.height * 0.91667 + 0.5) - floor(frame.height * 0.08333 + 0.5)))
        UIColor.lightGray.setStroke()
        clockEdgePath.lineWidth = 2
        clockEdgePath.stroke()


        //MARK: Clock Points Drawing
        let wDiam = floor(frame.width * 0.87500 + 0.5) - floor(frame.width * 0.12500 + 0.5)
        let hDiam = floor(frame.height * 0.87500 + 0.5) - floor(frame.height * 0.12500 + 0.5)
        // Compute Circumference
        let lwidth = 2 * CGFloat(M_PI) * wDiam + 4 * (wDiam - hDiam)
        let lheight = 2 * CGFloat(M_PI) * hDiam + 4 * (hDiam - wDiam)
        let circumference = wDiam > hDiam ? lwidth : lheight
        
        let clockPointsPath = UIBezierPath(ovalIn: CGRect(x: frame.minX + floor(frame.width * 0.12500 + 0.5), y: frame.minY + floor(frame.height * 0.12500 + 0.5), width: wDiam, height: hDiam))
        UIColor.lightGray.setStroke()
        clockPointsPath.lineWidth = 5
        context?.saveGState()
        
        context?.setLineDash(phase: 1.25, lengths: [2,(circumference/2 - 2 * 12)/12 ])
        clockPointsPath.stroke()
        context?.restoreGState()

        let radius = (wDiam + hDiam)/2/2
        
        //MARK: HourLine Drawing
        context?.saveGState()
        context?.translateBy(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.50000 * frame.height)
        context?.rotate(by: -hourAngle * CGFloat(M_PI) / 180)

        let hourLinePath = UIBezierPath()
        hourLinePath.move(to: CGPoint(x: 0, y: 0))
        hourLinePath.addCurve(to: CGPoint(x: 0, y: -(radius * 0.5)), controlPoint1: CGPoint(x: 0, y: -(radius * 0.5)), controlPoint2: CGPoint(x: 0, y: -(radius * 0.5)))
        hourLinePath.lineCapStyle = .round;

        UIColor.lightGray.setStroke()
        hourLinePath.lineWidth = 3
        hourLinePath.stroke()

        context?.restoreGState()


        //MARK: MinuteLine Drawing
        context?.saveGState()
        context?.translateBy(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.50000 * frame.height)
        context?.rotate(by: -minuteAngle * CGFloat(M_PI) / 180)

        let minuteLinePath = UIBezierPath()
        minuteLinePath.move(to: CGPoint(x: 0, y: 0))
        minuteLinePath.addCurve(to: CGPoint(x: 0, y: -(radius * 0.75)), controlPoint1: CGPoint(x: 0, y: -(radius * 0.75)), controlPoint2: CGPoint(x: 0, y: -(radius * 0.75)))
        minuteLinePath.lineCapStyle = .round;

        UIColor.gray.setStroke()
        minuteLinePath.lineWidth = 2
        minuteLinePath.stroke()

        context?.restoreGState()


        //MARK: SecondLine Drawing
        context?.saveGState()
        context?.translateBy(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.50000 * frame.height)
        context?.rotate(by: -secondAngle * CGFloat(M_PI) / 180)

        let secondLinePath = UIBezierPath()
        secondLinePath.move(to: CGPoint(x: 0, y: 0))
        secondLinePath.addCurve(to: CGPoint(x: 0, y: -radius), controlPoint1: CGPoint(x: 0, y: -radius), controlPoint2: CGPoint(x: 0, y: -radius))
        secondLinePath.lineCapStyle = .round;

        UIColor.darkGray.setStroke()
        secondLinePath.lineWidth = 1
        secondLinePath.stroke()

        context?.restoreGState()


        //MARK: CenterOval Drawing
        context?.saveGState()
        context?.translateBy(x: frame.minX + 0.50000 * frame.width, y: frame.minY + 0.50000 * frame.height)

        let centerOvalPath = UIBezierPath(ovalIn: CGRect(x: -1.66, y: -1.34, width: 3, height: 3))
        UIColor.lightGray.setFill()
        centerOvalPath.fill()
        UIColor.lightGray.setStroke()
        centerOvalPath.lineWidth = 2
        centerOvalPath.stroke()

        context?.restoreGState()


        //MARK: Text Drawing
        //// 3 Drawing
        let _3Rect = CGRect(x: frame.minX + floor(frame.width * 0.79167 + 0.5), y: frame.minY + floor(frame.height * 0.46250) + 0.5, width: floor(frame.width * 0.87500 + 0.5) - floor(frame.width * 0.79167 + 0.5), height: floor(frame.height * 0.54583) - floor(frame.height * 0.46250))
        let _3TextContent = NSString(string: "3")
        let _3Style = NSMutableParagraphStyle()
        _3Style.alignment = .center

        let _3FontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 8), NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.paragraphStyle: _3Style]

        let _3TextHeight: CGFloat = _3TextContent.boundingRect(with: CGSize(width: _3Rect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: _3FontAttributes, context: nil).size.height
        context?.saveGState()
        context?.clip(to: _3Rect)
        _3TextContent.draw(in: CGRect(x: _3Rect.minX, y: _3Rect.minY + (_3Rect.height - _3TextHeight) / 2, width: _3Rect.width, height: _3TextHeight), withAttributes: _3FontAttributes)
        context?.restoreGState()


        //// 6 Drawing
        let _6Rect = CGRect(x: frame.minX + floor(frame.width * 0.45833 + 0.5), y: frame.minY + floor(frame.height * 0.78750) + 0.5, width: floor(frame.width * 0.54167 + 0.5) - floor(frame.width * 0.45833 + 0.5), height: floor(frame.height * 0.87083) - floor(frame.height * 0.78750))
        let _6TextContent = NSString(string: "6")
        let _6Style = NSMutableParagraphStyle()
        _6Style.alignment = .center

        let _6FontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 8), NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.paragraphStyle: _6Style]

        let _6TextHeight: CGFloat = _6TextContent.boundingRect(with: CGSize(width: _6Rect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: _6FontAttributes, context: nil).size.height
        context?.saveGState()
        context?.clip(to: _6Rect)
        _6TextContent.draw(in: CGRect(x: _6Rect.minX, y: _6Rect.minY + (_6Rect.height - _6TextHeight) / 2, width: _6Rect.width, height: _6TextHeight), withAttributes: _6FontAttributes)
        context?.restoreGState()


        //// 9 Drawing
        let _9Rect = CGRect(x: frame.minX + floor(frame.width * 0.12500 + 0.5), y: frame.minY + floor(frame.height * 0.46250) + 0.5, width: floor(frame.width * 0.20833 + 0.5) - floor(frame.width * 0.12500 + 0.5), height: floor(frame.height * 0.54583) - floor(frame.height * 0.46250))
        let _9TextContent = NSString(string: "9")
        let _9Style = NSMutableParagraphStyle()
        _9Style.alignment = .center

        let _9FontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 8), NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.paragraphStyle: _9Style]

        let _9TextHeight: CGFloat = _9TextContent.boundingRect(with: CGSize(width: _9Rect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: _9FontAttributes, context: nil).size.height
        context?.saveGState()
        context?.clip(to: _9Rect)
        _9TextContent.draw(in: CGRect(x: _9Rect.minX, y: _9Rect.minY + (_9Rect.height - _9TextHeight) / 2, width: _9Rect.width, height: _9TextHeight), withAttributes: _9FontAttributes)
        context?.restoreGState()


        //// 12 Drawing
        let _12Rect = CGRect(x: frame.minX + floor(frame.width * 0.45833 + 0.5), y: frame.minY + floor(frame.height * 0.13750) + 0.5, width: floor(frame.width * 0.54167 + 0.5) - floor(frame.width * 0.45833 + 0.5), height: floor(frame.height * 0.22083) - floor(frame.height * 0.13750))
        let _12TextContent = NSString(string: "12")
        let _12Style = NSMutableParagraphStyle()
        _12Style.alignment = .center

        let _12FontAttributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 8), NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.paragraphStyle: _12Style]

        let _12TextHeight: CGFloat = _12TextContent.boundingRect(with: CGSize(width: _12Rect.width, height: CGFloat.infinity), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: _12FontAttributes, context: nil).size.height
        context?.saveGState()
        context?.clip(to: _12Rect)
        _12TextContent.draw(in: CGRect(x: _12Rect.minX, y: _12Rect.minY + (_12Rect.height - _12TextHeight) / 2, width: _12Rect.width, height: _12TextHeight), withAttributes: _12FontAttributes)
        context?.restoreGState()
    }

}


//MARK: CALayer Extension
extension CALayer {
    var borderUIColor: UIColor! {
        set {
            self.borderColor = newValue.cgColor
        }
        get {
            return nil
        }
    }
}


//MARK: NSDate Extension
extension Date {
    func hour() -> Int {
        //Get Hour
        let calendar = NSCalendar.current
        let hour = calendar.component(.hour, from: self as Date)
        
        //Return Hour
        return hour
    }
    
    
    func minute() -> Int {
        //Get Minute
        let calendar = NSCalendar.current
        let minute = calendar.component(.minute, from: self as Date)
        
        //Return Minute
        return minute
    }
    
    func second() -> Int {
        //Get Minute
        let calendar = NSCalendar.current
        let minute = calendar.component(.second, from: self as Date)
        
        //Return Minute
        return minute
    }
    
    func toShortTimeString() -> String {
        //Get Short Time String
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let timeString = formatter.string(from: self as Date)
        
        //Return Short Time String
        return timeString
    }
}



//
//  LWScaleViewController.m
//  RotateView
//
//  Created by luowei on 2016/11/9.
//  Copyright © 2016年 wodedata. All rights reserved.
//

#import "LWScaleViewController.h"

@interface LWScaleViewController ()

@end

@implementation LWScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


@implementation LWScaleView

-(void)drawRect:(CGRect)rect{
    
//    //// Bezier Drawing
//    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
//    [bezierPath moveToPoint: CGPointMake(14.5, 30.5)];
//    [bezierPath addCurveToPoint: CGPointMake(19.5, 69.5) controlPoint1: CGPointMake(14.5, 31.5) controlPoint2: CGPointMake(19.5, 69.5)];
//    [bezierPath addLineToPoint: CGPointMake(53.5, 40.5)];
//    [bezierPath addLineToPoint: CGPointMake(86.5, 84.5)];
//    bezierPath.lineJoinStyle = kCGLineJoinRound;
    
    UIBezierPath* bezierPath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, 50, 50)];
    
//    [bezierPath applyTransform:CGAffineTransformMakeScale(2.0f,2.0f)];
    
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 4.0, 2.0);
    [bezierPath applyTransform:transform];
    
    [UIColor.blackColor setStroke];
    bezierPath.lineWidth = 2;
    [bezierPath stroke];
}

@end

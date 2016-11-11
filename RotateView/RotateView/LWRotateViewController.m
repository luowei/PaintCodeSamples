//
//  LWRotateViewController.m
//  RotateView
//
//  Created by luowei on 2016/11/9.
//  Copyright © 2016年 wodedata. All rights reserved.
//

#import "LWRotateViewController.h"

@interface LWRotateViewController ()

@end

@implementation LWRotateViewController

- (IBAction)unwindSegue:(UIStoryboardSegue *)segue {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPanGestureRecognizer *_rec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onDrag:)];
    [self.view addGestureRecognizer:_rec];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onDrag:(UIPanGestureRecognizer *)rec {
    CGPoint beganPoint;
    CGPoint movePoint;
    CGPoint endPoint;
    
    switch (rec.state) {
        case UIGestureRecognizerStateBegan: {
            beganPoint = [rec locationInView:self.view];
            
            break;
        }
        case UIGestureRecognizerStateChanged: {
            movePoint = [rec locationInView:self.view];
            
            //计算角度
            CGPoint center = self.rotateView.center;
            //CGFloat startAngle = (CGFloat) (atan2(beganPoint.y - center.y,beganPoint.x - center.x) * 180 / M_PI);
            CGFloat movingAngle = (CGFloat) (atan2(movePoint.y - center.y,movePoint.x - center.x));
            //CGFloat angle = movingAngle - startAngle;
            //NSLog(@"=====startAngle:%f, movingAngle:%f, angle:%f",startAngle,movingAngle,angle);
            //旋转
            //[self.rotateView rotateAngle:movingAngle];
            [self.rotateView setTransform:CGAffineTransformMakeRotation(movingAngle)];
            
            break;
        }
        case UIGestureRecognizerStateEnded: {
            endPoint = [rec locationInView:self.view];
            
//            //计算角度
//            CGPoint center = self.rotateView.center;
//            //CGFloat startAngle = (CGFloat) (atan2(beganPoint.y - center.y,beganPoint.x - center.x) * 180 / M_PI);
//            CGFloat endAngle = (CGFloat) (atan2(endPoint.y - center.y,endPoint.x - center.x) * 180 / M_PI);
//            //CGFloat angle = movingAngle - startAngle;
//            //旋转
//            [self.rotateView rotateAngle:endAngle];
            
            break;
        }
        default:break;
    }
    
    
}

@end



@implementation UIView (Rotate)

//旋转
- (void)rotateAngle:(CGFloat)angle {
    CGFloat radians = (CGFloat) (angle * M_PI / 180);
    CGAffineTransform transform = CGAffineTransformRotate(self.transform, radians);
    self.transform = transform;
}

@end





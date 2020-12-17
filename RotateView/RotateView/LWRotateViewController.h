//
//  LWRotateViewController.h
//  RotateView
//
//  Created by luowei on 2016/11/9.
//  Copyright © 2016年 wodedata. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LWRotateViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *rotateView;

@end


@interface UIView (Rotate)

//旋转
- (void)rotateAngle:(CGFloat)angle;

@end

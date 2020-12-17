//
//  ViewController.m
//  RotateView
//
//  Created by luowei on 2016/11/7.
//  Copyright © 2016年 wodedata. All rights reserved.
//
//参考：http://stackoverflow.com/questions/21760996/pan-zoom-rotate-uiview-around-anchorpoint-using-uigesturerecognizer-ios

#import "ViewController.h"

@interface ViewController (){
    CGFloat tx; // x translation
    CGFloat ty; // y translation
    CGFloat scale; // zoom scale
    CGFloat theta; // rotation angle
    CGFloat initScale ;
    CGFloat initTheta ;
}

@end

@implementation ViewController

- (IBAction)unwindSegue:(UIStoryboardSegue *)segue {
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    [rotationGesture setDelegate:self];
    [self.view addGestureRecognizer:rotationGesture];
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    [pinchGesture setDelegate:self];
    [self.view addGestureRecognizer:pinchGesture];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [panGesture setDelegate:self];
    [panGesture setMinimumNumberOfTouches:1];
    [panGesture setMaximumNumberOfTouches:1];
    [self.view addGestureRecognizer:panGesture];
    _baseImage.transform = CGAffineTransformIdentity;
    tx = 0.0f; ty = 0.0f; scale = 1.0f; theta = 0.0f;
    scale = 1.0;
    //removing and adding back to the view seems to fix problems with anchor point I was having, I suspect because of IB layout/scaling and constraints etc
    UIView *mySuperView =_baseImage.superview;
    [_baseImage removeFromSuperview];
    [mySuperView addSubview:_baseImage];
}
-(void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)myview
{
    CGPoint oldOrigin = myview.frame.origin;
    myview.layer.anchorPoint = anchorPoint;
    CGPoint newOrigin = myview.frame.origin;
    CGPoint transition;
    transition.x = (newOrigin.x - oldOrigin.x);
    transition.y = (newOrigin.y - oldOrigin.y);
    CGPoint myNewCenter = CGPointMake (myview.center.x - transition.x, myview.center.y - transition.y);
    myview.center =  myNewCenter;
}
- (void) updateTransformWithOffset: (CGPoint) translation
{
    // Create a blended transform representing translation,
    // rotation, and scaling
    _baseImage.transform = CGAffineTransformMakeTranslation(translation.x + tx, translation.y + ty);
    _baseImage.transform = CGAffineTransformRotate(_baseImage.transform, theta);
    _baseImage.transform = CGAffineTransformScale(_baseImage.transform, scale, scale);
}
- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)uigr {
    if (uigr.state == UIGestureRecognizerStateBegan) {
        tx =_baseImage.transform.tx;
        ty =_baseImage.transform.ty;
        CGPoint locationInView = [uigr locationInView:_baseImage];
        CGPoint newAnchor = CGPointMake( (locationInView.x / _baseImage.bounds.size.width), (locationInView.y / _baseImage.bounds.size.height ));
        [self setAnchorPoint:newAnchor forView:_baseImage];
    }
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    // if the gesture recognizers are on different views, don't allow simultaneous recognition
    if (gestureRecognizer.view != otherGestureRecognizer.view)
        return NO;
    
    if (![gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] && ![otherGestureRecognizer isKindOfClass:[UITapGestureRecognizer class]]) {
        return YES;
    }
    return NO;
}
- (void) handleRotation: (UIRotationGestureRecognizer *) uigr
{
    if (uigr.state == UIGestureRecognizerStateBegan) {
        initTheta = theta;
    }
    theta = initTheta+uigr.rotation;
    [self adjustAnchorPointForGestureRecognizer:uigr];
    [self updateTransformWithOffset:CGPointZero];
}
- (void) handlePinch: (UIPinchGestureRecognizer *) uigr
{
    if (uigr.state == UIGestureRecognizerStateBegan) {
        initScale = scale;
    }
    scale = initScale*uigr.scale;
    [self adjustAnchorPointForGestureRecognizer:uigr];
    [self updateTransformWithOffset:CGPointZero];
    
}
- (void) handlePan: (UIPanGestureRecognizer *) uigr
{
    CGPoint translation = [uigr translationInView:_baseImage.superview];
    [self adjustAnchorPointForGestureRecognizer:uigr];
    [self updateTransformWithOffset:translation];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

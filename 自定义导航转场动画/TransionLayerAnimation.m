//
//  TransionLayerAnimation.m
//  自定义导航转场动画
//
//  Created by 赵国栋 on 16/3/21.
//  Copyright © 2016年 王雪飞. All rights reserved.
//

#import "TransionLayerAnimation.h"

@implementation TransionLayerAnimation
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 3.0;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containView = [transitionContext containerView];
    
    
    if (self.type == Pushs) {
                //        NSLog(@"transform a = %f ",fromVC.view.transform.a);
        [containView addSubview:toVC.view];
        [containView addSubview:fromVC.view];
        [self transitionWithType:@"cube" WithSubtype:kCATransitionFromRight ForView:containView];
        [fromVC.view removeFromSuperview];
        [transitionContext completeTransition:YES];


    }else{
        [containView addSubview:toVC.view];
        [containView addSubview:fromVC.view];
        [self transitionWithType:@"cube" WithSubtype:kCATransitionFromLeft ForView:containView];
        [fromVC.view removeFromSuperview];
        [transitionContext completeTransition:YES];

        //        NSLog(@"transform=%@",toVC.view.transform);
        //        toVC.view.transform = CGAffineTransformRotate(toVC.view.transform, M_PI);
        //        [fromVC.view removeFromSuperview];
        
    }
}
#pragma CATransition动画实现
- (void) transitionWithType:(NSString *) type WithSubtype:(NSString *) subtype ForView : (UIView *) view
{
    //创建CATransition对象
    CATransition *animation = [CATransition animation];
    
    //设置运动时间
    animation.duration = 3.0;
    animation.delegate = self;
    //设置运动type
    animation.type = type;
    if (subtype != nil) {
        
        //设置子类
        animation.subtype = subtype;
    }
    
    //设置运动速度
    animation.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    
    [view.layer addAnimation:animation forKey:@"animation"];
    
    //    [self.imageView.layer addAnimation:animation forKey:@"animation"];
    //    [self.navigationController.view.layer addAnimation:animation forKey:nil];
    
}
//给传入的View改变锚点
-(void)updateAnchorPointAndOffset:(CGPoint)anchorPoint view:(UIView *)view{
    CGRect rect = view.frame;
    view.layer.anchorPoint = anchorPoint;
    view.frame = rect;
    //    view.layer.position    = CGPointMake(0, CGRectGetMidY([UIScreen mainScreen].bounds));
}
@end

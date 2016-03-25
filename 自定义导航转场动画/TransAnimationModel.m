//
//  TransAnimationModel.m
//  自定义导航转场动画
//
//  Created by 赵国栋 on 16/3/17.
//  Copyright © 2016年 王雪飞. All rights reserved.
//

#import "TransAnimationModel.h"

@implementation TransAnimationModel
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
    if (self.type == Push) {
        [containView addSubview:toVC.view];
        [containView addSubview:fromVC.view];
        [self updateAnchorPointAndOffset:CGPointMake(0.5, 1) view:fromVC.view];
        [UIView animateKeyframesWithDuration:3.0 delay:0 options:0 animations:^{
            [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.65 animations:^{
                fromVC.view.transform = CGAffineTransformMakeRotation(M_PI_2);
            }];
            [UIView addKeyframeWithRelativeStartTime:0.65 relativeDuration:1.00 animations:^{
                fromVC.view.transform = CGAffineTransformMakeRotation(M_PI_2*2);
            }];
        } completion:^(BOOL finished) {
            [fromVC.view removeFromSuperview];
            [transitionContext completeTransition:YES];
        }];
    }else{
        [containView addSubview:toVC.view];
        
        UIView *snapshot = [fromVC.view snapshotViewAfterScreenUpdates:NO];
        snapshot.frame = fromVC.view.frame;
        [containView addSubview:snapshot];
        [containView bringSubviewToFront:snapshot];
        [fromVC.view removeFromSuperview];
        
        [containView insertSubview:snapshot belowSubview:toVC.view];

        [UIView animateKeyframesWithDuration:3.0 delay:0 options:0 animations:^{
            [UIView addKeyframeWithRelativeStartTime:0.0 relativeDuration:0.65 animations:^{
                toVC.view.transform = CGAffineTransformRotate(toVC.view.transform, M_PI_2);
            }];
            [UIView addKeyframeWithRelativeStartTime:0.65 relativeDuration:1.00 animations:^{
                toVC.view.transform = CGAffineTransformRotate(toVC.view.transform, M_PI_2);
            }];
        } completion:^(BOOL finished) {
            [snapshot removeFromSuperview];
            [transitionContext completeTransition:YES];
            
        }];
    }
}
//给传入的View改变锚点
-(void)updateAnchorPointAndOffset:(CGPoint)anchorPoint view:(UIView *)view{
    CGRect rect = view.frame;
    view.layer.anchorPoint = anchorPoint;
    view.frame = rect;
//    view.layer.position    = CGPointMake(0, CGRectGetMidY([UIScreen mainScreen].bounds));
    

}
@end

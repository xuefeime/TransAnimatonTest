//
//  TransAnimationModel.h
//  自定义导航转场动画
//
//  Created by 赵国栋 on 16/3/17.
//  Copyright © 2016年 王雪飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,TransAnimationType)
{
    Push,
    Pop,
};
@interface TransAnimationModel : NSObject<UIViewControllerAnimatedTransitioning>

@property   (nonatomic,assign)TransAnimationType type;

@end

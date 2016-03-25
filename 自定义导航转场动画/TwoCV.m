//
//  TwoCV.m
//  自定义导航转场动画
//
//  Created by 赵国栋 on 16/3/17.
//  Copyright © 2016年 王雪飞. All rights reserved.
//

#import "TwoCV.h"

@implementation TwoCV
- (void)viewDidLoad
{
    self.title = @"two";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"02.jpg"]];
//    [UIView animateKeyframesWithDuration:<#(NSTimeInterval)#> delay:<#(NSTimeInterval)#> options:<#(UIViewKeyframeAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>];
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 300, 300)];
//    [button setTitle:@"name" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(ooo) forControlEvents:UIControlEventTouchUpInside];
//     [self.view addSubview:button];
}
- (void)ooo
    {
        [self.navigationController popViewControllerAnimated:YES];
     }
@end

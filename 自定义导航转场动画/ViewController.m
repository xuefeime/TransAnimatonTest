//
//  ViewController.m
//  自定义导航转场动画
//
//  Created by 赵国栋 on 16/3/17.
//  Copyright © 2016年 王雪飞. All rights reserved.
//

#import "ViewController.h"
#import "TwoCV.h"
#import "TransAnimationModel.h"
#import "TransionLayerAnimation.h"

typedef NS_ENUM(NSInteger, AnimationType)
{
    Rotation,
    Cube,
};
@interface ViewController ()

@property   (nonatomic,assign)AnimationType animationType;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"one";
//    self.model = [[TransAnimationModel alloc]init];
//    self.model = [[TransionLayerAnimation alloc]init];
    self.navigationController.delegate = self;

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"01.jpg"]];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)rotationClick:(id)sender {
    TwoCV *two = [self.storyboard instantiateViewControllerWithIdentifier:@"twoVC"];
    self.animationType = Rotation;
    [self.navigationController pushViewController:two animated:YES];
}
- (IBAction)cubeClick:(id)sender {
    TwoCV *two = [self.storyboard instantiateViewControllerWithIdentifier:@"twoVC"];
    self.animationType = Cube;
    [self.navigationController pushViewController:two animated:YES];
}
- (IBAction)buttonClick:(id)sender {
    TwoCV *two = [self.storyboard instantiateViewControllerWithIdentifier:@"twoVC"];
    
    [self.navigationController pushViewController:two animated:YES];
}


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0)
{
    id animationModel;
    if(operation == UINavigationControllerOperationPush)
    {
        switch (self.animationType) {
            case Rotation:
            {
               TransAnimationModel* model = [[TransAnimationModel alloc]init];
                model.type = Push;
                animationModel = model;
            }
                break;
            case Cube:
            {
                TransionLayerAnimation* model = [[TransionLayerAnimation alloc]init];
                model.type = Pushs;
                animationModel = model;
            }
            default:
                break;
        }
        
    }else if(operation == UINavigationControllerOperationPop){
        switch (self.animationType) {
            case Rotation:
            {
                TransAnimationModel* model = [[TransAnimationModel alloc]init];
                model.type = Pop;
                animationModel = model;
            }
                break;
            case Cube:
            {
                TransionLayerAnimation* model = [[TransionLayerAnimation alloc]init];
                model.type = Pops;
                animationModel = model;

            }
            default:
                break;
        }

    }
    return animationModel;
}

-(id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

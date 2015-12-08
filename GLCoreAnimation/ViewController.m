//
//  ViewController.m
//  GLCoreAnimation
//
//  Created by hyq on 15/12/7.
//  Copyright © 2015年 Grey. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self uiviewAnimationTest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)uiviewAnimationTest{
//    UIView *contentView = [[UIView alloc]initWithFrame:CGRectZero];
    
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    UIView *contentView2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    contentView.backgroundColor = [UIColor redColor];
    contentView2.backgroundColor = [UIColor blueColor];

    [self.view addSubview:contentView];
    [self.view addSubview:contentView2];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    //
    [UIView beginAnimations:@"uiviewAnimationTest" context:context];//动画开始
    //设置动画加减速方式
    /*
        UIViewAnimationCurveEaseInOut,         // slow at beginning and end
        UIViewAnimationCurveEaseIn,            // slow at beginning
        UIViewAnimationCurveEaseOut,           // slow at end
        UIViewAnimationCurveLinear
     */
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    //动画时长，一般动画时长不要超过2s，以免用户厌恶
    [UIView setAnimationDuration:2.0];
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationDelegate:self];
    
    //默认的委托是-animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context,
    //当然也可以修改
    //[UIView setAnimationDidStopSelector:<#(nullable SEL)#>];
    
    //view开始动画的起始位置从当前位置还是默认位置，这对于连续的多个动画串连起来很有用，可以保证动画的连贯性。
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
    [self.view bringSubviewToFront:contentView];
    //UIView改变的内容
//    contentView.backgroundColor = [UIColor redColor];
//    contentView.frame = CGRectMake(100, 100, 100, 100);
    
    //动画的过渡效果
    /*
    UIViewAnimationTransitionNone,
    UIViewAnimationTransitionFlipFromLeft,
    UIViewAnimationTransitionFlipFromRight,
    UIViewAnimationTransitionCurlUp,
    UIViewAnimationTransitionCurlDown,
*/
    
    
    [UIView commitAnimations];//动画结束
}
//setAnimationDidStopSelector默认的委托
- (void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
    NSLog(@"animationId:%@",animationID);
}
- (IBAction)startAnimationBtn:(id)sender {
//    [self uiviewAnimationTest];
    [self coreAnimationTest];
}

- (void)coreAnimationTest{
    CALayer *layer = [[CALayer alloc]init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(10, 10, 100, 100);
    layer.cornerRadius = 2;
    [self.view.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:layer.position];
    
    //position移动
    CGPoint toPoint = layer.position;
    toPoint.x += 100;
    toPoint.y += 100;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.duration = 5;
    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
    animation.autoreverses = YES;

    //以x轴进行旋转
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0*M_PI];
    rotateAnimation.duration = 3;

    //长度缩放
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleAnimation.duration = 2;
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:2.6];
    scaleAnimation.fillMode = kCAFillModeForwards;
    
    //
//    [layer addAnimation:animation forKey:@"animation"];
//    [layer addAnimation:rotateAnimation forKey:@"rotateAnimation"];
//    [layer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 5;
    group.fillMode = kCAFillModeForwards;
    group.animations = [NSArray arrayWithObjects:animation,rotateAnimation,scaleAnimation, nil];
    [layer addAnimation:group forKey:@"group"];
    
    

}

@end

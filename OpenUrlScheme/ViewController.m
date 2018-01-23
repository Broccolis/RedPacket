//
//  ViewController.m
//  OpenUrlScheme
//
//  Created by JLei on 2018/1/22.
//  Copyright © 2018年 助力互联. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) UIView *bgView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    self.bgView.backgroundColor = [UIColor orangeColor];
    self.bgView.userInteractionEnabled = YES;
    [self.view addSubview:self.bgView];
    
    [self startRedPackets];
    
}

- (void)startRedPackets {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(showRain) userInfo:nil repeats:YES];
    //[self.timer invalidate];
}

- (void)showRain {

    CALayer *moveLayer = [CALayer new];
    moveLayer.bounds = CGRectMake(0, 0, 22, 29/2);
    moveLayer.anchorPoint = CGPointMake(0, 0);
    moveLayer.position = CGPointMake(0, -29/2);
    moveLayer.contents = (id)[UIImage imageNamed:@"绿色小汽车"].CGImage;
    [self.bgView.layer addSublayer:moveLayer];
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *A = [NSValue valueWithCGPoint:CGPointMake(arc4random() % 414, 0)];
    NSValue *B = [NSValue valueWithCGPoint:CGPointMake(arc4random() % 414, 667)];
    
    moveAnimation.values = @[A,B];
    moveAnimation.duration = arc4random() %200 / 100.0 + 3.5;
    moveAnimation.repeatCount = 1;
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [moveLayer addAnimation:moveAnimation forKey:nil];
    
    CAKeyframeAnimation *transAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    CATransform3D r0 = CATransform3DMakeRotation(M_PI/180 * (arc4random() % 360),0,0,-1);
    CATransform3D r1 = CATransform3DMakeRotation(M_PI/180 * (arc4random() % 360),0,0,-1);
    
    transAnimation.values = @[[NSValue valueWithCATransform3D:r0],[NSValue valueWithCATransform3D:r1]];
    transAnimation.duration = arc4random() %200 / 100.0 + 3.5;
    transAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [transAnimation setFillMode:kCAFillModeForwards];
    [transAnimation setRemovedOnCompletion:NO];
    [moveLayer addAnimation:transAnimation forKey:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

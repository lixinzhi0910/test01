//
//  ViewController.m
//  test
//
//  Created by 李新智 on 2018/5/16.
//  Copyright © 2018年 李新智. All rights reserved.
//

#import "ViewController.h"
#import <objc/message.h>
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    objc_msgSend(self, @selector(eat));
    method_exchangeImplementations(<#Method  _Nonnull m1#>, <#Method  _Nonnull m2#>)
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    [shapeLayer setBounds:self.view.bounds];
//    [shapeLayer setPosition:self.view.center];
//    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
//
//    // 设置虚线颜色为blackColor
//    [shapeLayer setStrokeColor:[[UIColor redColor] CGColor]];
//
//    // 3.0f设置虚线的宽度
//    [shapeLayer setLineWidth:1.0f];
//    [shapeLayer setLineJoin:kCALineJoinRound];
//
//    // 3=线的宽度 1=每条线的间距
//    [shapeLayer setLineDashPattern:
//     [NSArray arrayWithObjects:[NSNumber numberWithInt:10],
//      [NSNumber numberWithInt:5],nil]];
//
//    // Setup the path
////    CGMutablePathRef path = CGPathCreateMutable();
////    CGPathMoveToPoint(path, NULL, 0, 89);
////    CGPathAddLineToPoint(path, NULL, 320,89);
////
////    [shapeLayer setPath:path];
////    CGPathRelease(path);
//    UIBezierPath *oath = [UIBezierPath bezierPath];
//    [oath moveToPoint:CGPointMake(0, 100)];
//    [oath addLineToPoint:CGPointMake(320, 100)];
//    shapeLayer.path = oath.CGPath;
//    // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
//    [[self.view layer] addSublayer:shapeLayer];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    //开始点 从上左下右的点
    [aPath moveToPoint:CGPointMake(100,100)];
    //划线点
    [aPath addLineToPoint:CGPointMake(60, 140)];
    [aPath addLineToPoint:CGPointMake(60, 240)];
    [aPath addLineToPoint:CGPointMake(160, 240)];
    [aPath addLineToPoint:CGPointMake(160, 140)];
    [aPath closePath];
    //设置定点是个5*5的小圆形（自己加的）
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100-5/2.0, 0, 5, 5)];
    [aPath appendPath:path];
    
    CAShapeLayer *shapelayer = [CAShapeLayer layer];
    //设置边框颜色
    shapelayer.strokeColor = [[UIColor redColor]CGColor];
    //设置填充颜色 如果只要边 可以把里面设置成[UIColor ClearColor]
    shapelayer.fillColor = [[UIColor blueColor]CGColor];
    //就是这句话在关联彼此（UIBezierPath和CAShapeLayer）：
    shapelayer.path = aPath.CGPath;
    [self.view.layer addSublayer:shapelayer];
}
- (void)eat{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

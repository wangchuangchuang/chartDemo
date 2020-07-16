//
//  ViewController.m
//  ChartDemo
//
//  Created by 王创创 on 2020/3/6.
//  Copyright © 2020年 Wex. All rights reserved.
//

#import "ViewController.h"
#import "ChartView.h"
#import "BezierCurveView.h"
#import "ChartCell.h"
#import "XaxisView.h"


#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
@interface ViewController ()

@property (nonatomic,strong)BezierCurveView *bezierView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(50, 100) radius:10 startAngle:M_PI_2 endAngle:M_PI_2*3 clockwise:YES];
    
    
    [path moveToPoint:CGPointMake(50, 90)];
    [path addLineToPoint:CGPointMake(100, 90)];
    
//    [path moveToPoint:CGPointMake(50, 110)];
//    [path addLineToPoint:CGPointMake(103, 110)];
    
    [path moveToPoint:CGPointMake(100, 90)];
    [path addLineToPoint:CGPointMake(103, 110)];
    
    [path closePath];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.view.bounds;
    layer.path = path.CGPath;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor redColor].CGColor;
    
    
    [self.view.layer addSublayer:layer];
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = layer.bounds;
    gradientLayer.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor brownColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
    gradientLayer.backgroundColor = [UIColor greenColor].CGColor;
//    layer.mask = gradientLayer;
//    gradientLayer.mask = layer;
    [layer addSublayer:gradientLayer];
    
    //1.初始化
    _bezierView = [BezierCurveView initWithFrame:CGRectMake(30, 30, SCREEN_W-60, 280)];
    _bezierView.center = self.view.center;
    [self.view addSubview:_bezierView];
    // 多根折线图
    [_bezierView drawBarChartViewWithX_Value_Names:(NSMutableArray *)@[@"语文",@"数学",@"英语",@"物理",@"化学",@"生物",@"政治",@"历史",@"地理"] TargetValues:(NSMutableArray *)@[@60,@20,@50,@30,@90,@30,@100,@70, @20]];
    
    
    ChartCell *chartCell = [[ChartCell alloc] initWithFrame:CGRectMake(15, 100, screenW-30, 350)];
    chartCell.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:chartCell];
    
    ChartView *chartView  = [[ChartView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(chartCell.frame), 300)];
    [chartCell addSubview:chartView];
    chartView.dataArray = @[@"100",@"30",@"65",@"30",@"0",@"10",@"80"];
    [chartView draw];
    chartView.clipsToBounds = YES;
    
    XaxisView *asxisView = [[XaxisView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(chartCell.frame)-50, CGRectGetWidth(chartCell.frame), 50)];
    asxisView.backgroundColor = [UIColor brownColor];
    [asxisView setupSubViews];
    [chartCell addSubview:asxisView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

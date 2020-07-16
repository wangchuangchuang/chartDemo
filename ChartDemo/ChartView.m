//
//  ChartView.m
//  ChartDemo
//
//  Created by 王创创 on 2020/3/6.
//  Copyright © 2020年 Wex. All rights reserved.
//

#import "ChartView.h"




@interface ChartView()

@property (nonatomic,assign)CGFloat maxValue;

@property (nonatomic,strong)NSMutableArray *dataStrokeArray;

@end

@implementation ChartView

- (CGRect)drawRect
{
    return CGRectMake(0, kTop, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)-kTop);
}

- (CGFloat)drawHeight
{
    return CGRectGetHeight(self.bounds)-kTop;
}

- (void)draw{
    CAShapeLayer *tableLayer = [CAShapeLayer layer];
    UIBezierPath *tablePath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
    tableLayer.path = tablePath.CGPath;
    tableLayer.strokeColor = [UIColor grayColor].CGColor;
    tableLayer.fillColor = [UIColor clearColor].CGColor;
    tableLayer.lineWidth =  1;
    [self.layer addSublayer:tableLayer];
    
    
    
    if (self.dataArray.count <= 0) {
        return;
    }
    
    [self calculateMaxValue];
    
    [self convertDataToAxisData];
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (NSDictionary *dict in self.dataStrokeArray) {
        NSValue *beginValue = dict[@"beginValue"];
        [path moveToPoint:beginValue.CGPointValue];
        NSValue *endValue = dict[@"endValue"];
        [path addLineToPoint:endValue.CGPointValue];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 40)];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor whiteColor];
        label.text = @"120";
        label.center = CGPointMake(beginValue.CGPointValue.x, beginValue.CGPointValue.y-20);
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = [self drawRect];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor greenColor].CGColor;
    shapeLayer.lineWidth = kLineW;
    [self.layer addSublayer:shapeLayer];
    shapeLayer.strokeStart = 0;
    shapeLayer.strokeEnd = 1;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    
    animation.duration = 3;
    animation.fromValue = @(1);
    animation.toValue = @(0);
    [shapeLayer addAnimation:animation forKey:@"12"];
    
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//       
//       
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//           
//        });
//    });
    
    
    
//    CATextLayer *textLayer = [CATextLayer layer];
//    textLayer.string = @"123";trdfxcake(10, 0, 50, 20);
//    textLayer.font = (__bridge CFTypeRef _Nullable)([UIFont systemFontOfSize:12])/  /;
//    [self.layer addSublayer:textLayer];
    
    
}

- (void)calculateMaxValue
{
    CGFloat maxValue = [self.dataArray.firstObject floatValue];
    
    for (NSString *temp in self.dataArray) {
        if ([temp floatValue] > maxValue) {
            maxValue = [temp floatValue];
        }
    }
    
    self.maxValue = maxValue;
}

- (void)convertDataToAxisData
{
    CGFloat x = kSpace+kLineW*0.5;
    for (NSString *dataStr in self.dataArray) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        CGFloat beginX = x;
        CGFloat beginY = (self.maxValue-[dataStr floatValue])/self.maxValue*[self drawHeight];
        CGPoint beginPoint = CGPointMake(beginX, beginY);
        
        NSValue *benginValue = [NSValue valueWithCGPoint:beginPoint];
        
        CGFloat endX = x;
        CGFloat endY = [self drawHeight];
        CGPoint endPoint = CGPointMake(endX, endY);
        NSValue *endValue = [NSValue valueWithCGPoint:endPoint];

        dict[@"beginValue"] = benginValue;
        dict[@"endValue"] = endValue;
        [self.dataStrokeArray addObject:dict];
        x += kSpace+kLineW;
    }
}

-(NSMutableArray *)dataStrokeArray
{
    if (!_dataStrokeArray) {
        _dataStrokeArray = @[].mutableCopy;
    }
    return _dataStrokeArray;
}



@end

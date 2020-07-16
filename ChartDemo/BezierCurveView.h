//
//  BezierCurveView.h
//  ChartDemo
//
//  Created by 王创创 on 2020/3/6.
//  Copyright © 2020年 Wex. All rights reserved.
//

#import <UIKit/UIKit.h>

#define XYQColor(r, g, b)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define XYQRandomColor  XYQColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define MARGIN            30   // 坐标轴与画布间距
#define Y_EVERY_MARGIN    20   // y轴每一个值的间隔数

@interface BezierCurveView : UIView
//初始化画布
+(instancetype)initWithFrame:(CGRect)frame;
/**
 *  画柱状图
 *  @param x_names      x轴值的所有值名称
 *  @param targetValues 所有目标值
 */
-(void)drawBarChartViewWithX_Value_Names:(NSMutableArray *)x_names TargetValues:(NSMutableArray *)targetValues;
@end

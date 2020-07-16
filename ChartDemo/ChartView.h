//
//  ChartView.h
//  ChartDemo
//
//  Created by 王创创 on 2020/3/6.
//  Copyright © 2020年 Wex. All rights reserved.
//

#import <UIKit/UIKit.h>

#define screenW  [UIScreen mainScreen].bounds.size.width
#define screenH  [UIScreen mainScreen].bounds.size.height

#define kLineW 20.0
#define kSpace (screenW-30-kLineW*7)/8
#define kTop 20.0

@interface ChartView : UIView

@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,strong)NSArray *colorArray;
@property (nonatomic,strong)NSArray *xAxisArray;


- (void)draw;
@end

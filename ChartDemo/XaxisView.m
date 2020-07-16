//
//  XaxisView.m
//  ChartDemo
//
//  Created by 王创创 on 2020/3/7.
//  Copyright © 2020年 Wex. All rights reserved.
//

#import "XaxisView.h"
#import "ChartView.h"

@implementation XaxisView

- (void)setupSubViews
{
    NSArray *titleArray = @[@"3%",@"14%",@"63%",@"11%",@"53%",@"6%",@"21%"];
    CGFloat x = kSpace +kLineW*0.5;
    CGFloat y = 20;
    for (NSString *title in titleArray) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 40)];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor whiteColor];
        label.text = title;
        label.center = CGPointMake(x, y);
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        x +=kSpace +kLineW;
    }
    
}

@end

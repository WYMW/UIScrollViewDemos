//
//  YMInfiniteScrollView.h
//  UIScrollViewDemo
//
//  Created by WangWei on 28/7/16.
//  Copyright © 2016年 BarryWang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YMInfiniteDelegate <NSObject>

- (void)didClickAtIndex:(NSUInteger) index;

@end

@interface YMInfiniteScrollView : UIView
@property (nonatomic, strong) NSArray *showData;
@property (nonatomic, assign) NSTimeInterval scrollTimerInteval; // Default is 2.5s
@property (nonatomic,  assign) id <YMInfiniteDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;
-(instancetype)initWithFrame:(CGRect)frame count:(NSInteger)count placeImage:(NSString *)image;
-(instancetype)initWithFrame:(CGRect)frame placeImage:(NSString *)image;
@end

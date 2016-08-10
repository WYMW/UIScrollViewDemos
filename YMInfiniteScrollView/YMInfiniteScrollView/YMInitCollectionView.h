//
//  YMInitCollectionView.h
//  YMInfiniteScrollView
//
//  Created by WangWei on 10/8/16.
//  Copyright © 2016年 BarryWang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YMInitCollectionView;


@protocol YMInfiniteDelegate <NSObject>
@end


@protocol YMInfiniteDataSource <NSObject>
-(NSInteger)collectionView:(YMInitCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;


@end


@interface YMInitCollectionView : UIView

@property (nonatomic, assign) id<YMInfiniteDelegate> delegate;
@property (nonatomic, assign) id<YMInfiniteDataSource> dataSource;

@end

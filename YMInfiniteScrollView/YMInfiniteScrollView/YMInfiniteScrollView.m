//
//  YMInfiniteScrollView.m
//  UIScrollViewDemo
//
//  Created by WangWei on 28/7/16.
//  Copyright © 2016年 BarryWang. All rights reserved.
//

#import "YMInfiniteScrollView.h"
#define kItemCount 3

@interface YMInfiniteScrollView()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *showScrollView;
@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) CGFloat itemHeight;
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *centerImageView;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, assign) NSUInteger currentShowIndex;
@end
@implementation YMInfiniteScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
   
    if (self = [super initWithFrame:frame]) {
        
        self.itemWidth = frame.size.width;
        self.itemHeight = frame.size.height;
        
        [self initUI];
        
        
    }
    
    return self;
}

- (void)initUI {
  
    [self addSubview:self.showScrollView];
    [self addImageViewToScrollView];
}

- (UIScrollView *)showScrollView {
  
    if (!_showScrollView) {
        
        _showScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _showScrollView.delegate = self;
        _showScrollView.contentSize = CGSizeMake(kItemCount * _itemWidth, 0);
        _showScrollView.contentOffset = CGPointMake(_itemWidth, 0);
        _showScrollView.pagingEnabled = YES;
        _showScrollView.showsHorizontalScrollIndicator = NO;
        _showScrollView.showsVerticalScrollIndicator = NO;
    }
    
    return _showScrollView;
}

- (void)addImageViewToScrollView {
  
    self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, _itemWidth, _itemHeight)];
    self.leftImageView.backgroundColor = [UIColor redColor];
    
    self.centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_itemWidth, 0, _itemWidth, _itemHeight)];
    self.centerImageView.backgroundColor = [UIColor greenColor];
    
    self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(2 * _itemWidth, 0, _itemWidth, _itemHeight)];
    self.rightImageView.backgroundColor = [UIColor blueColor];
    
    [_showScrollView addSubview:self.leftImageView];
    [_showScrollView addSubview:self.rightImageView];
    [_showScrollView addSubview:self.centerImageView];

}

- (void)setShowData:(NSArray *)showData {
   
    _showData = showData;
    self.currentShowIndex = 0;
    [self setImageWithCurrentIndex:0];
    
}

- (void)setImageWithCurrentIndex:(NSInteger)currentIndex {
  
    self.centerImageView.image = [UIImage imageNamed:self.showData[_currentShowIndex]];
    self.leftImageView.image = [UIImage imageNamed:self.showData[(_currentShowIndex - 1 + self.showData.count) % self.showData.count]];
    self.rightImageView.image = [UIImage imageNamed:self.showData[(_currentShowIndex + 1) % self.showData.count]];
    
}

- (void)reloadImages {
  
    CGFloat contentOffsetX = self.showScrollView.contentOffset.x;
    if (contentOffsetX > _itemWidth) {
        
        _currentShowIndex = (_currentShowIndex + 1) % self.showData.count;
        
    } else if (contentOffsetX < _itemWidth) {
        
        _currentShowIndex =(_currentShowIndex - 1 + self.showData.count) % self.showData.count;
        
    }
    [self setImageWithCurrentIndex:_currentShowIndex];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self reloadImages];

    [self.showScrollView setContentOffset:CGPointMake(_itemWidth, 0)];
}


@end

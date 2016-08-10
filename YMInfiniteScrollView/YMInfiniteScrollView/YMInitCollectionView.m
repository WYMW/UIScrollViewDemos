//
//  YMInitCollectionView.m
//  YMInfiniteScrollView
//
//  Created by WangWei on 10/8/16.
//  Copyright © 2016年 BarryWang. All rights reserved.
//

#import "YMInitCollectionView.h"
@interface YMInitCollectionView()<UICollectionViewDelegate, UICollectionViewDataSource, UIScrollViewDelegate>
@property (nonatomic, strong) NSArray *colors;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger currentIndex;
@end
@implementation YMInitCollectionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame {
  
    if (self = [super initWithFrame:frame]) {
        
    
        self.colors = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
        [self initCollectionView];
        
    }
    
    return self;
}

-(void)initCollectionView {

  
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = self.bounds.size;
    layout.minimumLineSpacing = 0;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self addSubview:collectionView];
    collectionView.pagingEnabled = YES;
    collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView = collectionView;
    [self.collectionView setContentOffset:CGPointMake(self.bounds.size.width, 0)];
    self.currentIndex = 0;
}




-(void)reloadData {
  
    [self.collectionView reloadData];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    NSInteger numbers = 0;

    
    if (self.dataSource) {
        [self.dataSource  collectionView:self numberOfItemsInSection:section ];
    }
    
    return numbers > 3 ? 3 : numbers;

}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = self.colors[indexPath.row];
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  
    [self.collectionView setContentOffset:CGPointMake(self.bounds.size.width, 0)];
    
}


@end

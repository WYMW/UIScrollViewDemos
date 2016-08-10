//
//  ViewController.m
//  YMInfiniteScrollView
//
//  Created by WangWei on 28/7/16.
//  Copyright © 2016年 BarryWang. All rights reserved.
//

#import "ViewController.h"
#import "YMInfiniteScrollView.h"
#import "YMInitCollectionView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    YMInfiniteScrollView *scrollView = [[YMInfiniteScrollView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 300)];
//    [self.view addSubview:scrollView];
//    scrollView.showData = @[@"1.png", @"2.png", @"3.png", @"4.png", @"5.png"];
    
    YMInitCollectionView *collectioView = [[YMInitCollectionView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, 300)];
    [self.view addSubview:collectioView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

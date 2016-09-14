//
//  HFScrollLayoutAgainViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/9.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFScrollLayoutAgainViewController.h"

@interface HFScrollLayoutAgainViewController ()
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIScrollView *scrolleView;


@end

@implementation HFScrollLayoutAgainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)setupUI{

    [self.view addSubview:self.scrolleView];
    [self.scrolleView addSubview:self.contentView];
    
    [self.scrolleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    /** 注意下面宽高必须设置   第二种方法是:相对于同一个父控件进行布局设置，也是没有问题的*/
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrolleView);
        make.size.equalTo(CGSizeMake(kScreenWidth, kScreenHeight));
    }];

}

- (UIScrollView *)scrolleView{
    if (!_scrolleView) {
        _scrolleView = [[UIScrollView alloc]init];
        _scrolleView.backgroundColor = [UIColor lightGrayColor];
        _scrolleView.pagingEnabled = NO;
        _scrolleView.bounces = YES;
    }
    return _scrolleView;
}

- (UIView *)contentView{
    if (!_contentView) {
        _contentView = [[UIView alloc]init];
        _contentView.backgroundColor = randomColor;
    }

    return _contentView;
}

@end

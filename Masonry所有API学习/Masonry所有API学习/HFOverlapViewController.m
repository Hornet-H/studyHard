//
//  HFOverlapViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/9.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFOverlapViewController.h"

@interface HFOverlapViewController ()
@property (strong, nonatomic) NSMutableArray *viewArr;
@property (assign, nonatomic) BOOL isTaped;


@end

@implementation HFOverlapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (void)configuration{

}

- (void)setupUI{

    UIView *lastView = self.view;
    for (int i = 0; i < 6; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = randomColor;
        view.layer.borderColor = UIColor.blackColor.CGColor;
        view.layer.borderWidth = 2;
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
        }];
        lastView = view;
        [self.viewArr addObject:view];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(userTapAction:)];
        [view addGestureRecognizer:tap];
    }
    self.isTaped = YES;
}


- (void)userTapAction:(UITapGestureRecognizer *)tap{
    
    UIView *lastView = self.view;
    if (self.isTaped) {
        for (NSInteger i = self.viewArr.count - 1;i >=0 ; --i ) {
            UIView *enumView = [self.viewArr objectAtIndex:i];
//            __weak typeof(self) weakSelf = self;
            [enumView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
            }];
            [self.view bringSubviewToFront:enumView];
            lastView = enumView;
        }
    }else{
            for (NSInteger i = 0; i < self.viewArr.count; ++i) {
                UIView *itemView = [self.viewArr objectAtIndex:i];
                [itemView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(lastView).insets(UIEdgeInsetsMake(20, 20, 20, 20));
                }];
                [self.view bringSubviewToFront:itemView];
                lastView = itemView;
            }
    }
    
    /** 重置约束，并重置动画*/
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.isTaped = !self.isTaped;
    }];

}

- (NSMutableArray *)viewArr{
    if (!_viewArr) {
        _viewArr = [NSMutableArray array];
    }
    return _viewArr;
}
@end

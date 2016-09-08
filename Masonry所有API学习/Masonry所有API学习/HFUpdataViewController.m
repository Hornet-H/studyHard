//
//  HFUpdataViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFUpdataViewController.h"

@interface HFUpdataViewController ()
@property (nonatomic, strong) UIButton *growingButton;
@property (nonatomic, assign) CGFloat scacle;
@end

@implementation HFUpdataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)setupUI{
    [self.view addSubview:self.growingButton];
    self.scacle = 1.0;
    [self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        
        // 初始宽、高为100，优先级最低
        make.width.height.mas_equalTo(100 * self.scacle).priorityLow();
        // 最大放大到整个view
        make.width.height.lessThanOrEqualTo(self.view);
    }];
}
- (void)updateViewConstraints {
    [self.growingButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        
        // 初始宽、高为100，优先级最低
        make.width.height.mas_equalTo(100 * self.scacle).priorityLow();
        // 最大放大到整个view
        make.width.height.lessThanOrEqualTo(self.view);
    }];
    
    [super updateViewConstraints];
}

- (void)onGrowButtonTaped:(UIButton* )sender{
    self.scacle += 0.2;
    
    // 告诉self.view约束需要更新
    [self.view setNeedsUpdateConstraints];
    // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    [self.view updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];

}
- (UIButton *)growingButton{
    if (!_growingButton) {
        _growingButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_growingButton setTitle:@"点我放大" forState:UIControlStateNormal];
        _growingButton.layer.borderColor = UIColor.greenColor.CGColor;
        _growingButton.layer.borderWidth = 3;
        [_growingButton addTarget:self action:@selector(onGrowButtonTaped:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _growingButton;
}

@end

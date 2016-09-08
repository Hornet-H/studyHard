//
//  HFRemarkViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFRemarkViewController.h"

@interface HFRemarkViewController ()
@property (strong, nonatomic) UIButton *expandButton;
@property (assign, nonatomic) BOOL isExpand;



@end

@implementation HFRemarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

- (void)setupUI{
    
    [self.view addSubview:self.expandButton];
    [self.expandButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.leading.equalTo(self.view);
        make.width.equalTo(kScreenWidth);
        make.height.equalTo(kScreenHeight/2 - 64);
    }];
}
- (void)configuration{
    self.isExpand = NO;
    
    
}


- (void)updateViewConstraints{
    [super updateViewConstraints];
    __weak typeof(self) weakSelf = self;
    [self.expandButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view);
        make.leading.equalTo(weakSelf.view);
        make.width.equalTo(kScreenWidth);
        if (weakSelf.isExpand) {
             make.height.equalTo(kScreenHeight);
        }else{
            make.height.equalTo(kScreenHeight/2 - 64);
        
        }
    }];

}


- (void)expandAction:(UIButton *)sender{
    self.isExpand = !self.isExpand;
    if (self.isExpand) {
       
        [self.expandButton setTitle:@"点我收起" forState:UIControlStateNormal];
        
    }else{
        
       
        [self.expandButton setTitle:@"点我展开" forState:UIControlStateNormal];
        
    }
    
    /** 告诉控件需要跟新约束*/
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
//    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
//        [self.view layoutIfNeeded];
//    } completion:nil];
//    * 附带弹簧效果
    [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:0 animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
    
    
}


- (UIButton *)expandButton{
    if (!_expandButton) {
        _expandButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_expandButton setBackgroundColor:UIColor.orangeColor];
        [_expandButton setTitle:@"点击展开" forState:UIControlStateNormal];
        _expandButton.layer.borderColor = UIColor.redColor.CGColor;
        _expandButton.layer.borderWidth = 3;
        [_expandButton addTarget:self action:@selector(expandAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _expandButton;
}
@end

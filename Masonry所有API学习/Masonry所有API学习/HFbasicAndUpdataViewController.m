//
//  HFbasicAndUpdataViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFbasicAndUpdataViewController.h"

@interface HFbasicAndUpdataViewController ()
@property (strong, nonatomic) UIView *orangeView;
@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UILabel *textLabel;

@property (assign, nonatomic) BOOL isExpand;


@end

@implementation HFbasicAndUpdataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

-(void)setupUI{

    [self.view addSubview:self.redView];
    [self.view addSubview:self.orangeView];
    [self.redView addSubview:self.textLabel];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.redView).offset(-20);
        make.width.equalTo(self.redView).offset( -20);
        make.centerX.equalTo(self.redView);
    }];
    [self updateViewConstraintsIsExpand:NO isAnimate:NO];

}

- (void)updateViewConstraintsIsExpand:(BOOL)isExpand isAnimate:(BOOL)animate{
    self.isExpand = isExpand;
    [self.redView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        if (isExpand) {
            make.bottom.mas_equalTo(-20);
        } else {
            make.bottom.mas_equalTo(-300);
        }
    }];
    [self.orangeView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.redView);
        
        // 这里使用优先级处理
        // 设置其最大值为250，最小值为90
        if (!isExpand) {
            make.width.height.mas_equalTo(100 * 0.5).priorityLow();
        } else {
            make.width.height.mas_equalTo(100 * 3).priorityLow();
        }
        
        // 最大值为250
        make.width.height.lessThanOrEqualTo(250);
        
        // 最小值为90
        make.width.height.greaterThanOrEqualTo(90);
    }];
    if (animate) {
        [self.view setNeedsUpdateConstraints];
        [self.view updateConstraintsIfNeeded];
        [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            [self.view layoutIfNeeded];
        } completion:nil];
    }
}
- (void)tapGestureAction:(UITapGestureRecognizer *)tap{
    [self updateViewConstraintsIsExpand:!self.isExpand isAnimate:YES];

}
- (UIView *)redView{
    if (!_redView) {
        _redView = [[UIView alloc]init];
        _redView.backgroundColor = UIColor.redColor;
        _redView.layer.borderWidth = 2;
        _redView.layer.borderColor = UIColor.blackColor.CGColor;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction:)];
        [_redView addGestureRecognizer:tapGesture];
        
    }

    return _redView;
}
- (UIView *)orangeView{
    if (!_orangeView) {
        _orangeView = [[UIView alloc]init];
        _orangeView.backgroundColor = UIColor.orangeColor;
        _orangeView.layer.borderWidth = 2;
        _orangeView.layer.borderColor = UIColor.blackColor.CGColor;
        
    }
    return _orangeView;
}
-(UILabel *)textLabel{
    if (!_textLabel) {
        _textLabel = [[UILabel alloc]init];
        _textLabel.text = @"天行健，君子以厚德载物；地势坤，君子以自强不息";
        _textLabel.textColor = UIColor.darkGrayColor;
        _textLabel.font = [UIFont systemFontOfSize:25];
        _textLabel.numberOfLines = 0;
    }

    return _textLabel;
}
@end

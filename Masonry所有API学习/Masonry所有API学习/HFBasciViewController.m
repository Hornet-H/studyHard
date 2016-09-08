//
//  HFBasciViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFBasciViewController.h"

@interface HFBasciViewController ()
@property (strong, nonatomic) UIView *equalHeightcontainView;
@property (strong, nonatomic) UIView *equalWidthcontainView;
@end

@implementation HFBasciViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (void)setupUI{
    [self.view addSubview:self.equalHeightcontainView];
    [self.equalHeightcontainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.equalTo(kScreenHeight/2);
    }];
    
    [self configurationEqualHeightcontainView];
    
    
    [self.view addSubview:self.equalWidthcontainView];
    [self.equalWidthcontainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.equalHeightcontainView.mas_bottom);
        make.leading.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    [self configurationEqualWidthcontainView];
    
    
}
- (void)configurationEqualHeightcontainView{
    
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self.equalHeightcontainView addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self.equalHeightcontainView addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self.equalHeightcontainView addSubview:blueView];
    
    // 使这三个控件等高
    CGFloat padding = 10;
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.equalHeightcontainView).offset(padding);
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(redView.mas_left).offset(-padding);
        make.bottom.mas_equalTo(blueView.mas_top).offset(-padding);
        /** 使用数组的方式确定三个控件等高*/
        make.height.mas_equalTo(@[redView, blueView]);
        // 红、绿这两个控件等高
        make.width.mas_equalTo(redView);
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(greenView);
        make.right.mas_equalTo(-padding);
        make.left.mas_equalTo(greenView.mas_right).offset(padding);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        //    make.height.mas_equalTo(greenView);
        make.bottom.mas_equalTo(self.equalHeightcontainView).offset(-padding);
        make.left.mas_equalTo(padding);
        make.right.mas_equalTo(-padding);
    }];



}


- (void)configurationEqualWidthcontainView{
    UIView *greenView = UIView.new;
    greenView.backgroundColor = randomColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self.equalWidthcontainView addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = randomColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self.equalWidthcontainView addSubview:redView];
    
    UIView *blueView = UIView.new;
    blueView.backgroundColor = randomColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self.equalWidthcontainView addSubview:blueView];

    CGFloat padding = 10;
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.equalWidthcontainView).offset(padding);
        make.bottom.equalTo(self.equalWidthcontainView.mas_bottom).offset(-padding);
        make.left.equalTo(padding);
        /** 使用数组的方式确定三个控件等高*/
        make.width.mas_equalTo(@[redView, blueView]);
        make.right.equalTo(redView.mas_left).offset(- padding);
       
     
    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(greenView);
        make.right.equalTo(blueView.mas_left).offset(-padding);
        make.left.equalTo(greenView.mas_right).offset(padding);
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(greenView);
        make.left.equalTo(redView.mas_right).offset(padding);
        make.right.mas_equalTo(-padding);
        
    }];


}

- (UIView *)equalHeightcontainView{
    if (!_equalHeightcontainView) {
       _equalHeightcontainView = [[UIView alloc]init];
    }
    return _equalHeightcontainView;
}
- (UIView *)equalWidthcontainView{
    if (!_equalWidthcontainView) {
        _equalWidthcontainView = [[UIView alloc]init];
    }
    return _equalWidthcontainView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}


@end

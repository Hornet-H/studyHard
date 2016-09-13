//
//  HFMultipliedByViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/9.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFMultipliedByViewController.h"

@interface HFMultipliedByViewController ()

@end

@implementation HFMultipliedByViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)configuration{


}

- (void)setupUI{

    UIView * redView = [[UIView alloc]init];
    redView.backgroundColor =[UIColor redColor];
    [self.view addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.equalTo(kScreenHeight/2);
    }];
    
    UIView *greenView = [[UIView alloc]init];
    greenView.backgroundColor =[UIColor greenColor];
    [self.view addSubview:greenView];
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(redView);
        make.width.equalTo(redView.mas_height).multipliedBy(0.9);
        make.centerX.equalTo(redView);
    }];

}


@end

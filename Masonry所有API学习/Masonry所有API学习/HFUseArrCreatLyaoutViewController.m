//
//  HFUseArrCreatLyaoutViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFUseArrCreatLyaoutViewController.h"

@interface HFUseArrCreatLyaoutViewController ()
@property (strong, nonatomic) NSArray *testArr;
@property (strong, nonatomic) NSArray *testArr2;

@end

@implementation HFUseArrCreatLyaoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)configuration{


}
- (void)setupUI{
    [self axisTypeVertical];
    [self axisTypeHorizontal];
    
}
- (void)axisTypeHorizontal{
    UIView * containView = [[UIView alloc]init];
    containView.backgroundColor = [UIColor redColor];
    [self.view addSubview:containView];
    [containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(100);
        make.leading.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
    }];
    
    NSMutableArray *btnArr = [NSMutableArray array];
    for (NSInteger i = 0; i <
         self.testArr2.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.backgroundColor = randomColor;
        [btn setTitle:self.testArr2[i] forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:20];
        [containView addSubview:btn];
        [btnArr addObject:btn];
    }
    
    [btnArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:5 leadSpacing:10 tailSpacing:10];
    [btnArr mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(10);
                make.bottom.mas_equalTo(-10);
        make.height.equalTo(80);
    }];
}



/** 以数组的方式竖向排序*/
- (void)axisTypeVertical{
    NSMutableArray *btnArr = [NSMutableArray array];
    for (NSInteger i = 0; i < self.testArr.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        btn.backgroundColor = randomColor;
        [btn setTitle:self.testArr[i] forState:UIControlStateNormal];
        
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:20];
        [self.view addSubview:btn];
        [btnArr addObject:btn];
    }
    
    [btnArr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:30 leadSpacing:100 tailSpacing:200];
    [btnArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
    }];
}

- (NSArray *)testArr2{
    if (!_testArr2) {
        _testArr2 = [NSArray array];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (int i = 0; i < 4; i ++) {
            NSString *str = [NSString stringWithFormat:@"黄蜂%d",i];
            [tempArr addObject:str];
        }
        _testArr2 = tempArr;
        
    }
    return _testArr2;
}
- (NSArray *)testArr{
    if (!_testArr) {
        _testArr = [NSMutableArray array];
        _testArr = @[@"未按规定时间提供服务", @"未完成<服务标准>中的全部内容", @"态度差,不专业", @"多拍,错拍", @"协商一致退款", @"其他"];
    }
    return _testArr;


}
@end

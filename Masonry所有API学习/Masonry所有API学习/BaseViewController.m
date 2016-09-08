//
//  BaseViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (instancetype)initWithTitle:(NSString *)title{
    if (self = [super init]) {
        self.title = title;
            }
    return self;
}
-(void)configuration{


}

- (void)setupUI{



}
- (void)viewDidLoad{
    
    if (kIOSVersion >= 7.0) {
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self configuration];
    [self setupUI];


}
@end

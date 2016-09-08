//
//  BaseViewController.h
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
- (instancetype)initWithTitle:(NSString *)title;
-(void)configuration;
- (void)setupUI;
@end

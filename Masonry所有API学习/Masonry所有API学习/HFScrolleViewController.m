//
//  HFScrolleViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/9.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFScrolleViewController.h"

@interface HFScrolleViewController ()
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation HFScrolleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)configuration{
   
}

- (void)setupUI{
    [self.view addSubview:self.scrollView];
    UILabel *lastLabel = nil;
    for (int i = 0; i< 20; i ++) {
        UILabel *label = [[UILabel alloc]init];
        label.text = [self randomLongText];
        label.font = [UIFont systemFontOfSize:26];
        lastLabel.numberOfLines = 0;
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor redColor];
        label.layer.borderColor = [UIColor greenColor].CGColor;
        label.layer.borderWidth = 2.0;
        label.preferredMaxLayoutWidth = kScreenWidth - 30;
        label.textAlignment = NSTextAlignmentLeft;
        [self.scrollView addSubview:label];
//        if (!lastLabel) {
//            [label mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self.scrollView.mas_top).offset(15);
//                make.leading.equalTo(self.scrollView.mas_leading).offset(15);
//                make.trailing.equalTo(self.scrollView.mas_trailing).offset(-15);
//            }];
//            lastLabel = label;
//        }else{
//            [label mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(label.mas_bottom).offset(15);
//                make.leading.equalTo(self.scrollView.mas_leading).offset(15);
//                make.trailing.equalTo(self.scrollView.mas_trailing).offset(-15);
//            }];
//            lastLabel = label;
//        }
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
             make.leading.equalTo(self.view).offset(15);
             make.trailing.equalTo(self.view).offset(-15);
            if (!lastLabel) {
                make.top.equalTo(self.scrollView.mas_top).offset(15);
            }else{
             make.top.mas_equalTo(lastLabel.mas_bottom).offset(15);
            }
            
        }];
        lastLabel = label;
        
    }
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.bottom.equalTo(lastLabel.mas_bottom).offset(15);
        
    }];
    

}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.pagingEnabled = NO;
        _scrollView.bounces = NO;
        _scrollView.backgroundColor = UIColor.lightGrayColor;
        
    }
    return _scrollView;
}

- (NSString *)randomLongText{
    CGFloat length = arc4random() % 50 + 5;
    NSMutableString *string = [NSMutableString string];
    for (NSUInteger i = 0; i < length; ++i ) {
        [string appendString:@"致敬标哥"];
    }
    return string;
}


@end

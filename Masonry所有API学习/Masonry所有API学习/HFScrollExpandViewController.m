//
//  HFScrollExpandViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/9.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFScrollExpandViewController.h"

@interface HFScrollExpandViewController ()
@property (strong, nonatomic) NSMutableArray *expandStates;
@property (strong, nonatomic) UIScrollView *scrollView;

@end

@implementation HFScrollExpandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
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
        label.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        [label addGestureRecognizer:tapRecognizer];
        [self.scrollView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.leading.equalTo(self.view).offset(15);
            make.trailing.equalTo(self.view).offset(-15);
            if (!lastLabel) {
                make.top.equalTo(self.scrollView.mas_top).offset(15);
            }else{
                make.top.mas_equalTo(lastLabel.mas_bottom).offset(15);
            }
            make.height.equalTo(40);
        }];
        lastLabel = label;
        [self.expandStates addObject:[@[label, @(NO)] mutableCopy]];

    }
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.bottom.equalTo(lastLabel.mas_bottom).offset(15);
        
    }];
    
    
}

- (void)tapAction:(UITapGestureRecognizer *)tap{

    UIView *tapView = tap.view;
    NSUInteger index = 0;
    for (NSMutableArray *array in self.expandStates) {
        /** 去取数组中存的label对象*/
        UILabel *view= [array firstObject];
        if (view == tapView) {
            NSNumber *state = [array lastObject];
            /** 如果当前是展示开状态就收缩*/
            if ([state boolValue] == YES) {
                [view mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(40);
                }];
            }else{
                UIView *preView = nil;
                UIView *nextView = nil;
                if (index - 1 < self.expandStates.count && index >= 1) {
                    preView = [[self.expandStates objectAtIndex:index - 1] firstObject];
                }
                if (index + 1 < self.expandStates.count) {
                    nextView = [[self.expandStates objectAtIndex:index + 1] firstObject];
                }
                [view mas_remakeConstraints:^(MASConstraintMaker *make) {
                    
                    if (preView) {
                        make.top.equalTo(preView.mas_bottom).offset(20);
                    }else{
                        make.top.equalTo(20);
                    }
                    make.left.equalTo(15);
                    make.right.equalTo(self.view).offset(-15);
                    
                }];
                if (nextView) {
                    [nextView mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.top.equalTo(view.mas_bottom).offset(15);
                    }];
                }
            }
            [array replaceObjectAtIndex:1 withObject:@(!state.boolValue )];
            /** 重置完约束之后需要进行下面这几步来更新约束*/
            [self.view setNeedsUpdateConstraints];
            [self.view updateConstraintsIfNeeded];
            /** 设置动画效果*/
            [UIView animateWithDuration:0.3 delay:0 options:0 animations:^{
                [self.view layoutIfNeeded];
            } completion:^(BOOL finished) {
            
            }];
            break;
        }
        index ++;
    }
}
- (NSMutableArray *)expandStates {
    if (_expandStates == nil) {
        _expandStates = [[NSMutableArray alloc] init];
    }
    
    return _expandStates;
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


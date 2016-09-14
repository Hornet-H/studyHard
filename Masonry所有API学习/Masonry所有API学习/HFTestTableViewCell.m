//
//  HFTestTableViewCell.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/13.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFTestTableViewCell.h"
#import "HFTestModel.h"
@interface HFTestTableViewCell ()

@property (nonatomic, strong) UILabel *lineLabel;
@property (nonatomic, strong) HFTestModel *model;


@end

@implementation HFTestTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.backgroundColor = [UIColor greenColor];
        imgView.layer.cornerRadius = 35;
        imgView.layer.borderColor = [UIColor redColor].CGColor;
        imgView.layer.borderWidth = 1.0;
        [self.contentView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.size.mas_equalTo(CGSizeMake(70, 70));
            make.top.mas_equalTo(15);
        }];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        // 兼容6.0
        self.titleLabel.preferredMaxLayoutWidth = w - 100 - 15;
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imgView.mas_right).offset(15);
            make.right.mas_equalTo(self.contentView).offset(-15);
            make.top.mas_equalTo(imgView);
        }];
        
        self.descLabel = [[UILabel alloc] init];
        self.descLabel.textColor = [UIColor blackColor];
        self.descLabel.font = [UIFont systemFontOfSize:13];
        self.descLabel.numberOfLines = 0;
        self.descLabel.textAlignment = NSTextAlignmentLeft;
        /** 兼容6.0*/
        self.descLabel.preferredMaxLayoutWidth = w - 100 - 15;
        [self.contentView addSubview:self.descLabel];
        [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imgView.mas_right).offset(15);
            make.right.mas_equalTo(self.contentView).offset(-15);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
        }];
        /** 如果是Lable用户交互一定要打开，否则手势无效*/
        self.descLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)];
        [self.descLabel addGestureRecognizer:tap];
        
        UILabel *lineLabel = [[UILabel alloc] init];
        lineLabel.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:lineLabel];
        [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.descLabel.mas_bottom).offset(19.5);
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
        self.lineLabel = lineLabel;
    }
    
    return self;
}

- (void)configCellWithModel:(HFTestModel *)model {
    self.model = model;
    self.titleLabel.text = model.title;
    self.descLabel.text = model.desc;
    /** 根据当前的cell是展开还是没有展开来进行约束的重置----这种思想比较好相当于剥离的逻辑，和常用的订单状态判断相类似*/
    if (model.isExpanded) {
        [self.descLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel);
            make.right.mas_equalTo(self.titleLabel);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
        }];
    } else {
        [self.descLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel);
            make.right.mas_equalTo(self.titleLabel);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
            make.height.mas_equalTo(40);
        }];
    }
}

- (void)onTap {
    self.model.isExpanded = !self.model.isExpanded;
    /** 这里只是吧indexPath传了出去*/
    if (self.block) {
        self.block(self.indexPath);
    }
    /** 下面这三句话可以不用加，个人感觉没什么效果，因为在controller里面对对应的cell进行了刷新操作*/
    [self configCellWithModel:self.model];
    [self.contentView setNeedsUpdateConstraints];
    [self.contentView updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:0.15 animations:^{
        [self.contentView layoutIfNeeded];
    }];
}

+ (CGFloat)heightWithModel:(HFTestModel *)model {
    HFTestTableViewCell *cell = [[HFTestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
    [cell configCellWithModel:model];
    
    [cell layoutIfNeeded];
    
    CGRect frame =  cell.descLabel.frame;
    return frame.origin.y + frame.size.height + 20;
}

@end

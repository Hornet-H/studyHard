//
//  HFTestTableViewCell.h
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/13.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HFTestModel;
typedef void (^TestBlock)(NSIndexPath *indexPath);

@interface HFTestTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descLabel;
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, copy) TestBlock block;

- (void)configCellWithModel:(HFTestModel *)model;

+ (CGFloat)heightWithModel:(HFTestModel *)model;

@end

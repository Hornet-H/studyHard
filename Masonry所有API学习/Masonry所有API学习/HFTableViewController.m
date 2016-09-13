//
//  HFTableViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/13.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "HFTableViewController.h"
#import "HFTestModel.h"
#import "HFTestTableViewCell.h"

@interface HFTableViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *datasourceArr;



@end

@implementation HFTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)setupUI{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 
    static NSString *cellID = @"cellID";
    
    HFTestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.indexPath = indexPath;
    cell.block = ^(NSIndexPath *path) {
        [tableView reloadRowsAtIndexPaths:@[path] withRowAnimation:UITableViewRowAnimationFade];
    };
    HFTestModel *model = [self.datasourceArr objectAtIndex:indexPath.row];
    [cell configCellWithModel:model];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.datasourceArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HFTestModel *model = [self.datasourceArr objectAtIndex:indexPath.row];
    
    return [HFTestTableViewCell heightWithModel:model];
}


- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerClass:[HFTestTableViewCell class] forCellReuseIdentifier:@"cellID"];
    }
    return _tableView;
}


- (NSMutableArray *)datasourceArr{
    if (!_datasourceArr) {
        _datasourceArr = [NSMutableArray array];
        for (int i = 0; i < 10; i ++) {
            HFTestModel *model = [[HFTestModel alloc]init];
            model.title = [NSString stringWithFormat:@"测试标题你懂得（%d）",i];
            model.desc = [self randomLongText];
            [_datasourceArr addObject:model];
        }
    }
    return _datasourceArr;
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

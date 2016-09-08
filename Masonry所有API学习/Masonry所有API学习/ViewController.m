//
//  ViewController.m
//  Masonry所有API学习
//
//  Created by 黄来峰 on 16/9/8.
//  Copyright © 2016年 dahuangfeng. All rights reserved.
//

#import "ViewController.h"
#import "HFBasciViewController.h"
#import "HFUpdataViewController.h"
#import "HFUseArrCreatLyaoutViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *controllerArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)configuration{
    self.controllerArr = @[
                           [[HFBasciViewController alloc] initWithTitle:@"基础使用"],
                           [[HFUpdataViewController alloc] initWithTitle:@"动画更新约束"],
                           [[HFUseArrCreatLyaoutViewController alloc] initWithTitle:@"数组形式设置约束"],
//                           [[RemakeContraintsController alloc] initWithTitle:@"动画重新添加约束"],
//                           [[TotalUpdateController alloc] initWithTitle:@"整体动画更新约束"],
//                           [[CompositeController alloc] initWithTitle:@"复合view循环约束"],
//                           [[AspectFitController alloc] initWithTitle:@"约束百分比"],
//                           [[BasicAnimatedController alloc] initWithTitle:@"基本动画"],
//                           [[ScrollViewController alloc] initWithTitle:@"ScrollView布局"],
//                           [[ScrollViewComplexController alloc] initWithTitle:@"复杂ScrollView"],
//                           [[TableViewController alloc] initWithTitle:@"tableview布局"],
//                           [[HeaderFooterViewController alloc] initWithTitle:@"header/footer layout"],
                           ];
    
}
- (void)setupUI{
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *kCellIdentifier = @"kCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    UIViewController *viewController = self.controllerArr[indexPath.row];
    cell.textLabel.text = viewController.title;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return self.controllerArr.count;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *viewController = self.controllerArr[indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"kCellIdentifier"];
        
    }
    
    return _tableView;
}
@end

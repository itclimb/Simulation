//
//  ViewController.m
//  Simulation
//
//  Created by itclimb on 12/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import "ViewController.h"
#import "JJModel.h"
#import "JJDemoController.h"

@interface ViewController ()

@property(nonatomic, strong) NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基础仿真";
    UIView *footerView = [UIView new];
    self.tableView.tableFooterView = footerView;
}

//MARK: - UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.separatorInset = UIEdgeInsetsZero;
    JJModel *model = self.datas[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    JJModel *model = self.datas[indexPath.row];
    JJDemoController *demoVc = [[JJDemoController alloc] init];
    demoVc.funcType = (int)indexPath.row;
    demoVc.navigationItem.title = model.title;
    [self.navigationController pushViewController:demoVc animated:YES];
}

//MARK: - lazy load
- (NSArray *)datas{
    if (_datas == nil) {
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"datas.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:dictArr.count];
        [dictArr enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            JJModel *model = [JJModel modelWithDict:obj];
            [arrM addObject:model];
        }];
        _datas = arrM.copy;
    }
    return _datas;
}

@end

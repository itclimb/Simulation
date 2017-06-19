//
//  JJProfileController.m
//  Simulation
//
//  Created by itclimb on 19/06/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import "JJProfileController.h"
#import "JJMarbleController.h"

@interface JJProfileController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *datas;

@end

@implementation JJProfileController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"仿真应用";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

//MARK: - UITableViewDataSource & UITabViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JJProfileCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier"];
//    cell.nickname = self.datas[indexPath.row];
    cell.nickname.text = self.datas[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            JJMarbleController *vc = [[JJMarbleController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
}

//MARK: - lazy load
- (UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStylePlain];
        [_tableView registerClass:[JJProfileCell class] forCellReuseIdentifier:@"Identifier"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = 80;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (NSArray *)datas{
    if (!_datas) {
        _datas = @[
                   @"模仿MOBIKE"
                   ];
    }
    return _datas;
}


@end

#pragma mark - JJProfileCell

@implementation JJProfileCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nickname = [[UILabel alloc] init];
        self.nickname.textAlignment = NSTextAlignmentCenter;
        self.nickname.textColor = [UIColor whiteColor];
        self.nickname.font = [UIFont systemFontOfSize:21.0];
        self.nickname.layer.masksToBounds = YES;
        self.nickname.layer.cornerRadius = 6;
        self.nickname.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/256.0 green:arc4random_uniform(256)/256.0 blue:arc4random_uniform(256)/256.0 alpha:1.0];
        
        [self.contentView addSubview:self.nickname];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat nickname_w = 222;
    CGFloat nickname_h = 40;
    CGFloat nickname_x = (self.contentView.bounds.size.width - nickname_w)/2;
    CGFloat nickname_y = (self.contentView.bounds.size.height - nickname_h)/2;
    self.nickname.frame = CGRectMake(nickname_x, nickname_y, nickname_w, nickname_h);
}

@end

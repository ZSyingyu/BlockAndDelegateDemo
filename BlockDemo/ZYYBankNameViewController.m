//
//  ZYYBankNameViewController.m
//  ReorganizeFramework
//
//  Created by liguo.chen on 16/10/18.
//  Copyright © 2016年 Slience. All rights reserved.
//

#import "ZYYBankNameViewController.h"

//屏幕宽
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕高
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ZYYBankNameViewController ()
@property(copy,nonatomic)bankNameBlock block;
@property(strong,nonatomic)UITableView *tableView;

@end

@implementation ZYYBankNameViewController

-(instancetype)initWithBankNameBlock:(bankNameBlock)block {
    if (self == [super init]) {
        _block = block;
    }
    return self;
}

-(NSArray *)bankArr {
    if (!_bankArr) {
        _bankArr = @[@{@"北京银行":@"313003"},@{@"光大银行":@"303"},@{@"广发银行":@"306"},@{@"建设银行":@"105"},@{@"交通银行":@"301"},@{@"民生银行":@"305"},@{@"农业银行":@"103"},@{@"平安银行":@"307"},@{@"浦发银行":@"310"},@{@"邮政储蓄银行":@"403"},@{@"招商银行":@"308"},@{@"中国工商银行":@"102"},@{@"中国银行":@"104"},@{@"中信银行":@"302"},@{@"上海银行":@"313062"},@{@"杭州银行":@"313027"}];
    }
    return _bankArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

#pragma mark - tableViewDelegate and tableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.bankArr.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    cell.textLabel.text = [[self.bankArr[indexPath.row] allKeys] firstObject];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //block回传值方法
    //    NSDictionary *dic = self.bankArr[indexPath.row];
    //    NSString *name = [[dic allKeys] firstObject];
    //    NSString *code = [[dic allValues] firstObject];
    //    if (_block) {
    //        _block(code,name);
    //    }
    //    [self.navigationController popViewControllerAnimated:YES];
    
    //delegate回传值方法
    NSDictionary *dic = self.bankArr[indexPath.row];
    NSString *name = [[dic allKeys] firstObject];
    NSString *code = [[dic allValues] firstObject];
    
    [self.delegate popViewCode:code WithName:name];
    [self.navigationController popViewControllerAnimated:YES];
    
}





@end

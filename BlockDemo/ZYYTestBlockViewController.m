//
//  ZYYTestBlockViewController.m
//  ReorganizeFramework
//
//  Created by liguo.chen on 16/10/18.
//  Copyright © 2016年 Slience. All rights reserved.
//

#import "ZYYTestBlockViewController.h"
#import "ZYYBankNameViewController.h"

//屏幕宽
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕高
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ZYYTestBlockViewController ()<BankNameDelegate>
@property(strong,nonatomic)UIButton *bankNameBtn;

@end

@implementation ZYYTestBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *bankNameBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 50, SCREEN_WIDTH - 40, 50)];
    [bankNameBtn setBackgroundColor:[UIColor cyanColor]];
    [bankNameBtn setTitle:@"请选择银行名称" forState:UIControlStateNormal];
    [bankNameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [[bankNameBtn titleLabel] setFont:[UIFont systemFontOfSize:20]];
    [bankNameBtn addTarget:self action:@selector(bankNameAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bankNameBtn];
    self.bankNameBtn = bankNameBtn;
    
}

-(void)bankNameAction {
    //block回传值
    //    ZYYBankNameViewController *bankNameVc = [[ZYYBankNameViewController alloc] initWithBankNameBlock:^(NSString *code, NSString *name) {
    //        NSLog(@"code:%@",code);
    //        NSLog(@"name:%@",name);
    //        NSString *nameCode = [NSString stringWithFormat:@"%@%@",name,code];
    //        [self.bankNameBtn setTitle:nameCode forState:UIControlStateNormal];
    //    }];
    //    [self.navigationController pushViewController:bankNameVc animated:YES];
    
    //delegate回传值
    ZYYBankNameViewController *bankNameVc = [[ZYYBankNameViewController alloc] init];
    bankNameVc.delegate = self;
    [self.navigationController pushViewController:bankNameVc animated:YES];
    
}

#pragma mark - BankNameDelegate
-(void)popViewCode:(NSString *)code WithName:(NSString *)name {
    NSLog(@"code:%@",code);
    NSLog(@"name:%@",name);
    NSString *nameCode = [NSString stringWithFormat:@"%@%@",name,code];
    [self.bankNameBtn setTitle:nameCode forState:UIControlStateNormal];
    
}
@end

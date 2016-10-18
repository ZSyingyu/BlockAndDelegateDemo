//
//  ViewController.m
//  BlockDemo
//
//  Created by liguo.chen on 16/10/18.
//  Copyright © 2016年 Slience. All rights reserved.
//

#import "ViewController.h"
#import "ZYYTestBlockViewController.h"

//屏幕宽
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//屏幕高
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"blockdemo";
    self.navigationController.navigationBar.barTintColor = [UIColor purpleColor];
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19],
       NSForegroundColorAttributeName:[UIColor redColor]}];
    
    UIButton *testBlockBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH - 30, 40)];
    [testBlockBtn setBackgroundColor:[UIColor purpleColor]];
    [testBlockBtn setTitle:@"练习block" forState:UIControlStateNormal];
    [testBlockBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [testBlockBtn addTarget:self action:@selector(testBlockAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBlockBtn];
    
    UIButton *testDelegateBtn = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(testBlockBtn.frame) + 20, SCREEN_WIDTH - 30, 40)];
    [testDelegateBtn setBackgroundColor:[UIColor purpleColor]];
    [testDelegateBtn setTitle:@"测试delegate传值" forState:UIControlStateNormal];
    [testDelegateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [testDelegateBtn addTarget:self action:@selector(testDelegateAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testDelegateBtn];
    
}

-(void)testBlockAction {
    NSLog(@"练习block");
    ZYYTestBlockViewController *testVc = [[ZYYTestBlockViewController alloc] init];
    testVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:testVc animated:YES];
}

-(void)testDelegateAction {
    NSLog(@"测试delegate传值");
    ZYYTestBlockViewController *testVc = [[ZYYTestBlockViewController alloc] init];
    testVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:testVc animated:YES];
}

@end

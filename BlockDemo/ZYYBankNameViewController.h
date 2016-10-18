//
//  ZYYBankNameViewController.h
//  ReorganizeFramework
//
//  Created by liguo.chen on 16/10/18.
//  Copyright © 2016年 Slience. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^bankNameBlock)(NSString *code,NSString *name);//block

@protocol BankNameDelegate <NSObject>//代理

-(void)popViewCode:(NSString *)code WithName:(NSString *)name;

@end

@interface ZYYBankNameViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

-(instancetype)initWithBankNameBlock:(bankNameBlock)block;
@property(strong,nonatomic)NSArray *bankArr;

@property(nonatomic, weak)id<BankNameDelegate> delegate;//声明代理

@end

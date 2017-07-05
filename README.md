# BlockAndDelegateDemo
反向传值
分别利用block和delegate反向传值


很多时候,开发的小伙伴需要反向传值,但是又不知道该怎么传,其实很简单,下面我简单介绍一下分别用block和delegate进行反向传值,希望能够帮到你们.

这些是在ZYYBankNameViewController里需要做的
1.利用block反向传值
要利用block反向传值,首先要声明一个block

    typedef void(^bankNameBlock)(NSString *code,NSString *name);//block

同时还需要声明一个初始化方法

    -(instancetype)initWithBankNameBlock:(bankNameBlock)block;//初始化方法

那么接下来我们就需要在.m中实现这个方法

    -(instancetype)initWithBankNameBlock:(bankNameBlock)block {
          if (self == [super init]) {
              _block = block;
          }
          return self;
    }

    //block反向传值
    NSDictionary *dic = self.bankArr[indexPath.row];
    NSString *name = [[dic allKeys] firstObject];
    NSString *code = [[dic allValues] firstObject];
    if (_block) {
        _block(code,name);
    }
    [self.navigationController popViewControllerAnimated:YES];

2.利用delegate反向传值
同样的也需要先声明一个代理

    @protocol BankNameDelegate <NSObject>//代理

    -(void)popViewCode:(NSString *)code WithName:(NSString *)name;

    @end

    @property(nonatomic, weak)id<BankNameDelegate> delegate;//声明代理

接下来在.m中执行这个代理方法

    //delegate回传值方法
    NSDictionary *dic = self.bankArr[indexPath.row];
    NSString *name = [[dic allKeys] firstObject];
    NSString *code = [[dic allValues] firstObject];

    [self.delegate popViewCode:code WithName:name];
    [self.navigationController popViewControllerAnimated:YES];

在ZYYTestBlockViewController里就需要接收这些值了

    //block回传值
    ZYYBankNameViewController *bankNameVc = [[ZYYBankNameViewController alloc] initWithBankNameBlock:^(NSString *code, NSString *name) {
        NSLog(@"code:%@",code);
        NSLog(@"name:%@",name);
        NSString *nameCode = [NSString stringWithFormat:@"%@%@",name,code];
        [self.bankNameBtn setTitle:nameCode forState:UIControlStateNormal];
    }];
    [self.navigationController pushViewController:bankNameVc animated:YES];


    //delegate回传值
    ZYYBankNameViewController *bankNameVc = [[ZYYBankNameViewController alloc] init];
    bankNameVc.delegate = self;
    [self.navigationController pushViewController:bankNameVc animated:YES];

使用delegate反向传值的时候就需要执行代理方法了

    #pragma mark - BankNameDelegate
    -(void)popViewCode:(NSString *)code WithName:(NSString *)name {
        NSLog(@"code:%@",code);
        NSLog(@"name:%@",name);
        NSString *nameCode = [NSString stringWithFormat:@"%@%@",name,code];
        [self.bankNameBtn setTitle:nameCode forState:UIControlStateNormal];

    }

原理很简单,可能写的比较乱,因为我们比较让人蛋疼的产品一直在我旁边说需求,所以对不住大家了,可以配合着demo来看,如果有看不明白的欢迎留言,我会尽快回复的.

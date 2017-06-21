//
//  ViewController.m
//  NetWorkState
//
//  Created by 威盛电气 on 2017/6/20.
//  Copyright © 2017年 fzy. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkState.h"
@interface ViewController ()<NetWorkStateDelegate>

@property (nonatomic, strong) UILabel *showCurrentNetWorkState;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置Label显示当前网络状态
    self.showCurrentNetWorkState = [[UILabel alloc] initWithFrame:(CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 50))];
    [self.showCurrentNetWorkState setTextAlignment:(NSTextAlignmentCenter)];
    [self.view addSubview:self.showCurrentNetWorkState];
    
    // 设置代理
    [NetWorkState shareMonitorNetWorkState].delegate = self;
    // 添加网络监听
    [[NetWorkState shareMonitorNetWorkState] addMonitorNetWorkState];
    
    [self netWorkStateChanged];

}


#pragma mark 网络监听的代理方法，当网络状态发生改变的时候触发
- (void)netWorkStateChanged{
    
    // 获取当前网络类型
    NSString *currentNetWorkState = [[NetWorkState shareMonitorNetWorkState] getCurrentNetWorkType];
    
    // 显示当前网络类型
    self.showCurrentNetWorkState.text = currentNetWorkState;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

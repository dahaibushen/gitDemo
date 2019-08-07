//
//  MineViewController.m
//  StaticLibDemo
//
//  Created by hu on 2019/8/6.
//  Copyright © 2019 huyiyong. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(220, 320, 60, 60)];
    btn.backgroundColor = [UIColor brownColor];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
    
-(void)buttonClick:(UIButton*)btn{
    NSString *iconName = @"iOS_icon_29";
    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return;
    }
    
    //传入nil代表使用主图标. 完成后的操作将会在任意的后台队列中异步执行; 如果需要更改UI，请确保在主队列中执行
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    //如果alternateIconName为nil，则代表当前使用的是主图标.
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }
    }];
}

@end

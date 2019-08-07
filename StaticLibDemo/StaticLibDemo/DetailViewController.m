//
//  DetailViewController.m
//  StaticLibDemo
//
//  Created by hu on 2019/8/6.
//  Copyright © 2019 huyiyong. All rights reserved.
//

#import "DetailViewController.h"
#import "MineViewController.h"
#import "UIViewController+HYYAlert.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(120, 120, 40, 40)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
    
-(void)buttonClick:(UIButton*)btn{
    MineViewController * vc = [[MineViewController alloc] init];
    //    [self lq_presentViewController:vc animated:YES completion:nil];
    [self presentViewController:vc animated:YES completion:nil];
    
//    [self];
}


@end

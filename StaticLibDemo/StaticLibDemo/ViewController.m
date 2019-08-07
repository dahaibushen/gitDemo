//
//  ViewController.m
//  StaticLibDemo
//
//  Created by hu on 2019/4/20.
//  Copyright © 2019 huyiyong. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

#import "DetailViewController.h"
@interface ViewController ()
    
    @property (nonatomic,assign)BOOL isHaveSetting;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.isHaveSetting = NO;
    
}

- (IBAction)changeIconBtn:(UIButton *)sender {
//    if (self.isHaveSetting == NO) {
//        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
//        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(lq_presentViewController:animated:completion:));
//
//        method_exchangeImplementations(presentM, presentSwizzlingM);
//        self.isHaveSetting = YES;
//    }
    
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
    
    
//- (void)lq_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {
//
//    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
//        //        NSLog(@"title : %@",((UIAlertController *)viewControllerToPresent).title);
//        //        NSLog(@"message : %@",((UIAlertController *)viewControllerToPresent).message);
//
//        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
//        if (alertController.title == nil && alertController.message == nil) {
//            return;
//        }
//    }
//
//    [self lq_presentViewController:viewControllerToPresent animated:flag completion:completion];
//}
- (IBAction)clickBack:(UIButton *)sender {
    
    
    [[UIApplication sharedApplication] setAlternateIconName:nil completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }
    }];
}
- (IBAction)skipBtnClick:(id)sender {
    DetailViewController * vc = [[DetailViewController alloc] init];
//    [self lq_presentViewController:vc animated:YES completion:nil];
//    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]) {
//        NSLog(@"----111111-----");
//        [self presentViewController:vc animated:YES completion:nil];
//    }else if ([self respondsToSelector:@selector(lq_presentViewController:animated:completion:)]){
//        NSLog(@"----222222-----");
//        [self lq_presentViewController:vc animated:YES completion:nil];
//    }
    [self presentViewController:vc animated:YES completion:nil];
}
    
@end

//
//  UIViewController+HYYAlert.m
//  StaticLibDemo
//
//  Created by hu on 2019/8/6.
//  Copyright © 2019 huyiyong. All rights reserved.
//

#import "UIViewController+HYYAlert.h"
#import <objc/runtime.h>

@implementation UIViewController (HYYAlert)
    
+ (void)load {
    
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
            Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(lq_presentViewController:animated:completion:));
            
            method_exchangeImplementations(presentM, presentSwizzlingM);
        });
    }
//
- (void)lq_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {

    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {
        //        NSLog(@"title : %@",((UIAlertController *)viewControllerToPresent).title);
        //        NSLog(@"message : %@",((UIAlertController *)viewControllerToPresent).message);

        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil) {
            return;
        }
    }
    
    [self lq_presentViewController:viewControllerToPresent animated:flag completion:completion];
}


@end

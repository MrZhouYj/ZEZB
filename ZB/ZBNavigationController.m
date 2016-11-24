//
//  ZBNavigationController.m
//  ZB
//
//  Created by ZEMac on 2016/11/23.
//  Copyright © 2016年 ZEMac. All rights reserved.
//

#import "ZBNavigationController.h"

@interface ZBNavigationController ()

@end

@implementation ZBNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count>0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

@end

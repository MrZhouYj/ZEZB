//
//  TabBarViewController.m
//  ZB
//
//  Created by ZEMac on 2016/11/23.
//  Copyright © 2016年 ZEMac. All rights reserved.
//

#import "TabBarViewController.h"
#import "LiveVideoCoreSDK.h"

@interface TabBarViewController ()


@end

@implementation TabBarViewController

+(instancetype)shareTabBar{
    
    static TabBarViewController * tabbar = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabbar = [[TabBarViewController alloc] init];
    });
    
    return tabbar;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    ZBNavigationController * showNavc = [[ZBNavigationController alloc] initWithRootViewController:[ZBShowViewController new]];
    showNavc.tabBarItem  = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:0];
    
    ZBNavigationController * watchNavc = [[ZBNavigationController alloc] initWithRootViewController:[ZBWatchViewController new]];
    watchNavc.tabBarItem  = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostViewed tag:0];
    
    self.viewControllers = @[showNavc,watchNavc];
    
}


@end

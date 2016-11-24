//
//  ZBShowViewController.m
//  ZB
//
//  Created by ZEMac on 2016/11/23.
//  Copyright © 2016年 ZEMac. All rights reserved.
//

#import "ZBShowViewController.h"
#import "ZBShowIngViewController.h"
@interface ZBShowViewController ()

@end

@implementation ZBShowViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitle:@"点击直播" forState:UIControlStateNormal];
    
    button.backgroundColor = [UIColor greenColor];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    
    button.titleLabel.textAlignment=1;
    
    button.frame = CGRectMake(0, 0, 100, 60);
    
    button.center=  self.view.center;
    
    [self.view addSubview:button];
    
    [button addTarget:self action:@selector(beginShow) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)beginShow{
    
    
    ZBShowIngViewController * show = [[ZBShowIngViewController alloc] init];
    
    [self.navigationController pushViewController:show animated:YES];
}

@end

//
//  ZBShowIngViewController.m
//  ZB
//
//  Created by ZEMac on 2016/11/23.
//  Copyright © 2016年 ZEMac. All rights reserved.
//

#import "ZBShowIngViewController.h"



@interface ZBShowIngViewController ()<LIVEVCSessionDelegate>
{
    
    UIView * allBgView;
}

@property (nonatomic, strong) UIButton * exitButton;
@end

@implementation ZBShowIngViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

-(UIButton *)exitButton{
    
    if (!_exitButton) {
        
        _exitButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-80, SCREEN_HEIGHT-60, 60, 40)];
        _exitButton.backgroundColor = [UIColor blueColor];
        _exitButton.layer.masksToBounds = YES;
        _exitButton.layer.cornerRadius  = 5;
        [_exitButton setTitle:@"退出" forState:UIControlStateNormal];
        [_exitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _exitButton.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:10];
        [_exitButton addTarget:self action:@selector(OnExitClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _exitButton;
}

-(void)subViewsInit{
    
    allBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:allBgView];
    
    allBgView.backgroundColor = [UIColor whiteColor];
    
    
    
}

-(void)startConnectVideo{
    
    [[LiveVideoCoreSDK sharedinstance] LiveInit:[NSURL URLWithString:@"rtmp://192.168.1.114:1935/rtmplive/room"] Preview:allBgView VideSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) BitRate:LIVE_BITRATE_1Mbps FrameRate:LIVE_FRAMERATE_30 highQuality:true];
    [LiveVideoCoreSDK sharedinstance].delegate = self;
    [[LiveVideoCoreSDK sharedinstance] connect];
    [LiveVideoCoreSDK sharedinstance].micGain = 5;
    
    [self.view addSubview:self.exitButton];
    
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
        
   
    [self subViewsInit];
    
    [self startConnectVideo];
   
}

-(void)OnExitClicked{
    
    [[LiveVideoCoreSDK sharedinstance] disconnect];
    [[LiveVideoCoreSDK sharedinstance] LiveRelease];
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)LiveConnectionStatusChanged:(LIVE_VCSessionState)sessionState{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        switch (sessionState) {
            case LIVE_VCSessionStatePreviewStarted:
//                _RtmpStatusLabel.text = @"RTMP状态: 预览未连接(连接错误)";
                break;
            case LIVE_VCSessionStateStarting:
//                _RtmpStatusLabel.text = @"RTMP状态: 连接中...";
                break;
            case LIVE_VCSessionStateStarted:
//                _RtmpStatusLabel.text = @"RTMP状态: 已连接";
                 [[LiveVideoCoreSDK sharedinstance] setFilter:LIVE_FILTER_BEAUTY];
                break;
            case LIVE_VCSessionStateEnded:
//                _RtmpStatusLabel.text = @"RTMP状态: 未连接";
                break;
            case LIVE_VCSessionStateError:
//                _RtmpStatusLabel.text = @"RTMP状态: 错误";
                break;
            default:
                break;
        }
    });
}


@end

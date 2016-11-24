//
//  AppDelegate.h
//  ZB
//
//  Created by ZEMac on 2016/11/23.
//  Copyright © 2016年 ZEMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


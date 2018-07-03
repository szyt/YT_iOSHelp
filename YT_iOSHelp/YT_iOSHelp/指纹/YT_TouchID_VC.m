//
//  YT_TouchID_VC.m
//  YT_iOSHelp
//
//  Created by yt on 2018/7/3.
//  Copyright © 2018年 SamShu. All rights reserved.
//

#import "YT_TouchID_VC.h"
#import <LocalAuthentication/LocalAuthentication.h>//指纹
@interface YT_TouchID_VC ()

@end

@implementation YT_TouchID_VC

#pragma mark -视图 加载完成 即将显示 已经显示 即将消失 已经消失
//视图已经加载完成
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title=@"分享";
}
//根视图即将显⽰示
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self authenticateUser];
}

//根视图已经显⽰示
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
}

//根视图即将消失
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}

//根视图已经消失
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
}
//收到内存警告
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -指纹
- (void)authenticateUser
{
    //初始化上下文对象
    LAContext* context = [[LAContext alloc] init];
    //错误对象
    NSError* error = nil;
    NSString* result = NSLocalizedString(@"需要身份验证", nil);
    
    //首先使用canEvaluatePolicy 判断设备支持状态
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication error:&error])
    {
        //支持指纹验证
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:result reply:^(BOOL success, NSError *error) {
            if (success) {
                //验证成功，主线程处理UI
                NSLog(@"验证成功，主线程处理UI");
            }
            else
            {
                NSLog(@"%@",error.localizedDescription);
                switch (error.code) {
                        ///认证不成功，因为用户未能提供有效的凭证。
                    case LAErrorAuthenticationFailed:
                    {
                        break;
                    }
                        ///用户取消了认证（例如点击取消按钮）。
                    case LAErrorUserCancel:
                    {
                        break;
                    }
                        ///认证被取消，因为用户点击后备按钮（输入密码）。
                    case LAErrorUserFallback:
                    {
                        break;
                    }
                        ///身份验证被系统取消（例如，另一个应用程序转到前台）。
                    case LAErrorSystemCancel:
                    {
                        break;
                    }
                        ///验证无法启动，因为设备上未设置密码。
                    case LAErrorPasscodeNotSet:
                    {
                        break;
                    }
                        ///验证无法启动，因为Touch ID在设备上不可用。
                    case LAErrorTouchIDNotAvailable:
                    {
                        break;
                    }
                        ///身份验证无法启动，因为Touch ID没有注册手指。
                    case LAErrorTouchIDNotEnrolled:
                    {
                        break;
                    }
                        ///身份验证不成功，因为失败的Touch ID尝试失败太多
                        ///触摸ID现在被锁定。 需要密码才能解锁Touch ID，例如 评估
                        /// LAPolicyDeviceOwnerAuthenticationWithBiometrics将要求输入密码作为先决条件。
                    case LAErrorTouchIDLockout:
                    {
                        break;
                    }
                        ///认证被应用程序取消（例如，
                        ///认证正在进行中）。
                    case LAErrorAppCancel:
                    {
                        break;
                    }
                        ///传递给此调用的LAContext先前已失效。
                    case LAErrorInvalidContext:
                    {
                        break;
                    }
                    default:
                    {
                        NSLog(@"TouchID not available");
                        break;
                    }
                }
            }
        }];
    }
    else
    {
        switch (error.code) {
                
                ///认证不成功，因为用户未能提供有效的凭证。
            case LAErrorAuthenticationFailed:
            {
                break;
            }
                ///用户取消了认证（例如点击取消按钮）。
            case LAErrorUserCancel:
            {
                break;
            }
                ///认证被取消，因为用户点击后备按钮（输入密码）。
            case LAErrorUserFallback:
            {
                break;
            }
                ///身份验证被系统取消（例如，另一个应用程序转到前台）。
            case LAErrorSystemCancel:
            {
                break;
            }
                ///验证无法启动，因为设备上未设置密码。
            case LAErrorPasscodeNotSet:
            {
                break;
            }
                ///验证无法启动，因为Touch ID在设备上不可用。
            case LAErrorTouchIDNotAvailable:
            {
                break;
            }
                ///身份验证无法启动，因为Touch ID没有注册手指。
            case LAErrorTouchIDNotEnrolled:
            {
                break;
            }
                ///身份验证不成功，因为失败的Touch ID尝试失败太多
                ///触摸ID现在被锁定。 需要密码才能解锁Touch ID，例如 评估
                /// LAPolicyDeviceOwnerAuthenticationWithBiometrics将要求输入密码作为先决条件。
            case LAErrorTouchIDLockout:
            {
                break;
            }
                ///认证被应用程序取消（例如，
                ///认证正在进行中）。
            case LAErrorAppCancel:
            {
                break;
            }
                ///传递给此调用的LAContext先前已失效。
            case LAErrorInvalidContext:
            {
                break;
            }
            default:
            {
                NSLog(@"TouchID not available");
                break;
            }
        }
        
        NSLog(@"%@",error.localizedDescription);
        //        [self showPasswordAlert];
    }
}

@end

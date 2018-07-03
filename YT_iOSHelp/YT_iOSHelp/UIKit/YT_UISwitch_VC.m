//
//  YT_UISwitch_VC.m
//  YT_iOSHelp
//
//  Created by yt on 2018/7/3.
//  Copyright © 2018年 SamShu. All rights reserved.
//

#import "YT_UISwitch_VC.h"

@interface YT_UISwitch_VC ()

@end

@implementation YT_UISwitch_VC

#pragma mark -Switch
-(void)initSwitch
{
    //开关 UISwitch
    UISwitch *aSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(20, 20, 0, 0)];//这里的宽，高没有实际意义，由系统自定义
    aSwitch.tag = 0x001000;//设置tag值
    aSwitch.onTintColor = [UIColor greenColor];//打开开关时的背景色
    aSwitch.tintColor = [UIColor grayColor];//关闭开关时的背景色
    aSwitch.thumbTintColor = [UIColor yellowColor];//开关滑块的颜色
    aSwitch.onImage=[UIImage imageNamed:@""];//打开开关时的图片
    aSwitch.offImage=[UIImage imageNamed:@""];//关闭开关时的图片
    [aSwitch setOn:NO animated:YES];//设置开关关闭状态
    [aSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];//开关值改变的响应方法
    [self.view addSubview:aSwitch];
}
- (void)switchAction:(UISwitch*)aSwitch
{
    if (YES == aSwitch.on)
    {
        NSLog(@"开关已经打开");
    }
    else
    {
        NSLog(@"开关已经关闭");
    }
}
#pragma mark -视图 加载完成 即将显示 已经显示 即将消失 已经消失
//视图已经加载完成
- (void)viewDidLoad
{
    [super viewDidLoad];
}
//根视图即将显⽰示
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self initSwitch];
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

@end

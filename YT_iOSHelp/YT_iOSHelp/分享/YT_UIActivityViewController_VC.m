//
//  YT_UIActivityViewController_VC.m
//  YT_iOSHelp
//
//  Created by yt on 2018/7/3.
//  Copyright © 2018年 SamShu. All rights reserved.
//  分享

#import "YT_UIActivityViewController_VC.h"

@interface YT_UIActivityViewController_VC ()

@end

@implementation YT_UIActivityViewController_VC
#pragma mark -UIActivityViewController
-(void)initUIActivityViewController
{
    NSString *textToShare = @"我是要分享出去的文本";
    UIImage *imageToShare = [UIImage imageNamed:@"testImage"];
    NSURL *urlToShare = [NSURL URLWithString:@"https://github.com/szyt/YT_iOSHelp"];
    NSArray *array = @[urlToShare,textToShare,imageToShare];
    
    UIActivityViewController *controller = [[UIActivityViewController alloc]initWithActivityItems:array applicationActivities:nil];
    
    //iPhone
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        [self presentViewController:controller animated:YES completion:^{
        }];
    }
    //iPad
    else
    {
        UIPopoverController *popup = [[UIPopoverController alloc] initWithContentViewController:controller];
        [popup presentPopoverFromRect:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/4, 0, 0)inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}
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
    [self initUIActivityViewController];
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

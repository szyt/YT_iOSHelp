//
//  YT_UIImageView_VC.m
//  YT_iOSHelp
//
//  Created by yt on 2018/7/3.
//  Copyright © 2018年 SamShu. All rights reserved.
//

#import "YT_UIImageView_VC.h"

@interface YT_UIImageView_VC ()

@end

@implementation YT_UIImageView_VC
#pragma mark -ImageView
-(void)initImageView
{
    //图像视图 UIImageView
    UIImageView *aView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 60, 280, 400)];
    aView.image = [UIImage imageNamed:@"testImage"];//设置显示图片
    aView.tag = 0x001100;//设置tag
    aView.userInteractionEnabled = YES;//是否响应触摸事件
    aView.backgroundColor = [UIColor clearColor];//设置背景色透明
    aView.contentMode = UIViewContentModeScaleToFill;//设置内容填充模式，默认是UIViewContentModeScaleToFill
    /**
     UIViewContentModeScaleToFill //缩放以填充,图片可能会变形
     UIViewContentModeScaleAspectFit //缩放以显示全部，比例不变
     UIViewContentModeScaleAspectFill //缩放显示并填满，比例不变，图片可能部分未显示
     UIViewContentModeCenter //内容大小不变，居中显示
     UIViewContentModeTop //内容大小不变，靠顶部显示
     UIViewContentModeBottom //内容大小不变，靠底部显示
     UIViewContentModeLeft //内容大小不变，靠左边显示
     UIViewContentModeRight //内容大小不变，靠右边显示
     UIViewContentModeTopLeft //内容大小不变，靠顶部左边显示
     UIViewContentModeTopRight //内容大小不变，靠顶部右边显示
     UIViewContentModeBottomLeft //内容大小不变，靠底部左边显示
     UIViewContentModeBottomRight //内容大小不变，靠顶部右边显示
     */
    
    [aView.image stretchableImageWithLeftCapWidth:21 topCapHeight:14];//这句话就是拉伸图片 例如拉伸气泡框
    
    [self.view addSubview:aView];
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
    [self initImageView];
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

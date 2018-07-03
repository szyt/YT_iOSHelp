//
//  YT_UIMenuController_VC.m
//  YT_iOSHelp
//
//  Created by yt on 2018/7/3.
//  Copyright © 2018年 SamShu. All rights reserved.
//

#import "YT_UIMenuController_VC.h"

@interface YT_UIMenuController_VC ()

@end

@implementation YT_UIMenuController_VC

#pragma mark -UIMenuController
-(void)initUIMenuController:(CGPoint)point
{
    // 必须有第一响应者
    [self becomeFirstResponder];
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    //@selector()括号中为该按钮触发的方法，该方法必须在UIVIewContrller中进行声明，就是投向的view所绑定的viewController类中必须实现这个方法
    UIMenuItem *menuItem_1 = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(itemClick1)];
    UIMenuItem *menuItem_2 = [[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(itemClick2)];
    UIMenuItem *menuItem_3 = [[UIMenuItem alloc] initWithTitle:@"移动" action:@selector(itemClick3)];
    
    menuController.menuItems = @[menuItem_1, menuItem_2,menuItem_3];
    //touchpos_x, touchpos_y分别为长按那点的x和y坐标  self.view为将要展示弹出框的视图
    [menuController setTargetRect:CGRectMake(point.x, point.y, 50, 50) inView:self.view];
    [menuController setMenuVisible:YES animated:YES];
    
}
//控制器或者UIView能够成为first responder ,需要实现下面方法成为第一响应者
- (BOOL)canBecomeFirstResponder
{
    return YES;
}
-(void)itemClick1
{
    NSLog(@"复制");
}
-(void)itemClick2
{
    NSLog(@"删除");
}
-(void)itemClick3
{
    NSLog(@"移动");
}
#pragma mark -长按手势
- (void)longPress:(UILongPressGestureRecognizer*)gesture
{
    /**
     当前手势状态, 比如：当minimumPressDuration＝0.5时，表示0.5s后开始执行此方法，此方法会被调用2次。
     第一次gesture.state=UIGestureRecognizerStateBegan;
     第二次gesture.state=UIGestureRecognizerStateEnded;
     */
    if (gesture.state==UIGestureRecognizerStateBegan)
    {
        NSLog(@"当前位置：%@", NSStringFromCGPoint([gesture locationInView:gesture.view]));
        [self initUIMenuController:[gesture locationInView:gesture.view]];
    }
}
#pragma mark -视图 加载完成 即将显示 已经显示 即将消失 已经消失
//视图已经加载完成
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //长按⼿手势
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                                   action:@selector(longPress:)];
    longPressGesture.minimumPressDuration = 0.5;//最小长按时间
    longPressGesture.numberOfTouchesRequired = 1;//一个手指
    [self.view addGestureRecognizer:longPressGesture];
}
//根视图即将显⽰示
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
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

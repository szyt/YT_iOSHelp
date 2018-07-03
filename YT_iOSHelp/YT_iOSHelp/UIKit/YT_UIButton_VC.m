//
//  YT_UIButton_VC.m
//  YT_iOSHelp
//
//  Created by yt on 2018/7/3.
//  Copyright © 2018年 SamShu. All rights reserved.
//

#import "YT_UIButton_VC.h"

@interface YT_UIButton_VC ()

@end

@implementation YT_UIButton_VC
#pragma mark -button
-(void)initButton
{
    //创建一个矩形按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(10, 50, 200, 50);//设置frame
    btn.tag = 0x000100;//设置tag
    btn.enabled = YES;//设置按钮是否可用，NO为不可用，默认是YES
    btn.backgroundColor = [UIColor yellowColor];//设置背景色
    btn.titleLabel.font = [UIFont systemFontOfSize:14];//设置字体及大小
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];//设置水平对齐
    /*
     UIControlContentHorizontalAlignmentCenter 居中对齐
     UIControlContentHorizontalAlignmentLeft   左对齐
     UIControlContentHorizontalAlignmentRight  右对齐
     UIControlContentHorizontalAlignmentFill   填充
     */
    [btn setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];//设置垂直对齐
    /*
     UIControlContentVerticalAlignmentCenter  居中对齐
     UIControlContentVerticalAlignmentTop     置顶
     UIControlContentVerticalAlignmentBottom  置底
     UIControlContentVerticalAlignmentFill    填充
     */
    [btn setExclusiveTouch:YES];//按钮单点触控
    btn.adjustsImageWhenHighlighted=NO;//禁用图片高亮
    //设置标题
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    /*
     UIControlStateNormal       正常类型
     UIControlStateHighlighted  高亮类型
     UIControlStateDisabled     禁用类型
     UIControlStateSelected     选中类型
     */
    //设置标题颜色
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //设置按钮文字阴影颜色
    [btn setTitleShadowColor:[UIColor yellowColor] forState:UIControlStateNormal];
    //设置图片
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    //设置背景图片
    [btn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    //设置按钮点击回调方法
    [btn addTarget:self action:@selector(clickToSay) forControlEvents:UIControlEventTouchDown];
    [btn addTarget:self action:@selector(releaseToStopSay) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(restoreToSay) forControlEvents:UIControlEventTouchDragEnter];
    [btn addTarget:self action:@selector(showWarning) forControlEvents:UIControlEventTouchDragExit];
    [btn addTarget:self action:@selector(cancelToSay) forControlEvents:UIControlEventTouchUpOutside];
    
    //设置按钮文字属性-富文本
    NSString *str=@"你以后再也找不到比我帅的人了,因为我是最帅的!";
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    //为某一范围内文字添加某个属性
    [attrStr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleDouble) range:[str rangeOfString:@"帅"]];
    //为某一范围内文字设置多个属性
    NSDictionary *dic=@{NSFontAttributeName:[UIFont boldSystemFontOfSize:26],
                        NSForegroundColorAttributeName:[UIColor redColor]};
    [attrStr setAttributes:dic range:[str rangeOfString:@"我"]];
    //为某一范围内文字添加多个属性
    [attrStr addAttributes:dic range:[str rangeOfString:@"我"]];
    //移除某范围内的某个属性
    [attrStr removeAttribute:NSForegroundColorAttributeName range:[str rangeOfString:@"以后"]];
    
    /*
     NSFontAttributeName 字体
     NSParagraphStyleAttributeName 段落格式
     NSForegroundColorAttributeName 字体颜色
     NSBackgroundColorAttributeName 背景颜色
     NSStrikethroughStyleAttributeName 删除线格式
     NSUnderlineStyleAttributeName 下划线格式
     NSStrokeColorAttributeName 删除线颜色
     NSStrokeWidthAttributeName 删除线宽度
     NSShadowAttributeName 阴影
     */
    [btn setAttributedTitle:attrStr forState:UIControlStateNormal];
    [self.view addSubview:btn];
    

    NSLog(@"按钮文字:%@",[btn titleForState:UIControlStateNormal]);//获取按钮文字
    NSLog(@"按钮文字颜色:%@",[btn titleColorForState:UIControlStateNormal]);//获取按钮文字颜色
    NSLog(@"按钮文字阴影颜色:%@",[btn titleShadowColorForState:UIControlStateNormal]);//获取按钮文字阴影颜色
    NSLog(@"获取按钮前景图片:%@",[btn imageForState:UIControlStateNormal]);//获取按钮前景图片
    NSLog(@"获取按钮背景图片:%@",[btn backgroundImageForState:UIControlStateNormal]);//获取按钮背景图片
    NSLog(@"获取按钮文字属性:%@",[btn attributedTitleForState:UIControlStateNormal]);//获取按钮文字属性
}
#pragma mark -按钮点击
- (void)clickToSay
{
    NSLog(@"按住开始说话");
}

- (void)releaseToStopSay
{
    NSLog(@"松开停止说话");
}

- (void)restoreToSay
{
    NSLog(@"重新恢复说话");
}

- (void)showWarning
{
    NSLog(@"手指滑出了按钮点击区域");
}

- (void)cancelToSay
{
    NSLog(@"放弃了此次说话");
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
    [self initButton];
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

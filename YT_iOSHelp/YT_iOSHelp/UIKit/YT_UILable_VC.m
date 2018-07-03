//
//  YT_UILable_VC.m
//  YT_iOSHelp
//
//  Created by yt on 2018/7/3.
//  Copyright © 2018年 SamShu. All rights reserved.
//

#import "YT_UILable_VC.h"

@interface YT_UILable_VC ()

@end

@implementation YT_UILable_VC

#pragma mark -lable
-(void)initLable
{
    //文本标签 UILabel
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.view.frame.size.width-40, 100)];
    label.text = @"我是最帅的!";//设置文本内容
    label.textAlignment = NSTextAlignmentLeft;//设置显示格式
    /*
     NSTextAlignmentLeft,      左对齐
     NSTextAlignmentCenter,    居中对齐
     NSTextAlignmentRight      右对齐
     */
    label.textColor = [UIColor blueColor];//设置文本颜色
    label.backgroundColor = [UIColor yellowColor];//设置背景颜色
    label.font = [UIFont systemFontOfSize:16];//设置文本字体及大小
    label.numberOfLines = 0;//设置文本显示行数，0表示任意行，默认是1
    label.lineBreakMode = NSLineBreakByTruncatingTail;//设置文本断行格式,默认NSLineBreakByTruncatingTail
    /*
     NSLineBreakByTruncatingHead,    // 在行头截断: "...wxyz"
     NSLineBreakByTruncatingTail,    // 在尾部截断: "abcd..."
     NSLineBreakByTruncatingMiddle   // 在中间截断:  "ab...yz"
     */
    
    [self.view addSubview:label];
    
    //富文本
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
    label.attributedText=attrStr;
    
    //计算文本的高度
    CGSize size = [label.text boundingRectWithSize:CGSizeMake(label.frame.size.width, MAXFLOAT)
                                           options: NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                        attributes:@{NSFontAttributeName:label.font}
                                           context:nil].size;
    NSLog(@"%@",NSStringFromCGSize(size));
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
    [self initLable];
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

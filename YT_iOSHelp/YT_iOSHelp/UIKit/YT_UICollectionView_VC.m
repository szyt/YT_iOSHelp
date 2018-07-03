//
//  YT_UICollectionView_VC.m
//  YT_iOSHelp
//
//  Created by yt on 2018/7/3.
//  Copyright © 2018年 SamShu. All rights reserved.
//

#import "YT_UICollectionView_VC.h"

@interface YT_UICollectionView_VC ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation YT_UICollectionView_VC

#pragma mark -UICollectionView
-(void)initUICollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setItemSize:CGSizeMake(10, 10)];//设置cell的尺寸
    flowLayout.sectionInset = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0);//设定全局的区内边距
    flowLayout.minimumLineSpacing=0;//设定全局的行间距
    flowLayout.minimumInteritemSpacing=0;//设定全局的Cell间距
    flowLayout.scrollDirection=UICollectionViewScrollDirectionVertical;//设定滚动方向
    
    UICollectionView *collView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, 100, 100) collectionViewLayout:flowLayout];
    collView.backgroundColor = [UIColor grayColor];
    collView.dataSource = self;
    collView.delegate = self;
    [collView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"myCell"];//设置collView的cell
    [self.view addSubview:collView];
}
#pragma mark - collectionView dataSource And delegate

//返回指定区(section)包含的数据源条目数(number of items)，该方法必须实现：
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}
//返回collection view里区(section)的个数，如果没有实现该方法，将默认返回1：
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}
//返回某个indexPath对应的cell，该方法必须实现：
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    return cell;
}
//当指定indexPath处的item被选择时触发
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%zd",indexPath.row);
}

//定义Cell的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.frame.size.width )/2, (self.view.frame.size.width)/2);
}
//设定Cell的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
//设定Cell的最小行距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
//设定区内边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    //上左下右
    return UIEdgeInsetsMake(0, 0.0, 0.0, 0.0);
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
    [self initUICollectionView];
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

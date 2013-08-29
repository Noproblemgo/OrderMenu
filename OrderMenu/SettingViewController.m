//
//  SettingViewController.m
//  OrderMenu
//
//  Created by tiankong360 on 13-7-3.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import "SettingViewController.h"
#import "CustomCell.h"
#import "CollectViewController.h"
#import "ShareViewController.h"
#import "VersionViewController.h"
#import "AboutViewController.h"
#import "HelpViewController.h"
#import "FeedbackViewController.h"
#import "MyIndentViewController.h"
#import "OrderListViewController.h"
#import "AppDelegate.h"
#import "ErWeiMaViewController.h"
@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        

    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title=@"设置";
    self.navigationController.navigationBar.tintColor=[UIColor orangeColor];
    self.navigationController.navigationBar.hidden=YES;
    UIImageView *aImageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    aImageView.image=[UIImage imageNamed:@"设置导航"];
    [self.view addSubview:aImageView];
    UIButton *aBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    aBtn.frame=CGRectMake(0, 0, 44, 44);
    [self.view addSubview:aBtn];
    aBtn.showsTouchWhenHighlighted=YES;
    [aBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    //手势
    UISwipeGestureRecognizer *recognizer;
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionRight)];
    [[self view] addGestureRecognizer:recognizer];
    
    recognizer = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeFrom:)];
    
    [recognizer setDirection:(UISwipeGestureRecognizerDirectionLeft)];
    [[self view] addGestureRecognizer:recognizer];
    
    UIImageView *aImage=[[UIImageView alloc] initWithFrame:CGRectMake(45, 44+16, 228, 72)];
    aImage.backgroundColor=[UIColor clearColor];
    aImage.image=[UIImage imageNamed:@"为您"];
//    aImage.center=CGPointMake(160, 44+36);
    [self.view addSubview:aImage];
    UIScrollView *acroll=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 104+44, 320, [UIScreen mainScreen].bounds.size.height-104-44)];
    acroll.backgroundColor=[UIColor clearColor];
    acroll.contentSize=CGSizeMake(300, [UIScreen mainScreen].bounds.size.height-104-43);
    [self.view addSubview:acroll];
    aTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 44*5)style:UITableViewStylePlain];
    aTableView.delegate=self;
    aTableView.dataSource=self;
     aTableView.scrollEnabled=NO;
    [acroll addSubview:aTableView];
    ary=[[NSArray alloc] initWithObjects:@"关于我们",@"意见反馈",@"检查更新",@"好友推荐",@"评价一下", nil];
}
//手势
-(void)handleSwipeFrom:(UISwipeGestureRecognizer *)recognizer
{
    if(recognizer.direction==UISwipeGestureRecognizerDirectionLeft) {
        
        //NSLog(@"swipe left");
        //执行程序
        [[NSNotificationCenter defaultCenter] postNotificationName:@"SwitchGesture" object:nil];
    }
    
    if(recognizer.direction==UISwipeGestureRecognizerDirectionRight) {
        
        //        NSLog(@"swipe right");
        //执行程序
    }
    
}
#pragma mark ----tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [ary count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *CellIdentifier = @"CellIdentifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //右边小箭头
         cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.textColor=[UIColor grayColor];
    cell.textLabel.text=[ary objectAtIndex:indexPath.row];
	return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [aTableView deselectRowAtIndexPath:[aTableView indexPathForSelectedRow] animated:YES];
//    if (indexPath.row==0)
//    {
//        CollectViewController *collectVC=[[CollectViewController alloc] init];
//        [self.navigationController pushViewController:collectVC animated:YES];
//    }
//    if (indexPath.row==1)
//    {
//        OrderListViewController * orderList;
//        if (IPhone5)
//        {
//            orderList = [[OrderListViewController alloc] initWithNibName:@"OrderListViewController" bundle:nil];
//        }
//        else
//        {
//            orderList = [[OrderListViewController alloc] initWithNibName:@"OrderListViewController4" bundle:nil];
//        }
//        AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        [delegate.ddmenuControler showRootController:YES];
//        [delegate.AllNav pushViewController:orderList animated:YES];
//    }
    if (indexPath.row==0)
    {
        AboutViewController *aboutVC=[[AboutViewController alloc] init];
        [self.navigationController pushViewController:aboutVC animated:YES];

    }
    if (indexPath.row==1)
    {
        FeedbackViewController *feedbackVC=[[FeedbackViewController alloc] init];
        [self.navigationController pushViewController:feedbackVC animated:YES];
//        [UMFeedback showFeedback:self withAppkey:@"51dccb0456240b7f87001d5e"];
    }
    if (indexPath.row==2)
    {
//        VersionViewController *versionVC=[[VersionViewController alloc] init];
//        [self.navigationController pushViewController:versionVC animated:YES];
        UIAlertView *aLertView=[[UIAlertView alloc] initWithTitle:@"温馨提醒" message:@"您使用的是最新版本" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [aLertView show];
    }
    if (indexPath.row==3)
    {
        ShareViewController *shareVC=[[ShareViewController alloc] init];
        [self.navigationController pushViewController:shareVC animated:YES];
    }
//    if (indexPath.row==4)
//    {
//        ErWeiMaViewController *erVC=[[ErWeiMaViewController alloc] init];
//        [self.navigationController pushViewController:erVC animated:YES];
//    }
    if (indexPath.row==4)
    {
        
    }
}
-(void)helpView
{
   [[NSNotificationCenter defaultCenter] postNotificationName:@"SwitchGesture" object:nil];
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell

forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   // NSInteger realRow = [self realRowNumberForIndexPath:indexPath inTableView:tableView];
    NSInteger realRow =[self realRowNumberForIndexPath:indexPath inTableView:tableView];
    cell.backgroundColor = (realRow%2)?[UIColor whiteColor]:[UIColor colorWithRed:229.0/255.0 green:229.0/255.0 blue:229.0/255.0 alpha:1.0];
    
}
- (NSInteger)realRowNumberForIndexPath:(NSIndexPath *)indexPath

                           inTableView:(UITableView *)tableView
{
    
//    NSInteger retInt = 0;
//    
//    if (!indexPath.section) {
//        
//        return indexPath.row;
//        
//    }
//    
//    for (int i=0; i<indexPath.section;i++) {
//        
//        retInt += [tableView numberOfRowsInSection:i];
//        
//    }
//    
//    return retInt + indexPath.row;
    return indexPath.row;
}
//版本更新
//-(void)GetUpdate
//{
//    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
//    NSString *nowVersion = [infoDict objectForKey:@"CFBundleVersion"];
//    
//    NSURL *url = [NSURL URLWithString:@"http://itunes.apple.com/lookup?id=***"];
//    NSString * file =  [NSString stringWithContentsOfURL:url];
//    NSLog(@"file%@",file);
//    //"version":"1.0"
//    NSRange substr = [file rangeOfString:@"\"version\":\""];
//    NSRange substr2 =[file rangeOfString:@"\"" options:NULL range:NSRange{substr.location+substr.length,10}];
//    NSRange sub=[file rangeOfString:<#(NSString *)#> options:<#(NSStringCompareOptions)#> range:<#(NSRange)#>];
//    NSRange range = {substr.location+substr.length,substr2.location-substr.location-substr.length};
//    NSString *newVersion =[file substringWithRange:range];
//    if([nowVersion isEqualToString:newVersion]==NO)
//    {
//        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"版本有更新" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"更新", nil];
//        [alert show];
//    }
//    
//}
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if(buttonIndex==1)
//    {
//        NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/qun-xiang-dao/id***?ls=1&mt=8"];
//        [[UIApplication sharedApplication]openURL:url];
//    }
//}
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if(buttonIndex==1)
//    {
//        NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com/us/app/xg-ke-hui/id622493449?ls=1&mt=8"];
//        [[UIApplication sharedApplication]openURL:url];
//    }
//}
-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

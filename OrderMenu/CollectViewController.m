//
//  CollectViewController.m
//  OrderMenu
//
//  Created by tiankong360 on 13-7-8.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import "CollectViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CollectCustomCell.h"
#import "DetailViewController.h"
#import "UIImageView+WebCache.h"
#import "DataBase.h"
@interface CollectViewController ()

@end

@implementation CollectViewController
@synthesize ary;
@synthesize collectAry;
@synthesize aTableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=YES;
    UIView *aView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    aView.backgroundColor=[UIColor colorWithRed:252.0/255.0 green:33.0/255.0 blue:47.0/255.0 alpha:1.0];
    [self.view addSubview:aView];
    UILabel *titleLab=[[UILabel alloc] initWithFrame:CGRectMake(80, 0, 160, 44)];
    titleLab.backgroundColor=[UIColor clearColor];
    titleLab.textColor=[UIColor whiteColor];
    titleLab.text=@"我的收藏";
    titleLab.textAlignment=NSTextAlignmentCenter;
    [aView addSubview:titleLab];
//    UIButton *aBtn=[UIButton buttonWithType:UIButtonTypeCustom];
//    aBtn.showsTouchWhenHighlighted=YES;
//    aBtn.frame=CGRectMake(0, 0, 44, 44);
//    [self.view addSubview:aBtn];
//    [aBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    aTableView=[[UITableView alloc] initWithFrame:CGRectMake(0,44, 320, [UIScreen mainScreen].bounds.size.height -44-20-50) style:UITableViewStylePlain];
    aTableView.delegate=self;
    aTableView.dataSource=self;
    //[aTableView setSeparatorColor:[UIColor whiteColor]];
    [self.view addSubview:aTableView];
    ary=[[NSArray alloc] init];
    collectAry=[[NSMutableArray alloc] init];
   
//    editBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    editBtn.frame=CGRectMake(320-44, 0, 44, 44);
//    [self.view addSubview:editBtn];
//    [editBtn addTarget:self action:@selector(toggleEdit:) forControlEvents:UIControlEventTouchUpInside];
//    [editBtn setTitle:@"删除" forState:UIControlStateNormal];
}
-(void)toggleEdit:(id)sender
{
	[self.aTableView setEditing:!self.aTableView.editing animated:YES];
    [editBtn setTitle:self.aTableView.editing?@"完成":@"删除" forState:UIControlStateNormal];
}
-(void)viewWillAppear:(BOOL)animated
{
    userDefaults = [NSUserDefaults standardUserDefaults];
    self.ary = [userDefaults objectForKey:@"IDAry"];
//    self.collectAry=[userDefaults objectForKey:@"collectAry"];
//    NSLog(@"@@@@@  %@",[userDefaults objectForKey:@"collectAry"]);
    [super viewWillAppear:animated];
}
#pragma mark - tableview delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([[userDefaults objectForKey:@"collectAry"] count]==0)
    {
        UILabel *alab=[[UILabel alloc] initWithFrame:CGRectMake(80, 2, 200, 50)];
        alab.text=@"您还没收藏任何餐馆";
        alab.backgroundColor=[UIColor clearColor];
        [aTableView addSubview:alab];
    }
	return [[userDefaults objectForKey:@"collectAry"] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    CollectCustomCell *cell = (CollectCustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        //记载xib相当于创建了xib当中的内容，返回的数组里面包含了xib当中的对象
        // NSLog(@"新创建的cell  %d",indexPath.row);
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CollectCustomCell" owner:nil options:nil];
		
        for (NSObject *object in array)
        {
            //判断数组中的对象是不是CustomCell 类型的
            if([object isKindOfClass:[CollectCustomCell class]])
            {
                //如果是，赋给cell指针
                cell = (CollectCustomCell *)object;
                //找到之后不再寻找
                break;
            }
        }
    }
    //右边小箭头
    //    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.lab.font = [UIFont fontWithName:@"Arial" size:17.0f];
    //cell.lab.textColor=[UIColor colorWithRed:251.0/255.0 green:33.0/255.0 blue:47.0/255.0 alpha:1.0];
    cell.lab2.textColor=[UIColor grayColor];
    cell.renjunLab.textColor=[UIColor grayColor];
    cell.timeLab.textColor=[UIColor grayColor];
    //numberStr=cell.timeLab.text;
    cell.lab.text=[[[userDefaults objectForKey:@"collectAry"] objectAtIndex:indexPath.row] valueForKey:@"restname"];
    [cell.imag setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@%@",Domain_Name,[[[userDefaults objectForKey:@"collectAry"] objectAtIndex:indexPath.row] valueForKey:@"restimg"]]] placeholderImage:[UIImage imageNamed:@"加载中"]];
    cell.imag.layer.borderColor=[[UIColor grayColor] CGColor];
    cell.imag.layer.borderWidth=1;
    cell.lab2.text=[[[userDefaults objectForKey:@"collectAry"] objectAtIndex:indexPath.row] valueForKey:@"restaddress"];
    cell.timeLab.text=[[[userDefaults objectForKey:@"collectAry"] objectAtIndex:indexPath.row] valueForKey:@"restphone"];
    //cell.renjunLab.text=[NSString stringWithFormat:@"人均￥%@",[[ary objectAtIndex:indexPath.row] valueForKey:@"restaverage"]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 66;
}
-(void)deletaData:(id)sender
{
    UIButton *Abtn=(UIButton *)sender;
    NSMutableArray *collect=
    [NSMutableArray arrayWithArray:[userDefaults objectForKey:@"collectAry"]];
    [collect removeObjectAtIndex:Abtn.tag];
    [[NSUserDefaults standardUserDefaults] setObject:collect forKey:@"collectAry"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [aTableView reloadData];
}
//删除
//要求委托方的编辑风格在表视图的一个特定的位置。
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCellEditingStyle result = UITableViewCellEditingStyleNone;//默认没有编辑风格
    if ([tableView isEqual:aTableView]) {
        result = UITableViewCellEditingStyleDelete;//设置编辑风格为删除风格
    }
    return result;
}
-(void)setEditing:(BOOL)editing animated:(BOOL)animated{//设置是否显示一个可编辑视图的视图控制器。
    [super setEditing:editing animated:animated];
    [aTableView setEditing:editing animated:animated];//切换接收者的进入和退出编辑模式。
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{//请求数据源提交的插入或删除指定行接收者。
    if (editingStyle ==UITableViewCellEditingStyleDelete)
    {//如果编辑样式为删除样式
//        if (indexPath.row<[self.ary count]) {
        NSMutableArray *collect=
        [NSMutableArray arrayWithArray:[userDefaults objectForKey:@"collectAry"]];
            [collect removeObjectAtIndex:indexPath.row];//移除数据源的数据
        [[NSUserDefaults standardUserDefaults] setObject:collect forKey:@"collectAry"];
        [[NSUserDefaults standardUserDefaults] synchronize];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];//移除tableView中的数据
//        }
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailVC=[[DetailViewController alloc] init];
    detailVC.hidesBottomBarWhenPushed=YES;
    detailVC.hideStr=@"show";
    detailVC.resInfoArr =[[NSMutableArray arrayWithArray:[userDefaults objectForKey:@"collectAry"]] objectAtIndex:indexPath.row];
    detailVC.pID=[[[NSMutableArray arrayWithArray:[userDefaults objectForKey:@"collectAry"]] objectAtIndex:indexPath.row]valueForKey:@"restid"];
    [self.navigationController pushViewController:detailVC animated:YES];
    //点击 蓝色慢慢消失
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
}
-(void)backClick
{
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionMoveIn;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

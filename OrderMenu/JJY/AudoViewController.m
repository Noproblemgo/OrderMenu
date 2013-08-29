//
//  AudoViewController.m
//  OrderMenu
//
//  Created by tiankong360 on 13-7-11.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import "AudoViewController.h"
#import "AudoResultViewController.h"
#import "PriceView.h"

@interface AudoViewController ()
{
    NSString * peoNum;
}
@property (nonatomic,strong) NSMutableArray * datasourseArr;
@property (nonatomic,strong)UIButton * backButton;
-(IBAction)backClick:(id)sender;
-(IBAction)audoClickEvent:(id)sender;
@end

@implementation AudoViewController
@synthesize backButton;
@synthesize peopleNumPK;
@synthesize datasourseArr;
@synthesize resultID;
@synthesize resInfoArr;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

-(IBAction)backClick:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    peoNum = @"3人";
    self.datasourseArr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 1; i<30; i++)
    {
        NSString * str = [NSString stringWithFormat:@"%d人",i+1];
        [self.datasourseArr addObject:str];
    }
    [self.peopleNumPK selectRow:1 inComponent:0 animated:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view;
{
    UILabel * lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 236, 30)];
    lable.font = [UIFont systemFontOfSize:17];
    lable.backgroundColor = [UIColor clearColor];
    lable.textColor = [UIColor redColor];
    lable.text = [self.datasourseArr objectAtIndex:row];
    lable.textAlignment = NSTextAlignmentCenter;
    return lable;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.datasourseArr count];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    peoNum = [self.datasourseArr objectAtIndex:row];
}

#pragma mark - 点菜按钮触发事件
-(IBAction)audoClickEvent:(id)sender
{
    AudoResultViewController * result;
    if (IPhone5)
    {
        result = [[AudoResultViewController alloc] initWithNibName:@"AudoResultViewController" bundle:nil];
    }
    else
    {
        result = [[AudoResultViewController alloc] initWithNibName:@"AudoResultViewController4" bundle:nil];
    }
    result.peopleNum = peoNum;
    result.resultID = self.resultID;
    result.resInfoArr = self.resInfoArr;
    [self.navigationController pushViewController:result animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

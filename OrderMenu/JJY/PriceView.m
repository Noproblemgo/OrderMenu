//
//  PriceView.m
//  OrderMenu
//
//  Created by tiankong360 on 13-7-11.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import "PriceView.h"

@interface PriceView()
-(void)nextClickEvent;
@end

@implementation PriceView
@synthesize detailLab;
@synthesize sumnumber;
@synthesize sumprice;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.sumprice = 0.0;
        self.sumnumber = 0;
        
        self.backgroundColor = [UIColor whiteColor];
        UILabel * lab = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 200, 30)];
        lab.alpha = 0.0;
        lab.textColor = [UIColor greenColor];
        lab.font = [UIFont systemFontOfSize:18];
        lab.backgroundColor = [UIColor clearColor];
        lab.text = @"￥0(合计：0个菜)";
        self.detailLab = lab;
        [self addSubview:lab];
        
        UIButton * nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [nextBtn addTarget:self action:@selector(nextClickEvent) forControlEvents:UIControlEventTouchUpInside];
        nextBtn.frame = CGRectMake(10, 0, 300, 40);
        [nextBtn setBackgroundImage:[UIImage imageNamed:@"结束点菜，核对菜单.png"] forState:UIControlStateNormal];
        [nextBtn setShowsTouchWhenHighlighted:YES];
        nextBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [self addSubview:nextBtn];
    }
    return self;
}

static PriceView * priceView = nil;
+(PriceView *)ShareView
{
    @synchronized(self)
    {
        if (priceView == nil)
        {
            if (IPhone5)
            {
                priceView = [[PriceView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, 320, 40)];
            }
            else
            {
                priceView = [[PriceView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-20, 320, 40)];
            }
        }
        return priceView;
    }
}

+(void)AnimateCancle
{
    PriceView * pc = [PriceView ShareView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    if (IPhone5)
    {
        pc.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, 320, 40);
    }
    else
    {
        pc.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-20, 320, 40);
    }
    
    [UIView commitAnimations];
}
+(void)AnimateCancleSpeed
{
    PriceView * pc = [PriceView ShareView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.1];
    if (IPhone5)
    {
        pc.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, 320, 40);
    }
    else
    {
        pc.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-20, 320, 40);
    }
    
    [UIView commitAnimations];
}

+(void)AnimateCome
{
    PriceView * pc = [PriceView ShareView];
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    pc.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height-20-40, 320, 40);
    [UIView commitAnimations];
}
-(void)ChangeLabTextSumPrice:(double)aSumPrice sumDishes:(int)aDishes
{
    self.sumprice = aSumPrice;
    self.sumnumber = aDishes;
    self.detailLab.text = [NSString stringWithFormat:@"￥%g(合计：%d个菜)",aSumPrice,aDishes];
}

-(void)nextClickEvent
{
    [self.delegate nextClick];
}

@end

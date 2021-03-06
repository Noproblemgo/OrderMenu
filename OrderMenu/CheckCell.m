//
//  CheckCell.m
//  OrderMenu
//
//  Created by tiankong360 on 13-8-5.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import "CheckCell.h"

@implementation CheckCell
@synthesize labName;
@synthesize labPrice;
@synthesize ClickView;
@synthesize bgImageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andDotNumber:(int)aDotNumber
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        imageView.userInteractionEnabled = YES;
        self.bgImageView = imageView;
        [self addSubview:imageView];
        
        UILabel * lab1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 120, 35)];
        self.labName = lab1;
        lab1.font = [UIFont systemFontOfSize:12];
        lab1.numberOfLines = 2;
        lab1.backgroundColor = [UIColor clearColor];
        [imageView addSubview:lab1];
        
        UILabel * lab2 = [[UILabel alloc] initWithFrame:CGRectMake(140, 10, 60, 25)];
        lab2.font = [UIFont systemFontOfSize:15];
        lab2.textColor = [UIColor redColor];
        self.labPrice = lab2;
        lab2.backgroundColor = [UIColor clearColor];
        [imageView addSubview:lab2];
        
        DishClickView * clickView = [[DishClickView alloc] initWithFrame:CGRectMake(140, 30, 90, 40) andNumber:aDotNumber];
        self.ClickView = clickView;
        [imageView addSubview:clickView];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end

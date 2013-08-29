//
//  DishesCustomCell.h
//  OrderMenu
//
//  Created by tiankong360 on 13-7-8.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DishClickView.h"

@interface DishesCustomCell : UITableViewCell
{
    IBOutlet UILabel *nameLab;
    IBOutlet UILabel *priceLab;
    IBOutlet UIImageView  *image;
}

@property(nonatomic,retain)IBOutlet UILabel *nameLab;
@property(nonatomic,retain)IBOutlet UILabel *priceLab;
@property(nonatomic,retain)IBOutlet UIImageView  *image;
@end

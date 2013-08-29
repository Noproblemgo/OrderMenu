//
//  AudoResultViewController.h
//  OrderMenu
//
//  Created by tiankong360 on 13-7-11.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AudoResultViewController : UIViewController
@property (nonatomic,strong) NSString * peopleNum;
@property (nonatomic,strong)IBOutlet UILabel * eatNumLab;
@property (nonatomic,strong)IBOutlet UILabel * resNameLab;
@property (nonatomic,strong)IBOutlet UILabel * resAdressLab;
@property (nonatomic,strong)IBOutlet UITableView * dishTableView;
@property (nonatomic,strong) NSMutableArray * resInfoArr;
@property (nonatomic)int resultID;
-(void)refeTable;
@end

//
//  DetailViewController.h
//  OrderMenu
//
//  Created by tiankong360 on 13-7-4.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
     UITableView   *aTableView;
     UILabel       *numLab;
     NSArray       *detailAry;
     UIImageView   *imageview;
     UILabel       *aLab;
     UITextView    *aText;
     UILabel       *addressLab;
}

@property(nonatomic,retain)UITableView   *aTableView;
@property(nonatomic,retain)UILabel       *numLab;
@property(nonatomic,retain)NSArray       *detailAry;
@property(nonatomic,retain)UIImageView   *imageview;
@property(nonatomic,retain)UILabel       *aLab,*addressLab;
@property(nonatomic,retain)UITextView    *aText;
@end

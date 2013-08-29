//
//  DetailViewController.h
//  OrderMenu
//
//  Created by tiankong360 on 13-7-4.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface DetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>
{
     UITableView   *aTableView;
     UILabel       *numLab;
     NSArray       *detailAry,*recommendAry;
     UIImageView   *imageview;
     UILabel       *aLab;
     UITextView    *aText;
     UILabel       *addressLab;
     NSString      *pID;
     NSMutableArray *IDAry;
     NSMutableArray *collectAry;
     UIView        *background;
     UIView        *backGroundView;
     UIView        *authorizationView;
     UIScrollView  *aScrollView;
     UIImageView   *startimageview;
     UIButton      *startBtn;
     UIView        *aView;
     UILabel       *Lab11;
     UILabel       *Lab22;
     UILabel       *Lab33;
}

@property(nonatomic,retain)UITableView   *aTableView;
@property(nonatomic,retain)UILabel       *numLab;
@property(nonatomic,retain)NSArray       *detailAry,*recommendAry;
@property(nonatomic,retain)UIImageView   *imageview;
@property(nonatomic,retain)UILabel       *aLab,*addressLab;
@property(nonatomic,retain)UITextView    *aText;
@property(nonatomic,retain)NSString      *pID;
@property(nonatomic,retain)NSMutableArray*IDAry;
@property(nonatomic,retain)NSMutableArray *collectAry;
@property (nonatomic) BOOL isFromOrder;

@property (nonatomic,strong)NSMutableArray * resInfoArr;
@property(nonatomic,retain)UILabel       *Lab11,*Lab22,*Lab33;
@end

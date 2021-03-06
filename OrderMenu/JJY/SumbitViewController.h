//
//  SumbitViewController.h
//  OrderMenu
//
//  Created by tiankong360 on 13-7-12.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SumbitViewController : UIViewController
@property (nonatomic,strong) IBOutlet UITextField * text_contact;
@property (nonatomic,strong) IBOutlet UITextField * text_time;
@property (nonatomic,strong) IBOutlet UITextField * text_mark;
@property (nonatomic,strong) IBOutletCollection(UITextField) NSArray * textfieldArr;
@property (nonatomic,strong) IBOutlet UIView * bgView;
@property (nonatomic,strong) NSString * idStr;
@property (nonatomic,strong) NSString * restId;
@property (nonatomic,strong) NSString * numberStrs;
@property (nonatomic) BOOL isFromOrder;
@property (nonatomic,strong) NSString * saveOrderId;
@end

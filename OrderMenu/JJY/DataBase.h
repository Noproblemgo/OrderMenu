//
//  DataBase.h
//  OrderMenu
//
//  Created by tiankong360 on 13-7-13.
//  Copyright (c) 2013年 tiankong360. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DataBase : NSObject
+(FMDatabase *)ShareDataBase;
+(void)clearOrderMenu;
+(void)insertProID:(int)aProID menuid:(int)aMenuId proName:(NSString *)aName price:(double)aPrice image:(NSString *)aImage andNumber:(int)aNumber;
+(void)UpdateDotNumber:(int)aProid currDotNumber:(int)aDotNumber;
+(void)deleteProID:(int)aProID;
+(NSString *)selectAllProId;
+(NSMutableArray *)selectAllProduct;
+(void)insertTellMenuTellNumber:(NSString *)aTellNumber;
+(NSArray *)selectTellNumber;
+(NSMutableArray *)selectNumberFromProId:(int)aProid;
+(NSMutableArray *)selectAllArrayProId;
+(void)UpdateDotNumber:(int)aNumber andPriId:(int)aProId;
+(void)UpdateDotNumber:(int)aNumber andPriId:(int)aProId andOrderId:(int)aOrderId;
+(NSMutableArray *)SelectAllSaveProId:(int)aOrderId;
+(NSDictionary *)SelectNumberAndPriceByProID:(int)aProId;
+(BOOL)deleteSaveProID:(int)aProID andOrderId:(int)aOrderId;
+(BOOL)deleteSaveOederFromOrderId:(int)aOrderId;

//保存菜单的方法
+(BOOL)insertSaveProID:(int)aProID orderId:(int)orderId proName:(NSString *)aName price:(double)aPrice image:(NSString *)aImage andNumber:(int)aNumber;
+(BOOL)deleteSaveProID:(int)aProID;
+(NSMutableArray *)selecetAllNoSaveProduct:(NSString *)aOrderId;
+(NSDictionary *)SelectNumberAndPriceByProID:(int)aProId andOrderId:(int)aOrderId;

//保存订单的时候，需要首先先保存一个餐馆，并且把时间也保存起来
+(NSString *)insertResultResultId:(int)aResultId resultName:(NSString *)aResultName proImage:(NSString *)aProImage orderTime:(NSString *)aOrderTime adress:(NSString *)aAdress tellNumber:(NSString *)aTellNumber;
+(NSMutableArray *)selectAllNoSaveResult;
+(BOOL)deleteResultSave:(NSString *)aOrderId;
@end

//
//  MonthHoroscope.h
//  Constellation
//
//  Created by lisa on 16/3/27.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MonthHoroscope : NSObject
/** 星座名 */
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *health;
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) NSString *love;
@property (nonatomic, strong) NSString *work;
@property (nonatomic, strong) NSString *all;


@end

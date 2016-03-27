//
//  WeekHoroscope.h
//  星座魔女
//
//  Created by lisa on 16/3/26.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeekHoroscope : NSObject
/** 星座名 */
@property (nonatomic, strong) NSString *name;
/** 日期 */
@property (nonatomic, strong) NSString *date;
/** 速配星座 */
@property (nonatomic, strong) NSString *weekth;
/** 健康指数 */
@property (nonatomic, strong) NSString *health;
/** 幸运色 */
@property (nonatomic, strong) NSString *job;
/** 财运 */
@property (nonatomic, strong) NSString *money;
@property (nonatomic, strong) NSString *love;
@property (nonatomic, strong) NSString *work;
@end

//
//  DayHoroscope.h
//  星座魔女
//
//  Created by lisa on 16/3/26.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DayHoroscope : NSObject
/** 星座名 */
@property (nonatomic, strong) NSString *name;
/** 日期 */
@property (nonatomic, strong) NSString *datetime;
/** 速配星座 */
@property (nonatomic, strong) NSString *QFriend;
/** 综合指数 */
@property (nonatomic, strong) NSString *all;
/** 爱情指数 */
@property (nonatomic, strong) NSString *love;
/** 工作指数 */
@property (nonatomic, strong) NSString *work;
/** 财运指数 */
@property (nonatomic, strong) NSString *money;
/** 健康指数 */
@property (nonatomic, strong) NSString *health;
/** 幸运数字 */
@property (nonatomic, assign) NSNumber *number;
/** 幸运色 */
@property (nonatomic, strong) NSString *color;
/** 今日概述 */
@property (nonatomic, strong) NSString *summary;

@end

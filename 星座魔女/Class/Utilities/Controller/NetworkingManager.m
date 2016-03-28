//
//  NetworkingManager.m
//  星座魔女
//
//  Created by lisa on 16/3/26.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import "NetworkingManager.h"
#import "AFNetworking.h"
#import "DayHoroscope.h"
#import "WeekHoroscope.h"
#import "MonthHoroscope.h"

@implementation NetworkingManager


+ (void)getHoroscope:(NSString *)name withType:(enum types)type withSuccess:(successBlock) success withFailure:(failureBlock)failure{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/html"]];
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    parameters[@"key"] = @"b8faf2e7b500d1db800d91deeaae7064";
    parameters[@"consName"] = name;
    
    switch (type) {
        case Today:
            parameters[@"type"] = @"today";
            break;
        case Tomorrow:
            parameters[@"type"] = @"tomorrow";
            break;
        case Week:
            parameters[@"type"] = @"week";
            break;
        case NextWeek:
            parameters[@"type"] = @"nextweek";
            break;
        case Month:
            parameters[@"type"] = @"month";
            break;
        case Year:
            parameters[@"type"] = @"year";
            break;
            
        default:
            break;
    }

    
    [manager GET:@"http://web.juhe.cn:8080/constellation/getAll" parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        switch (type) {
        case Today:
        case Tomorrow:{
            
            DayHoroscope *dayHoroscope = [DayHoroscope new];
            dayHoroscope.name       = responseObject[@"name"];
            dayHoroscope.datetime   = responseObject[@"datetime"];
            dayHoroscope.QFriend    = responseObject[@"QFriend"];
            dayHoroscope.all        = responseObject[@"all"];
            dayHoroscope.love       = responseObject[@"love"];
            dayHoroscope.work       = responseObject[@"work"];
            dayHoroscope.money      = responseObject[@"money"];
            dayHoroscope.health     = responseObject[@"health"];
            dayHoroscope.number     = responseObject[@"number"];
            dayHoroscope.color      = responseObject[@"color"];
            dayHoroscope.summary    = responseObject[@"summary"];
            success(dayHoroscope);
        }
            break;
                
        case Week:
        case NextWeek:{
            WeekHoroscope *weekHoroscope = [WeekHoroscope new];
            weekHoroscope.name    = responseObject[@"name"];
            weekHoroscope.date    = responseObject[@"date"];
            weekHoroscope.weekth  = responseObject[@"weekth"];
            weekHoroscope.health  = responseObject[@"health"];
            weekHoroscope.job     = responseObject[@"job"];
            weekHoroscope.money   = responseObject[@"money"];
            weekHoroscope.love    = responseObject[@"love"];
            weekHoroscope.work    = responseObject[@"work"];
            success(weekHoroscope);
            }
            break;
                
            case Month:{
                MonthHoroscope *monthHoroscope = [MonthHoroscope new];
                monthHoroscope.name    = responseObject[@"name"];
                monthHoroscope.date    = responseObject[@"date"];
                monthHoroscope.health  = responseObject[@"health"];
                monthHoroscope.all     = responseObject[@"all"];
                monthHoroscope.money   = responseObject[@"money"];
                monthHoroscope.love    = responseObject[@"love"];
                monthHoroscope.work    = responseObject[@"work"];
                success(monthHoroscope);
            }

            break;
                
        case Year:
                
            break;
            
        default:
            break;
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

@end

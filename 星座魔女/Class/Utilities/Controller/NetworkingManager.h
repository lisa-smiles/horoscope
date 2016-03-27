//
//  NetworkingManager.h
//  星座魔女
//
//  Created by lisa on 16/3/26.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^successBlock)(id responseObject);
typedef void (^failureBlock)(NSError *error);

enum types{Today, Tomorrow, Week, NextWeek, Month, Year};


@interface NetworkingManager : NSObject

+ (void)getHoroscope:(NSString *)name withType:(enum types)type withSuccess:(successBlock) success withFailure:(failureBlock)failure;

@end

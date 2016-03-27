//
//  BaseViewController.m
//  星座魔女
//
//  Created by lisa on 16/3/19.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import "BaseViewController.h"
#import "FlatUIKit.h"
#import "UITabBar+FlatUI.h"
#import "UIImage+FlatUI.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"toutu"] forBarMetrics:UIBarMetricsDefault] ;
//    [[UIToolbar appearance] setBackgroundImage:[UIImage imageNamed:@"banner"] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    
}

@end

//
//  MonthCell.h
//  Constellation
//
//  Created by lisa on 16/3/27.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MonthCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *health;
@property (weak, nonatomic) IBOutlet UILabel *money;
@property (weak, nonatomic) IBOutlet UILabel *love;
@property (weak, nonatomic) IBOutlet UILabel *work;
@property (weak, nonatomic) IBOutlet UILabel *all;


@end

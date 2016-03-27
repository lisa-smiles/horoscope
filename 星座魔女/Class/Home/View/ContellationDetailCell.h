//
//  showContellationCell.h
//  星座魔女
//
//  Created by lisa on 16/3/18.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContellationDetailCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ConsImageView;
@property (weak, nonatomic) IBOutlet UILabel *ConsName;
@property (weak, nonatomic) IBOutlet UILabel *ConsDataInterval;

@end

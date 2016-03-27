//
//  showConstellationsViewController.m
//  星座魔女
//
//  Created by lisa on 16/3/17.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import "ConstellationsController.h"
#import "ContellationDetailCell.h"
#import "HoroscopeController.h"
#import "BaseViewController.h"

@interface ConstellationsController () <UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *ConsCollectionView;
@property (nonatomic, strong) NSArray *allConsImages;
@property (nonatomic, strong) NSArray *allConsNames;
@property (nonatomic, strong) NSArray *allDateInterval;

@end
static NSString * const cellidentifier= @"cell";

@implementation ConstellationsController

- (NSArray *)allConsImages {
    if (!_allConsImages) {
        _allConsImages = @[@"白羊座",@"金牛座",@"双子座",@"巨蟹座",@"狮子座",@"处女座",@"天秤座",@"天蝎座",@"射手座",@"摩羯座",@"水瓶座",@"双鱼座"];
    }
       return _allConsImages;
}

- (NSArray *)allConsNames {
    if (!_allConsNames) {
         _allConsNames = self.allConsImages;
    }
    return _allConsNames;
}

- (NSArray *)allDateInterval {
    if (!_allDateInterval) {
        
       _allDateInterval = @[@"3.21 ~ 4.19",@"4.20 ~ 5.20",@"5.21 ~ 6.21",@"6.22 ~ 7.22",@"7.23 ~ 8.22",@"8.23 ~ 9.22",@"9.23 ~ 10.23",@"10.24 ~ 11.22",@"11.23 ~ 12.21",@"12.22 ~ 1.19",@"1.20 ~ 2.18",@"2.19 ~ 3.20"];
    }
    
    return _allDateInterval;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.ConsCollectionView registerNib:[UINib nibWithNibName:@"ContellationDetailCell" bundle:nil] forCellWithReuseIdentifier:cellidentifier];
    self.ConsCollectionView.delegate = self;
    self.ConsCollectionView.dataSource = self;
    self.edgesForExtendedLayout = NO;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"toutu"] forBarMetrics:UIBarMetricsDefault];
    [self.tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"banner"]];
//    [self.tabBarController.tabBar setBackgroundColor:[UIColor lightGrayColor]];
    self.ConsCollectionView.translatesAutoresizingMaskIntoConstraints = NO;//???
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
           ContellationDetailCell *cellItem = [collectionView dequeueReusableCellWithReuseIdentifier:cellidentifier forIndexPath:indexPath];
    
//        [[NSBundle mainBundle]loadNibNamed:@"ConstellationsCollectionViewCell" owner:self options:nil];
    
        UIImage *image = [UIImage imageNamed:self.allConsImages[indexPath.row]];
        cellItem.ConsImageView.image = image;
        cellItem.ConsName.text = self.allConsNames[indexPath.row];
        cellItem.ConsDataInterval.text = self.allDateInterval[indexPath.row];
        cellItem.backgroundColor = [UIColor clearColor];
    return cellItem;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    UIViewController *descriptionView = [self.storyboard instantiateViewControllerWithIdentifier:@""];
    //解析出来的参数赋值
    HoroscopeController *today = [self.storyboard instantiateViewControllerWithIdentifier:@"TodayVC"];
    //[self.storyboard instantiateViewControllerWithIdentifier:@"TodayVC"]
    today.ConsName = self.allConsNames[indexPath.row];
    [self.navigationController pushViewController:today animated:YES];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width = (self.view.bounds.size.width-30)/2;
    return CGSizeMake(width, width);
}



//-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return YES;
//}

@end

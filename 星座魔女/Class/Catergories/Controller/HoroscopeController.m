//
//  TodayHoroscopeTableViewController.m
//  星座魔女
//
//  Created by lisa on 16/3/26.
//  Copyright © 2016年 lisa. All rights reserved.
//

#import "HoroscopeController.h"
#import "NetworkingManager.h"
#import "TableViewCell1.h"
#import "TableViewCell2.h"
#import "TableViewCell3.h"
#import "DayHoroscope.h"
#import "WeekHoroscope.h"
#import "ConstellationsController.h"
#import "MonthCell.h"
#import "MonthHoroscope.h"

@interface HoroscopeController ()

@property (nonatomic, strong) DayHoroscope *dayHoroscope;
@property (nonatomic, strong) WeekHoroscope *weekHoroscope;
@property (nonatomic, strong) MonthHoroscope *monthHoroscope;
@property (nonatomic, assign) enum types type;

@property (weak, nonatomic) IBOutlet UIImageView *headerImage;

@property (weak, nonatomic) IBOutlet UILabel *headerConsName;
@property (weak, nonatomic) IBOutlet UILabel *headerDate;
@property (nonatomic, strong) NSArray *naviTitle;

@property (strong, nonatomic) IBOutlet UIButton *titleButton;
@property (strong, nonatomic) IBOutlet UIView *buttonView;

//@property (weak, nonatomic) IBOutlet UIView *HeaderView;
//@property (weak, nonatomic) IBOutlet UITableView *TableView;
@end

@implementation HoroscopeController

static const CGFloat buttonHeight = 40;

- (NSArray *)naviTitle {
    if (!_naviTitle) {
        _naviTitle = @[@"今日运势", @"明日运势", @"本周运势", @"下周运势", @"本月运势", @"本年运势"];
    }
    return _naviTitle;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    self.type = Today;
    [self getHoroscopeData];
    
    self.titleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    self.titleButton.frame = CGRectMake(0, 0, 100, buttonHeight);
    self.titleButton.backgroundColor = [UIColor clearColor];
    
    
    [self.titleButton setTitle:self.naviTitle[0] forState:UIControlStateNormal];
    [self.titleButton addTarget:self action:@selector(dropDownSwitch) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = self.titleButton;
    self.titleButton.titleLabel.font = [UIFont systemFontOfSize:17];
    self.buttonView = [UIView new];
    
   self.buttonView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, buttonHeight * self.naviTitle.count);
    
    for (int i = 0; i < self.naviTitle.count; i++) {
//        self.buttonView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, buttonHeight * i);
        UIButton *button = [UIButton new];
        button.frame = CGRectMake(0, buttonHeight*i, [UIScreen mainScreen].bounds.size.width, buttonHeight);
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitle:self.naviTitle[i] forState:UIControlStateNormal];
        button.tag = i;
        [button addTarget:self action:@selector(dropDownButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tintColor = [UIColor whiteColor];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.buttonView addSubview:button];
    }
    //设置view透明度
    self.buttonView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8];
    [self.view addSubview:self.buttonView];
    
    [self.buttonView setHidden:YES];
    
;
}




- (void)dropDownSwitch {
    [self.buttonView setHidden:![self.buttonView isHidden]];
}

- (void)dropDownButtonClick:(UIButton *)button {
    
    [self.titleButton setTitle:self.naviTitle[button.tag] forState:UIControlStateNormal];
    
    [self dropDownSwitch];
    
    switch (button.tag) {
        case 0:
            self.type = Today;
            break;
        case 1:
            self.type = Tomorrow;
            break;
        case 2:
            self.type = Week;
            break;
        case 3:
            self.type = NextWeek;
            break;
        case 4:
            self.type = Month;
            break;
        case 5:
            self.type = Year;
        default:
            break;
    }
    
    [self getHoroscopeData];
}

-(void) getHoroscopeData {
    
    [NetworkingManager getHoroscope:self.ConsName withType:self.type withSuccess:^(id responseObject) {
        switch (self.type) {
            case Today:
            case Tomorrow:{
                self.dayHoroscope = (DayHoroscope *)responseObject;
                self.headerConsName.text = self.dayHoroscope.name;
                self.headerDate.text = self.dayHoroscope.datetime;
                self.headerImage.image = [UIImage imageNamed:self.dayHoroscope.name];
            }
                break;
                
            case Week:
            case NextWeek:{
                self.weekHoroscope = (WeekHoroscope *)responseObject;
                self.headerConsName.text = self.weekHoroscope.name;
                self.headerDate.text = self.weekHoroscope.date;
                self.headerImage.image = [UIImage imageNamed:self.weekHoroscope.name];
            }
                break;
                
            case Month:
            {
                self.monthHoroscope = (MonthHoroscope *)responseObject;
                self.headerConsName.text = self.monthHoroscope.name;
                self.headerDate.text = self.monthHoroscope.date;
                self.headerImage.image = [UIImage imageNamed:self.monthHoroscope.name];

            }
                
                break;
                
            case Year:
                
                break;
                
            default:
                break;
        }
        
        
        [self.tableView reloadData];
    } withFailure:^(NSError *error) {
        
    }];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (self.type == Today || self.type == Tomorrow) {
       return 2;
    }
    return 1;
    
}

- (IBAction)BackListAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    tableView.allowsSelection = NO;

    switch (self.type) {
        case Today:
        case Tomorrow:{
            if (indexPath.row == 0) {
                TableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
                cell.userInteractionEnabled = NO;
                cell.allHor.text        = self.dayHoroscope.all;
                cell.workHor.text       = self.dayHoroscope.work;
                cell.LuckColor.text     = self.dayHoroscope.color;
                cell.numberHor.text     = [NSString stringWithFormat:@"%@", self.dayHoroscope.number];
                cell.loveHor.text       = self.dayHoroscope.love;
                cell.healthNum.text     = self.dayHoroscope.health;
                cell.QContellation.text = self.dayHoroscope.QFriend;
                cell.healthNum.text     = self.dayHoroscope.health;
                cell.moneyHor.text      = self.dayHoroscope.money;
                cell.selectionStyle     = UITableViewCellSelectionStyleNone;
                
                return cell;
                
            } else {
                
                TableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
                
                cell.summaryTextView.userInteractionEnabled = NO;
                cell.summaryTextView.text = self.dayHoroscope.summary;
                
                return cell;
            }
        }
        case Week:
        case NextWeek:{
            
        TableViewCell3 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
            cell.health.text = self.weekHoroscope.health;
            cell.job.text = self.weekHoroscope.job;
            cell.money.text = self.weekHoroscope.money;
            cell.love.text = self.weekHoroscope.love;
            cell.work.text = self.weekHoroscope.work;
        NSLog(@"...");
            return cell;
        }
            
            
        case Month:
        {
            
            MonthCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell4" forIndexPath:indexPath];
            cell.health.text = self.monthHoroscope.health;
            cell.all.text = self.monthHoroscope.all;
            cell.money.text = self.monthHoroscope.money;
            cell.love.text = self.monthHoroscope.love;
            cell.work.text = self.monthHoroscope.work;
//            NSLog(@"...");
            
            return cell;
        }
            
          
        case Year:
            
            break;
            
        default:
            break;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.type == Today || self.type == Tomorrow) {
        return 150;
    }
    return [UIScreen mainScreen].bounds.size.height - 120;
}

@end

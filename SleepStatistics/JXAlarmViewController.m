//
//  JXAlarmViewController.m
//  SleepStatistics
//
//  Created by kiveen.zhao on 16/8/26.
//  Copyright © 2016年 kiveen.zhao. All rights reserved.
//

#import "JXAlarmViewController.h"

typedef enum : NSInteger {
    JXAlarmPageBtnLeft = 0,
    /**left*/
    JXAlarmPageBtnRight = 1,
    /**right*/
    JXAlarmPageBtnStart = 2,
    /**startBtn*/
    
}JXAlarmPageBtnTag;

@interface JXAlarmViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnLeft;
@property (weak, nonatomic) IBOutlet UIButton *btnRight;
@property (weak, nonatomic) IBOutlet UIDatePicker *timePacker;

@property (weak, nonatomic) IBOutlet UILabel *labelTime;
@property (weak, nonatomic) IBOutlet UIButton *btnStart;
@end

@implementation JXAlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view. sleepBackground
    
    UIImage *bgImage = [UIImage imageNamed:@"sleepBackground.png"];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:bgImage];

    [_btnLeft setImage:[UIImage imageNamed:@"icon_alarm_on"] forState:UIControlStateNormal];
    [_btnLeft setImage:[UIImage imageNamed:@"icon_alarm_off"] forState:UIControlStateSelected];
//    [_btnLeft setTitle:@"闹钟关闭" forState:UIControlStateNormal];
    _btnLeft.titleLabel.text = @"闹钟关闭";
    [self packerChanged:_timePacker];
}

- (void)btnClickLeft {
}


- (IBAction)btnClicked:(UIButton *)btn{
    NSInteger tag = btn.tag;
    switch (tag) {
        case JXAlarmPageBtnLeft:
            btn.selected = !btn.selected;
            if (btn.selected) {
                _timePacker.hidden = YES;
                _btnRight.hidden = YES;
                _labelTime.text = @"无闹钟，仅分析睡眠";
            }else{
                btn.titleLabel.text = nil;
                _timePacker.hidden = NO;
                _btnRight.hidden = NO;
                [self packerChanged:_timePacker];
            }
            break;
        case JXAlarmPageBtnRight:
            NSLog(@"t1");
            break;
        case JXAlarmPageBtnStart:
            NSLog(@"t2");
            break;
            
        default:
            break;
    }
    
}

#pragma mark - 实现oneDatePicker的监听方法
- (IBAction)packerChanged:(UIDatePicker *)sender {
    NSDate *selectTime = [sender date]; // 获取被选中的时间
    //假定默认设置区间20min
    NSTimeInterval min = 20*60;
    NSDate *selectTime2 = [selectTime dateByAddingTimeInterval: min];
    
    NSDateFormatter *selectDateFormatter = [[NSDateFormatter alloc] init];
    selectDateFormatter.dateFormat = @"HH:mm"; // 设置时间和日期的格式
    NSString *timeStart = [selectDateFormatter stringFromDate:selectTime]; // 把date类型转为设置好格式的string类型
    NSString *timeEnd = [selectDateFormatter stringFromDate:selectTime2];
    
    _labelTime.text = [NSString stringWithFormat:@"叫床时间范围 %@ - %@", timeStart, timeEnd];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

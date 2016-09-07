//
//  JXConfig.h
//  SleepStatistics
//
//  Created by kiveen.zhao on 16/8/27.
//  Copyright © 2016年 kiveen.zhao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JXConstant.h"

@interface JXConfig : NSObject

/**选择的音乐*/
@property (nonatomic, strong) NSString *mp2Name;
/**振动选项*/
@property (nonatomic, assign) JXVibrateOptions vibrateOption;
/**socket的dic*/
//@property (atomic, retain) NSMutableDictionary *socketDic;


/**获取单例对象*/
+ (instancetype)shareInstance;

/**重置单例对象*/
+ (void)resetInstance;

@end

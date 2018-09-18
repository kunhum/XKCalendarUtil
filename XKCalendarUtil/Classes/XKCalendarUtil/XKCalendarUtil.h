//
//  XKCalendarUtil.h
//  PinShangHome
//
//  Created by Nicholas on 2018/3/28.
//  Copyright © 2018年 com.xiaopao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalendarHeader.h"

@interface XKCalendarUtil : NSObject

///获取年
+ (NSArray *)xk_getYears;

///获取公历天
+ (NSArray *)xk_getSolarDays;
///获取公历月份
+ (NSArray *)xk_getSolarMonths;

///获取农历天
+ (NSArray *)xk_getLunarDays;
///获取农历月份
+ (NSArray *)xk_getLunarMonths;

/**
 获取农历天数

 @param year 年
 @param month 月
 @return 天数
 */
+ (NSInteger)xk_getLunarDaysWithYear:(NSInteger)year month:(NSInteger)month;

/**
 获取公历天数

 @param year 年
 @param month 月
 @return 天数
 */
+ (NSInteger)xk_getSolarDaysWithYear:(NSInteger)year month:(NSInteger)month;

/**
 根据年月获取天数

 @param year 年
 @param month 月
 @param lunar 是否农历
 @return 天数
 */
+ (NSInteger)xk_getNumberOfDaysInMonthWithYear:(NSInteger)year month:(NSInteger)month lunar:(BOOL)lunar;

/**
 根据日期字符串获取NSDate对象

 @param strDate 字符串 YYYY+MM+dd HH:mm:ss
 @return nsdate对象
 */
+ (NSDate *)xk_getDateWithDateString:(NSString *)strDate;

///获取天干地支
+ (NSString *)xk_getChineseYear:(NSDate *)date;

///获取农历时辰
+ (NSArray *)xk_getChineseHour;

///转换为公历
+ (Solar *)xk_convertLunarToSolarWithYear:(int)year month:(int)month day:(int)day;

///转换为农历
+ (Lunar *)xk_convertSolarToLunarWithYear:(int)year month:(int)month day:(int)day;

///公历转正常格式日期
+ (NSDate *)xk_convertSolarToDate:(Solar *)solar;
///农历转正常格式日期
+ (NSDate *)xk_convertLunarToDate:(Lunar *)lunar;

@end

//
//  XKCalendarUtil.m
//  PinShangHome
//
//  Created by Nicholas on 2018/3/28.
//  Copyright © 2018年 com.xiaopao. All rights reserved.
//

#import "XKCalendarUtil.h"

static long lunarInfo[] = {
    0x04bd8, 0x04ae0, 0x0a570, 0x054d5, 0x0d260, 0x0d950, 0x16554, 0x056a0, 0x09ad0, 0x055d2, 0x04ae0, 0x0a5b6, 0x0a4d0, 0x0d250, 0x1d255, 0x0b540, 0x0d6a0, 0x0ada2, 0x095b0, 0x14977, 0x04970, 0x0a4b0, 0x0b4b5, 0x06a50, 0x06d40, 0x1ab54, 0x02b60, 0x09570, 0x052f2, 0x04970, 0x06566, 0x0d4a0, 0x0ea50, 0x06e95, 0x05ad0, 0x02b60, 0x186e3, 0x092e0, 0x1c8d7, 0x0c950, 0x0d4a0, 0x1d8a6, 0x0b550, 0x056a0, 0x1a5b4, 0x025d0, 0x092d0, 0x0d2b2, 0x0a950, 0x0b557, 0x06ca0, 0x0b550, 0x15355, 0x04da0, 0x0a5d0, 0x14573, 0x052d0, 0x0a9a8, 0x0e950, 0x06aa0, 0x0aea6, 0x0ab50, 0x04b60, 0x0aae4, 0x0a570, 0x05260, 0x0f263, 0x0d950, 0x05b57, 0x056a0, 0x096d0, 0x04dd5, 0x04ad0, 0x0a4d0, 0x0d4d4, 0x0d250, 0x0d558, 0x0b540, 0x0b5a0, 0x195a6, 0x095b0, 0x049b0, 0x0a974, 0x0a4b0, 0x0b27a, 0x06a50, 0x06d40, 0x0af46, 0x0ab60, 0x09570, 0x04af5, 0x04970, 0x064b0, 0x074a3, 0x0ea50, 0x06b58, 0x055c0, 0x0ab60, 0x096d5, 0x092e0, 0x0c960, 0x0d954, 0x0d4a0, 0x0da50, 0x07552, 0x056a0, 0x0abb7, 0x025d0, 0x092d0, 0x0cab5, 0x0a950, 0x0b4a0, 0x0baa4, 0x0ad50, 0x055d9, 0x04ba0, 0x0a5b0, 0x15176, 0x052b0, 0x0a930, 0x07954, 0x06aa0, 0x0ad50, 0x05b52, 0x04b60, 0x0a6e6, 0x0a4e0, 0x0d260, 0x0ea65, 0x0d530, 0x05aa0, 0x076a3, 0x096d0, 0x04bd7, 0x04ad0, 0x0a4d0, 0x1d0b6, 0x0d250, 0x0d520, 0x0dd45, 0x0b5a0, 0x056d0, 0x055b2, 0x049b0, 0x0a577, 0x0a4b0, 0x0aa50, 0x1b255, 0x06d20, 0x0ada0
    
};

@implementation XKCalendarUtil

#pragma mark 获取年
+ (NSArray *)xk_getYears {
    
    NSMutableArray *array = [NSMutableArray array];
//    1950---2050
    for (int i = 1950; i < 2051; i++) {
        [array addObject:[NSString stringWithFormat:@"%d",i]];
    }
    return array;
    
}

#pragma mark 根据年月获取天数
+ (NSInteger)xk_getNumberOfDaysInMonthWithYear:(NSInteger)year month:(NSInteger)month lunar:(BOOL)lunar {
    
    //农历
    if (lunar) {
        return [self xk_getLunarDaysWithYear:year month:month];
    }
    return [self xk_getSolarDaysWithYear:year month:month];
}

#pragma mark 获取阳历天数
+ (NSInteger)xk_getSolarDaysWithYear:(NSInteger)year month:(NSInteger)month {
    
    NSString *dateStr = [NSString stringWithFormat:@"%ld-%ld-01 17:00:00",year,month];
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    
    return range.length;
}

#pragma mark 获取农历天数
+ (NSInteger)xk_getLunarDaysWithYear:(NSInteger)year month:(NSInteger)month {
    
    if ((lunarInfo[year - 1900] & (0x10000 >> month)) == 0) {
        return 29;
    }
    return 30;
}

#pragma mark 农历月份
+ (NSArray *)xk_getLunarMonths {
    return @[@"正月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"冬月",@"腊月"];
}

#pragma mark 获取农历天
+ (NSArray *)xk_getLunarDays {
    return @[@"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",@"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",@"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十"];
}

#pragma mark 获取公历月份
+ (NSArray *)xk_getSolarMonths {
    return @[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12"];
}

#pragma mark 获取公历天
+ (NSArray *)xk_getSolarDays {
    NSMutableArray *days = [NSMutableArray arrayWithCapacity:31];
    for (int i = 1; i < 32; i++) {
        [days addObject:[NSString stringWithFormat:@"%02d",i]];
    }
    return days;
}

#pragma mark 根据日期字符串获取NSDate对象
+ (NSDate *)xk_getDateWithDateString:(NSString *)strDate {
    NSString *timeStr = [NSString stringWithFormat:@"%@-05-01 17:00:00",strDate];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *date = [formatter dateFromString:timeStr];
    return date;
}

#pragma mark 获取天干地支
+ (NSString *)xk_getChineseYear:(NSDate *)date {
    
    NSArray *chineseYears = [NSArray arrayWithObjects:
                             @"甲子", @"乙丑", @"丙寅", @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉",
                             @"甲戌",   @"乙亥",  @"丙子",  @"丁丑", @"戊寅",   @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未",
                             @"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳",
                             @"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸丑",
                             @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",
                             @"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",  @"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥", nil];
    
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    
    NSDateComponents *components = [localeCalendar components:unitFlags fromDate:date];
    
    NSString *yearStr = chineseYears[components.year-1];
    
    return yearStr;
}

#pragma mark 获取农历时辰
+ (NSArray *)xk_getChineseHour {
    return @[@"子时 23:00~00:59",@"丑时 01:00~02:59",@"寅时 03:00~04:59",@"卯时 05:00~06:59",@"辰时 07:00~08:59",@"巳时 09:00~10:59",@"午时 11:00~12:59", @"未时 13:00~14:59", @"申时 15:00~16:59", @"酉时 17:00~18:59", @"戌时 19:00~20:59", @"亥时 21:00~22:59",@"不清楚"];
}

#pragma mark 转换为公历
+ (Solar *)xk_convertLunarToSolarWithYear:(int)year month:(int)month day:(int)day {
    Lunar *lunar = [[Lunar alloc] initWithYear:year andMonth:month andDay:day];
    return [CalendarDisplyManager obtainSolarFromLunar:lunar];
}

#pragma mark 转换为农历
+ (Lunar *)xk_convertSolarToLunarWithYear:(int)year month:(int)month day:(int)day {
    Solar *solar = [[Solar alloc] initWithYear:year andMonth:month andDay:day];
    return [CalendarDisplyManager obtainLunarFromSolar:solar];
}

#pragma mark 公历转正常格式日期
+ (NSDate *)xk_convertSolarToDate:(Solar *)solar {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [NSDateComponents new];
    components.year  = solar.solarYear;
    components.month = solar.solarMonth;
    components.day   = solar.solarDay;
    return [calendar dateFromComponents:components];
}
#pragma mark 农历转正常格式日期
+ (NSDate *)xk_convertLunarToDate:(Lunar *)lunar {
    //先转公历
    Solar *solar = [self xk_convertLunarToSolarWithYear:lunar.lunarYear month:lunar.lunarMonth day:lunar.lunarDay];
    return [self xk_convertSolarToDate:solar];
}

@end

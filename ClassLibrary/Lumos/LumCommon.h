//
//  LumCommon.h
//  TestApp
//
//  Created by chingment on 15/8/8.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DDLog.h"
#import "DDASLLogger.h"
#import "DDTTYLogger.h"
#import "DDFileLogger.h"
@interface LumCommon : NSObject

//将十六进制字符串转UIColor
+(UIColor *) toColorWithHexString: (NSString *) stringToConvert;
//将RGB转UIColor
+(UIColor *) toColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
//设置UITextField下划线
+(void)setUITextFieldUnderLine:(UITextField *)textField;
@end
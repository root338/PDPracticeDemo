//
//  ChangeApplicationLanguage.h
//  soho
//
//  Created by 345 on 14/11/6.
//  Copyright (c) 2014年 Chinamobo. All rights reserved.
//

/**
 设置应用语言
 */

#import <Foundation/Foundation.h>

//通知视图改变语言宏
#define ChangeLanguageNotification @"applicationChangeLanguageNotification"

//NSUserDefaults 存储应用语言的key值
#define AppLanguage @"appLanguage"

//定义快捷的转换语言宏
#define CustomLocalizedStringComment(key, comment) \
[[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:[[NSUserDefaults standardUserDefaults] objectForKey:AppLanguage] ofType:@"lproj"]] localizedStringForKey:(key) value:@"" table:nil]
//使用默认的strings文件改变语言
#define CustomLocalizedString(key) CustomLocalizedStringComment((key), @"")

///中文
#define CN_LANGUAGE @"zh-Hans"

///英文
#define EN_LANGUAGE @"en"

@interface ChangeApplicationLanguage : NSObject

/**设置应用语言*/
+ (void)setupApplicaitonLanguage:(NSString *)languageName;

/**
 同步系统语言
 */
+ (void)synchronousSystemLanguage;

/**
 获取当前设置的语言环境 接口条件下输出
 
 en_US  英文环境
 zh_CN  中文环境
 当为其他语言传入中文标识
 */
+ (NSString *)currentApplicationLocales;

/**
 获取当前设置的语言环境
 */
+ (NSString *)currentApplicationLanguage;

/**
 判断当前语言设置是中文
 */
+ (BOOL)verificationLanguageIsChinese;
@end

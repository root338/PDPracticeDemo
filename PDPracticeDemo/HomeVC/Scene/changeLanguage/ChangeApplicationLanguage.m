//
//  ChangeApplicationLanguage.m
//  soho
//
//  Created by 345 on 14/11/6.
//  Copyright (c) 2014年 Chinamobo. All rights reserved.
//

#import "ChangeApplicationLanguage.h"


//NSUserDefaults 对象
#define UserDefaults [NSUserDefaults standardUserDefaults]
@implementation ChangeApplicationLanguage

+ (void)setupApplicaitonLanguage:(NSString *)languageName
{
    
    NSString *currentLanguage = [UserDefaults objectForKey:AppLanguage];
    if ([languageName isEqualToString:currentLanguage]) {
        return;
    }

    if ([languageName isEqualToString:EN_LANGUAGE]) {
        [UserDefaults setObject:EN_LANGUAGE forKey:AppLanguage];
    }else if ([languageName isEqualToString:CN_LANGUAGE]){
        [UserDefaults setObject:CN_LANGUAGE forKey:AppLanguage];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:ChangeLanguageNotification object:nil];
}

+ (void)synchronousSystemLanguage
{
    if ([self currentApplicationLanguage]) {
        return;
    }
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *string = [languages objectAtIndex:0];
    
    if ([string isEqualToString:CN_LANGUAGE]) {
        [UserDefaults setObject:CN_LANGUAGE forKey:AppLanguage];
    }else {
        [UserDefaults setObject:EN_LANGUAGE forKey:AppLanguage];
    }
}

+ (NSString *)currentApplicationLocales
{
    NSString *currentLanguage = [UserDefaults objectForKey:AppLanguage];
    if ([currentLanguage isEqualToString:EN_LANGUAGE]) {
        return @"en_US";
    }else {
        return @"zh_CN";
    }
}

+ (NSString *)currentApplicationLanguage
{
    return [UserDefaults objectForKey:AppLanguage];
}

+ (BOOL)verificationLanguageIsChinese
{
    if ([[self currentApplicationLanguage] isEqualToString:CN_LANGUAGE]) {
        return YES;
    }else {
        return NO;
    }
}
@end

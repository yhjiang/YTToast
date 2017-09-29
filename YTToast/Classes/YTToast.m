//
//  YTToast.m
//  RainbowLive
//
//  Created by Jyh on 2017/5/27.
//  Copyright © 2017年 JYH. All rights reserved.
//

#import "YTToast.h"

#import <CRToast/CRToast.h>

@interface YTToast()

// background Color
@property (strong, nonatomic) UIColor *alertBgColor;
@property (strong, nonatomic) UIColor *successBgColor;
@property (strong, nonatomic) UIColor *errorBgColor;

// text Color
@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIColor *subTextColor;

// text Font
@property (strong, nonatomic) UIFont *textFont;
@property (strong, nonatomic) UIFont *subTextFont;

// alert Image
@property (strong, nonatomic) UIImage *alertImage;
@property (strong, nonatomic) UIImage *successImage;
@property (strong, nonatomic) UIImage *errorImage;

@end

@implementation YTToast

+ (instancetype)manager {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

+ (void)load
{
    [CRToastManager setDefaultOptions:@{kCRToastNotificationTypeKey : @(CRToastTypeNavigationBar),
                                        kCRToastFontKey             : [UIFont systemFontOfSize:16],
                                        kCRToastTextColorKey        : [UIColor whiteColor],
                                        kCRToastAutorotateKey       : @(YES)}];
}

# pragma mark - 显示方法

+ (void)showError:(NSString *)errorText
{
    [[self class] showError:errorText withOptions:nil completionBlock:nil];
}

+ (void)showError:(NSString *)errorText withOptions:(NSDictionary*)options completionBlock:(void (^)(void))completion
{
    NSMutableDictionary *muOptions;
    if (!options) {
        muOptions = [[[self class] defaultErrorOption] mutableCopy];
    } else {
        muOptions = [options mutableCopy];
    }
   
    if (errorText) {
        muOptions[kCRToastTextKey] = errorText;
    }
    if ([CRToastManager isShowingNotification]) {
        // 假如有toast正在显示，返回
        return;
    }
    [CRToastManager showNotificationWithOptions:muOptions completionBlock:completion];
}

+ (void)showAlert:(NSString *)alertText
{
    [[self class] showAlert:alertText withOptions:nil completionBlock:nil];
}

+ (void)showAlert:(NSString *)alertText withOptions:(NSDictionary*)options completionBlock:(void (^)(void))completion
{
    NSMutableDictionary *muOptions;
    if (!options) {
        muOptions = [[[self class] defaultAlertOption] mutableCopy];
    } else {
        muOptions = [options mutableCopy];
    }
    
    if (alertText) {
        muOptions[kCRToastTextKey] = alertText;
    }
    
    if ([CRToastManager isShowingNotification]) {
        // 假如有toast正在显示，返回
        return;
    }
    [CRToastManager showNotificationWithOptions:muOptions completionBlock:completion];
}

+ (void)showSuccess:(NSString *)successText
{
    [[self class] showSuccess:successText withOptions:nil completionBlock:nil];
}

+ (void)showSuccess:(NSString *)successText withOptions:(NSDictionary*)options completionBlock:(void (^)(void))completion
{
    NSMutableDictionary *muOptions;
    if (!options) {
        muOptions = [[[self class] defaultSuccessOption] mutableCopy];
    } else {
        muOptions = [options mutableCopy];
    }
    
    if (successText) {
        muOptions[kCRToastTextKey] = successText;
    }
    
    if ([CRToastManager isShowingNotification]) {
        // 假如有toast正在显示，返回
        return;
    }
    [CRToastManager showNotificationWithOptions:muOptions completionBlock:completion];
}

# pragma mark - 隐藏方法

+ (void)dismiss
{
    [CRToastManager dismissNotification:YES];
}

# pragma mark - 基本配置

+ (NSDictionary *)defaultOption
{
    
    NSMutableDictionary *options = [
                                    @{kCRToastNotificationTypeKey               : @(CRToastTypeNavigationBar),
                                      kCRToastAnimationInDirectionKey           : @(0),
                                      kCRToastAnimationOutDirectionKey          : @(0),
                                      kCRToastImageAlignmentKey                 : @(CRToastAccessoryViewAlignmentLeft),
                                      kCRToastTimeIntervalKey                   : @(2),
                                      kCRToastTextAlignmentKey                  : @(CRToastAccessoryViewAlignmentLeft),
                                      kCRToastNotificationPresentationTypeKey   : @(CRToastPresentationTypeCover),
                                      kCRToastUnderStatusBarKey                 : @(YES),
                                      } mutableCopy];
    
    if ([YTToast manager].textColor) {
        options[kCRToastTextColorKey] = [YTToast manager].textColor;
    }
    
    if ([YTToast manager].textFont) {
        options[kCRToastFontKey] = [YTToast manager].textFont;
    }
    
    if ([YTToast manager].subTextColor) {
        options[kCRToastSubtitleTextColorKey] = [YTToast manager].subTextColor;
    }
    
    if ([YTToast manager].subTextFont) {
        options[kCRToastSubtitleFontKey] = [YTToast manager].subTextFont;
    }
    
    return [NSDictionary dictionaryWithDictionary:options];

}

+ (NSDictionary *)defaultErrorOption
{
    NSMutableDictionary *muOptions = [[[self class] defaultOption] mutableCopy];
    
    // 提示icon
    muOptions[kCRToastImageKey] = [YTToast manager].errorImage ? [YTToast manager].errorImage : [UIImage imageNamed:@"alert_icon"];
    // 背景色
    muOptions[kCRToastBackgroundColorKey] = [YTToast manager].errorBgColor ? [YTToast manager].errorBgColor : [UIColor redColor];
    
    return [NSDictionary dictionaryWithDictionary:muOptions];
}

+ (NSDictionary *)defaultAlertOption
{
    NSMutableDictionary *muOptions = [[[self class] defaultOption] mutableCopy];
    
    // 提示icon
    muOptions[kCRToastImageKey] = [YTToast manager].alertImage ? [YTToast manager].alertImage : [UIImage imageNamed:@"alert_icon"];
    // 背景色
    muOptions[kCRToastBackgroundColorKey] = [YTToast manager].alertBgColor ? [YTToast manager].alertBgColor : [UIColor orangeColor];
    
    return [NSDictionary dictionaryWithDictionary:muOptions];
}

+ (NSDictionary *)defaultSuccessOption
{
    NSMutableDictionary *muOptions = [[[self class] defaultOption] mutableCopy];
    // 提示icon
    muOptions[kCRToastImageKey] = [YTToast manager].successImage ? [YTToast manager].successImage : [UIImage imageNamed:@"white_checkmark"];
    
    // 背景色
    muOptions[kCRToastBackgroundColorKey] = [YTToast manager].successBgColor ? [YTToast manager].successBgColor : [UIColor whiteColor];
    
    return [NSDictionary dictionaryWithDictionary:muOptions];
}

+ (void)customConfigWithAlertBgColor:(UIColor *)alertColor
                      successBgColor:(UIColor *)successColor
                        errorBgColor:(UIColor *)errorColor
                           textColor:(UIColor *)textColor
                        subTextColor:(UIColor *)subTextColor
                            textFont:(UIFont *)textFont
                         subTextFont:(UIFont *)subTextFont
                          alertImage:(UIImage *)alertIcon
                        successImage:(UIImage *)successIcon
                          errorImage:(UIImage *)errorIcon
{

    if (alertColor) {
        [YTToast manager].alertBgColor = alertColor;
    }
    if (successColor) {
        [YTToast manager].successBgColor = successColor;
    }
    if (errorColor) {
        [YTToast manager].errorBgColor = errorColor;
    }
    if (textColor) {
        [YTToast manager].textColor = textColor;
    }
    if (subTextColor) {
        [YTToast manager].subTextColor = subTextColor;
    }
    if (textFont) {
        [YTToast manager].textFont = textFont;
    }
    if (subTextFont) {
        [YTToast manager].subTextFont = subTextFont;
    }
    if (alertIcon) {
        [YTToast manager].alertImage = alertIcon;
    }
    if (successIcon) {
        [YTToast manager].successImage = successIcon;
    }
    if (errorIcon) {
        [YTToast manager].errorImage = errorIcon;
    }
}

# pragma mark - 是否正在显示
+ (BOOL)isShowingNotification
{
    return [CRToastManager isShowingNotification];
}


@end

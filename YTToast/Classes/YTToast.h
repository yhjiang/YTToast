//
//  YTToast.h
//  RainbowLive
//
//  Created by Jyh on 2017/5/27.
//  Copyright © 2017年 JYH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTToast : NSObject

# pragma mark - 显示方法
+ (void)showError:(NSString *)errorText;

+ (void)showError:(NSString *)errorText withOptions:(NSDictionary*)options completionBlock:(void (^)(void))completion;

+ (void)showAlert:(NSString *)alertText;

+ (void)showAlert:(NSString *)alertText withOptions:(NSDictionary*)options completionBlock:(void (^)(void))completion;

+ (void)showSuccess:(NSString *)successText;

+ (void)showSuccess:(NSString *)successText withOptions:(NSDictionary*)options completionBlock:(void (^)(void))completion;

# pragma mark - 隐藏方法
+ (void)dismiss;


# pragma mark - 基本配置
+ (NSDictionary *)defaultOption;

+ (NSDictionary *)defaultErrorOption;

+ (NSDictionary *)defaultAlertOption;

+ (NSDictionary *)defaultSuccessOption;

+ (void)customConfigWithAlertBgColor:(UIColor *)alertColor
                      successBgColor:(UIColor *)successColor
                        errorBgColor:(UIColor *)errorColor
                           textColor:(UIColor *)textColor
                        subTextColor:(UIColor *)subTextColor
                            textFont:(UIFont *)textFont
                         subTextFont:(UIFont *)subTextFont
                          alertImage:(UIImage *)alertIcon
                        successImage:(UIImage *)successIcon
                          errorImage:(UIImage *)errorIcon;

# pragma mark - 是否正在显示
+ (BOOL)isShowingNotification;

@end

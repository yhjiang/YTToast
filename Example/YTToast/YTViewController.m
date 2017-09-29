//
//  YTViewController.m
//  YTToast
//
//  Created by yhjiang on 09/28/2017.
//  Copyright (c) 2017 yhjiang. All rights reserved.
//

#import "YTViewController.h"
#import "YTToast.h"
@interface YTViewController ()

- (IBAction)successAction:(UIButton *)sender;
- (IBAction)alertAction:(UIButton *)sender;
- (IBAction)errorAction:(UIButton *)sender;
- (IBAction)hideAction:(UIButton *)sender;

@end

@implementation YTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"YTToastSource" ofType:@"bundle"];
    NSString *strC = [[NSBundle bundleWithPath:sourcePath] pathForResource:@"alert_icon" ofType:@"png"];
	// Do any additional setup after loading the view, typically from a nib.
    UIImage *alertImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"alert_icon" ofType:@"png"]];
    UIImage *errorImage = [UIImage imageNamed:@"alert_icon.png"];
    UIImage *successImage = [UIImage imageNamed:@"alert_icon"];
    UIImage *successImage1 = [UIImage imageWithContentsOfFile:strC];
    [YTToast customConfigWithAlertBgColor:[UIColor orangeColor] successBgColor:[UIColor greenColor] errorBgColor:[UIColor redColor] textColor:[UIColor whiteColor] subTextColor:nil textFont:nil subTextFont:nil alertImage:alertImage successImage:successImage errorImage:errorImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)successAction:(UIButton *)sender {
    [YTToast showSuccess:@"我是成功的提示"];
}

- (IBAction)alertAction:(UIButton *)sender {
    [YTToast showAlert:@"我是普通的提示"];
}

- (IBAction)errorAction:(UIButton *)sender {
    [YTToast showError:@"我是错误的提示"];
}

- (IBAction)hideAction:(UIButton *)sender {
    [YTToast dismiss];
}
@end

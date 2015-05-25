//
//  SettingViewController.m
//  Notification
//
//  Created by Jame on 15/5/25.
//  Copyright (c) 2015年 SSIC. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController () <UITextFieldDelegate>

@end

@implementation SettingViewController
{
    UITextField *_textField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initNavigationBar];
    [self initTextField];
}

- (void)initNavigationBar
{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftClick:)];
    leftItem.tintColor = [UIColor orangeColor];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)leftClick:(UIBarButtonItem *)leftItem
{
    [self.navigationController popViewControllerAnimated:YES];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:_textField.text,@"userName", nil];
    NSNotification *notification = [[NSNotification alloc] initWithName:@"noti" object:nil userInfo:dict];
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)initTextField
{
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(50, (ECSCREEN_H - 50)/2, ECSCREEN_W - 100, 50)];
    
    _textField.delegate = self;
    _textField.placeholder = @"请输入您的姓名";
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    
    [self.view addSubview:_textField];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_textField resignFirstResponder];
    return YES;
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

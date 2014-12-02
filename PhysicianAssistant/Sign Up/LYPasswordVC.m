//
//  LYPasswordVC.m
//  PhysicianAssistant
//  完成注册
//  Created by langyi on 14/12/2.
//  Copyright (c) 2014年 wangliang. All rights reserved.
//

#import "LYPasswordVC.h"

@interface LYPasswordVC () <UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate> {
    
    NSArray *pickerArray;
}
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UITextField *thirdText;
@property (weak, nonatomic) IBOutlet UIButton *signButton;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *pickerViewLabel;

@end

@implementation LYPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.signButton.layer.cornerRadius = 5.0f;
    
    self.passwordText.secureTextEntry = YES;
    self.passwordText.clearsOnBeginEditing = YES;
    
    self.thirdText.secureTextEntry = YES;
    self.thirdText.clearsOnBeginEditing = YES;
    
    self.pickerView.delegate = self;
    
    pickerArray = [NSArray arrayWithObjects:@"科室",@"外科",@"内科",@"医学科",@"脑壳",@"儿科", nil];
    
    self.pickerView.hidden = YES;
    
    UITapGestureRecognizer *Gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeKeyboard)];
    [self.view addGestureRecognizer:Gesture];

}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)closeKeyboard {
    
    [self.passwordText resignFirstResponder];
    [self.thirdText resignFirstResponder];
    self.pickerView.hidden = YES;
}
//完成注册Button
- (IBAction)signButton:(id)sender {
    if (self.passwordText.text != self.thirdText.text) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"两次输入密码不相同！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
        [alert show];
    }
}

#pragma mark UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.passwordText) {
        [self.passwordText resignFirstResponder];
        [self.thirdText becomeFirstResponder];
    }else if (textField == self.thirdText){
        
        [self.thirdText resignFirstResponder];
    }
    return YES;
}

#pragma mark UIPickerView dataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [pickerArray count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    
}

@end

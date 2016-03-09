//
//  RegisterViewController.m
//  20160308登陆Demo
//
//  Created by zf on 16/3/8.
//  Copyright © 2016年 PY. All rights reserved.
//
#define kAlphaNum   @"0123456789"
#import "RegisterViewController.h"
#import "AFNetworking/AFHTTPSessionManager.h"
@interface RegisterViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (assign,getter=isRegister)BOOL pyRegister;
@property (assign)int a;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pyRegister = NO;
    self.a = 0;
    self.phoneTextField.delegate = self;
//    self.phoneTextField.keyboardType
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (self.a < 11)
    {
        if ([self validateNumber:string] && [self judgeLength])
        {
            return YES;

        }
        else
        {
            return  NO;
        }
    }
    else
    {
        return NO;
    }
}
-(BOOL)judgeLength
{
    if (self.phoneTextField.text.length < 10)
    {
        NSLog(@"%lu",self.phoneTextField.text.length);
        return YES;
    }
    else
    {
        return NO;
    }
}
- (BOOL)validateNumber:(NSString*)number
{
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length)
    {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}
- (IBAction)selectButton:(UIButton *)sender
{
    self.pyRegister = YES;
}
- (IBAction)nextButton:(UIButton *)sender
{
    if (self.pyRegister)
    {
        int val;
        
        NSScanner *scan = [NSScanner scannerWithString:self.phoneTextField.text];
        if ([scan scanInt:&val])//判断是否是纯数字.
        {
                NSLog(@"%@",self.phoneTextField.text);
            AFHTTPSessionManager *sessionManger = [AFHTTPSessionManager new];
            NSString *url = @"";
            NSDictionary *parameters = [NSDictionary dictionary];
            NSError *error = nil;
            [sessionManger POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress)
            {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
            {
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
            }];
//            [[AFHTTPRequestSerializer serializer]requestWithMethod:@"post" URLString:url parameters:parameters error:&error];
        }
        else
        {
            NSLog(@"非数字");
        }
    }
    else
    {
        NSLog(@"没有阅读文件");
    }
    
  }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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

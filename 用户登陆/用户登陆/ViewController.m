//
//  ViewController.m
//  用户登陆
//
//  Created by 张安康 on 2019/9/29.
//  Copyright © 2019 zak. All rights reserved.
//

#import "ViewController.h"
#include <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)login:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.username.layer.borderColor=[[UIColor greenColor] CGColor];
    self.password.layer.borderColor=[[UIColor yellowColor] CGColor];
    self.password.layer.borderWidth=2.0;
    self.username.layer.borderWidth=2.0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(id)sender {
   //读取用户名文本框的文本属性
   NSString *un = self.username.text;
   //读取密码文本框的文本属性
    NSString *pwd= self.password.text;
    if ([un isEqualToString:@""]||[pwd isEqualToString:@""]){
        [self showmessage:@"账号或密码为空"];//弹出报空提示框
    }else if(![un isEqualToString:@"2446608531"]||![pwd isEqualToString:@"zak520"])
    {
        [self showmessage:@"用户名或密码错误"];
        }
    else if ([un isEqualToString:@"2446608531"]&&[pwd isEqualToString:@"zak5201314"])
    {
        [self showmessage:@"登陆成功"];
    }
    
}
-(void)showmessage:(NSString *) message{
    UIAlertController *alertc= [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *certain = [UIAlertAction actionWithTitle:@"回去登陆" style:UIAlertActionStyleDefault handler:nil];
    [alertc addAction:certain];
    [self presentViewController:alertc animated:YES completion:nil];
}
@end

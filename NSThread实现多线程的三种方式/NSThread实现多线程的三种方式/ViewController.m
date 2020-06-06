//
//  ViewController.m
//  NSThread实现多线程的三种方式
//
//  Created by 张安康 on 2020/3/14.
//  Copyright © 2020 张安康康康康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//点击屏幕时调用的方法
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self threadDemo1];
    [self threadDemo2];
    [self threadDemo3];
}

//对象方法创建线程
-(void)threadDemo1
{
    //创建线程对象
   NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(demo:) object:@"多线程技术"];
    
    //开启线程对象
    [thread start];
}
//类方法创建线程
-(void)threadDemo2
{
    //detach:分离
    //无法获得当前对象，自动开启线程
    [NSThread detachNewThreadSelector:@selector(demo:) toTarget:self withObject:@"多线程教程"];
}
//隐式创建
-(void)threadDemo3
{
    //方便任何继承自NSObject的对象都能够开启线程
    [self performSelectorInBackground:@selector(demo:) withObject:@"多线程康康技术"];
}
//指定子线程执行方式
-(void)demo:(id)param
{
    //查看当前线程
    NSLog(@"%@ %@",param,[NSThread currentThread]);
}

@end

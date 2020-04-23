//
//  ViewController.m
//  GCD初体验
//
//  Created by 张安康 on 2020/3/19.
//  Copyright © 2020 张安康康康康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

//GCD的核心：就是将任务添加到队列中
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self GCDDemo3];
}

//线程之间的通信
-(void)GCDDemo3
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"下载中...%@",[NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"更新UI：%@",[NSThread currentThread]);
        });
    });
    
}

// 简写
-(void)GCDDemo2
{
    //创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    //创建任务
    
    
    //将任务添加到队列
    dispatch_async(queue, ^{
        NSLog(@"%@",[NSThread currentThread]);
    });
    
}

//GCD
-(void)GCDDemo
{
    //创建队列
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    // 创建任务
    void(^task)(void) = ^{
        NSLog(@"%@",[NSThread currentThread]);
    };
    
    //参数1:队列
    //参数2:封装任务任务
    //将异步任务添加到队列中
    dispatch_async(queue, task);
}


@end

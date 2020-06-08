//
//  ViewController.m
//  线程安全
//
//  Created by 张安康 on 2020/3/15.
//  Copyright © 2020 张安康康康康. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//总票数（共享资源）
@property (assign,nonatomic)int tickets;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tickets = 20;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSThread *thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(sellTickets) object:nil];
    thread1.name = @"t1";
    [thread1 start];
    NSThread *thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(sellTickets) object:nil];
    thread2.name = @"t2";
    [thread2 start];
}
//模拟买票
-(void)sellTickets
{
    while (YES) {
        //互斥锁/同步锁 ： 可以保证被锁定的代码，在同一时间内只有一条线程可以操作
        //锁定的范围：数据的读写，锁定的范围一定要越小越好
        //self: 全局的锁对象，锁对象就是任何继承自NSObject的对象都可以是锁对象，因为每一个对象内部都有一把锁，默认是开启的
        //锁对象一定要是全局的，self是最方便的锁对象
        
        @synchronized (self) {
            //获取余票数
            if (self.tickets > 0) {//有票
                //模拟网络延迟
                [NSThread sleepForTimeInterval:1.0];
                
                //卖一张
                self.tickets = self.tickets - 1;
                
                //剩余的票数
                NSLog(@"余票 %d %@",self.tickets,[NSThread currentThread]);
            }
            else
            {
                //无票
                NSLog(@"没票了");
                //跳出循环
                break;
            }
        }
        
    }
}

@end

//
//  ViewController.m
//  开关控件实现gif加载
//
//  Created by 张安康 on 2019/10/10.
//  Copyright © 2019 zak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;//在应用程序中嵌入Web内容的视图
- (IBAction)sender:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"img03" ofType:@"gif"];//构造文件名的字符串并返回由指定名称和文件扩展名标识的完整路径名
    NSURL *url = [NSURL fileURLWithPath:path];//初始化并将新创建的nsurl对象作为具有指定路径的文件url返回。
    NSData *data = [NSData dataWithContentsOfURL:url];//返回一个数据对象，该对象包含来自url指定位置的数据流
    NSURL *baseurl = [url URLByDeletingLastPathComponent];//通过接收并删除最后一个路径创建一个基础url
    [self.webView loadData:data MIMEType:@"image/gif" textEncodingName:@"utf-8" baseURL:baseurl];//加载gif图片
    //设置它的主要内容，模拟类型，内容编码，和基础url。
}


- (IBAction)sender:(id)sender {
    if (![sender isOn]) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"img04" ofType:@"gif"];//构造文件名的字符串并返回由指定名称和文件扩展名标识的完整路径名
        NSURL *url = [NSURL fileURLWithPath:path];//初始化并将新创建的nsurl对象作为具有指定路径的文件url返回。
        NSData *data = [NSData dataWithContentsOfURL:url];//返回一个数据对象，该对象包含来自url指定位置的数据流
        NSURL *baseurl = [url URLByDeletingLastPathComponent];//通过接收并删除最后一个路径创建一个基础url
        [self.webView loadData:data MIMEType:@"image/gif" textEncodingName:@"utf-8" baseURL:baseurl];//加载gif图片
        //设置它的主要内容，模拟类型，内容编码，和基础url。
    }
    else
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"img03" ofType:@"gif"];
        NSURL *url = [NSURL fileURLWithPath:path];
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSURL *baseurl = [url URLByDeletingLastPathComponent];
        [self.webView loadData:data MIMEType:@"image/gif" textEncodingName:@"utf-8" baseURL:baseurl];

    }
}
@end

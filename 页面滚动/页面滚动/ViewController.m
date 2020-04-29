//
//  ViewController.m
//  页面滚动
//
//  Created by 西鹏 on 2019/10/29.
//  Copyright © 2019 dxp. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong,nonatomic) UIScrollView *scrollview;
@property (strong,nonatomic) UIImageView *iamgeview;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.scrollview];
    [self.scrollview addSubview:self.iamgeview];
    //进入viewDidLoad，把scrollView添加到控制器视图，把imageView添加到scrollView。
    
}
//懒加载并初始化ui控件属性
-(UIImageView *)iamgeview
{
    if (!_iamgeview) {
        UIImage *image = [UIImage imageNamed:@"image.jpg"];
        //初始化image
        _iamgeview = [[UIImageView alloc]initWithImage:image];
        //使用initWithImage:方法初始化imageView。用这种方法初始化的图片视图其大小与图片大小一致
    }
    return _iamgeview;
}
-(UIScrollView *)scrollview
{
    if (!_scrollview) {
        //初始化、配置scrollview
        _scrollview = [[UIScrollView alloc] initWithFrame:self.view.bounds];//指定大小和控制器保持一致
        _scrollview.backgroundColor = [UIColor whiteColor];
        _scrollview.contentSize = self.iamgeview.frame.size;
        _scrollview.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;//默认contentSize为整个imageView的大小。最后设定scrollView的autoresizingMask为UIViewAutoresizingFlexibleWidth和UIViewAutoresizingFlexibleHeight，这样在屏幕旋转时，scrollView就可以自动调整布局。
    }
    return _scrollview;
}
@end

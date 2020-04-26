//
//  ViewController.m
//  选项系统app
//
//  Created by 张安康 on 2019/10/22.
//  Copyright © 2019 zak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong)NSArray *foods ;
@property (weak, nonatomic) IBOutlet UILabel *guozi;
@property (weak, nonatomic) IBOutlet UILabel *zhushi;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;


- (IBAction)random:(id)sender;
- (IBAction)certain:(id)sender;
- (IBAction)cancel:(id)sender;

@end

@implementation ViewController
//懒加载数组
-(NSArray *)foods
{
    if (_foods == nil) {
        _foods = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"foods" ofType:@"plist"]];
    }
    return _foods;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0 ;i < 2 ; i++) {
        [self pickerView:nil didSelectRow:0 inComponent:i];
    }

}
//总共有多少列
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
        return self.foods.count;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSArray *subfood = self.foods[component];
    return subfood.count;
}
//第component列的第row行显示文字内容
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.foods[component][row];
}
//选中第component列的第row行
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    //将选中行文本显示到对应的label
    if (component == 0)
    {
        self.guozi.text = self.foods[component][row];
        NSDictionary *dit1=[NSDictionary dictionaryWithObjectsAndKeys:@"初始.jpg",@"起源",@"风.jpg",@"源计划：风",@"林.jpg",@"源计划：林",@"火.jpg",@"源计划：火",@"山.jpg",@"源计划：山",@"雷.jpg",@"源计划：雷",@"阴.jpg",@"源计划：阴",nil];
        NSString *str1=(NSString *)[dit1 objectForKey:_guozi.text];
        _img1.image=[UIImage imageNamed:str1];
        /*if ([self.guozi.text  isEqual: @"源计划：风"]) {
            _img1.image=[UIImage imageNamed:@"风.jpg"];
        }
        else if ([self.guozi.text  isEqual: @"源计划：林"]) {
            _img1.image=[UIImage imageNamed:@"林.jpg"];
        }
        else if ([self.guozi.text  isEqual: @"源计划：火"]) {
            _img1.image=[UIImage imageNamed:@"火.jpg"];
        }
        else if ([self.guozi.text  isEqual: @"源计划：山"]) {
            _img1.image=[UIImage imageNamed:@"山.jpg"];
        }
        else if ([self.guozi.text  isEqual: @"源计划：阴"]) {
            _img1.image=[UIImage imageNamed:@"阴.jpg"];
        }
        else if ([self.guozi.text  isEqual: @"起源"]) {
            _img1.image=[UIImage imageNamed:@"初始.jpg"];
        }
        else if ([self.guozi.text  isEqual: @"源计划：雷"]) {
            _img1.image=[UIImage imageNamed:@"雷.jpg"];
        }*/
    }
    else if (component == 1)
    {
    self.zhushi.text = self.foods[component][row];
       NSDictionary *dit2=[NSDictionary dictionaryWithObjectsAndKeys:@"猎杀.jpg",@"猎杀",@"净化.jpg",@"源计划：净化",@"联合.jpg",@"源计划：联合",@"升华.jpg",@"源计划：升华",@"毁灭.jpg",@"源计划：毁灭",@"裁决.jpg",@"源计划：裁决",nil];
      NSString *tmpstr=(NSString *)[dit2 objectForKey:_zhushi.text];
        _img2.image=[UIImage imageNamed:tmpstr];
        /*if ([self.zhushi.text  isEqual: @"源计划：裁决"]) {
            _img2.image=[UIImage imageNamed:@"裁决.jpg"];
        }
        else if ([self.zhushi.text  isEqual: @"源计划：净化"]) {
            _img2.image=[UIImage imageNamed:@"净化.jpg"];
        }
        else if ([self.zhushi.text  isEqual: @"源计划：升华"]) {
            _img2.image=[UIImage imageNamed:@"升华.jpg"];
        }
        else if ([self.zhushi.text  isEqual: @"源计划：毁灭"]) {
            _img2.image=[UIImage imageNamed:@"毁灭.jpg"];
        }
        else if ([self.zhushi.text  isEqual: @"源计划：联合"]) {
            _img2.image=[UIImage imageNamed:@"联合.jpg"];
        }
        else if ([self.zhushi.text  isEqual: @"猎杀"]) {
            _img2.image=[UIImage imageNamed:@"猎杀.jpg"];
        }*/
    }



}
-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 35;
}
- (IBAction)random:(id)sender {
    for (int component = 0; component < self.foods.count; component++) {
        int count = (int)[self.foods[component]count];
        int oldrow = (int)[self.pickerView selectedRowInComponent:component];
        int row = oldrow;
        while (row == oldrow) {
            row = arc4random()%count;
        }
        [self.pickerView selectRow:row inComponent:component animated:YES];
        [self pickerView:nil didSelectRow:row inComponent:component];
    }
}

- (IBAction)certain:(id)sender {
  /*  NSString *path = [[NSBundle mainBundle] resourcePath]; // 工程目录路径
    NSString *imagePath = [NSString stringWithFormat:@"%@/1.png", path];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile: imagePath];
    //图片需要一个载体 才能显示在屏幕上
    UIImageView *imageView = [[UIImageView alloc] initWithImage: image];
    imageView.frame = CGRectMake(10, 100, 300, 300);
    imageView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview: imageView];
*/
    UIAlertController *alt1=[UIAlertController alertControllerWithTitle:@"源计划" message:@"系统自检" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *certain= [UIAlertAction actionWithTitle:@"开始游戏" style:UIAlertActionStyleDefault handler:nil];
    [alt1 addAction:certain];
    [self presentViewController:alt1 animated:YES completion:nil];
}

- (IBAction)cancel:(id)sender {
    //回到初始化的时候
    for (int i = 0; i<2; i++) {
        [self pickerView:nil didSelectRow:0 inComponent:i];
        [self.pickerView selectRow:0 inComponent:i animated:YES];
    }
}

@end

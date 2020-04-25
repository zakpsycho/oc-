//
//  main.m
//  字符串常见操作
//
//  Created by 张安康 on 2019/6/29.
//  Copyright © 2019年 zak. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *str =@"zakssb";
        NSString *str1=@"zakssd";
        NSUInteger strCount =[str length];//获取当前字符串的长度
        NSLog(@"字符串的长度是%lu",strCount);
        for (int i=0; i<strCount; i++) {
            char c =[str characterAtIndex:i];//获取当前位置字符串的字符
            NSLog(@"字符串第%d位为%c",i,c);
            NSLog(@"str:%@",[str uppercaseString]);//字符串全部转换成大写
            NSLog(@"str:%@",[str lowercaseString]);//字符串全部转换成小写
            NSLog(@"str:%@",[str capitalizedString]);//转化为每个词首字母大写
            //字符串完全同等比较
            BOOL result= [str isEqualToString:str1];
            NSLog(@"%d",result);
            //判断字符串是否以另一个字符串开头
            BOOL result1= [str hasPrefix:@"zak"];
            NSLog(@"%d",result1);
            //判断字符串是否以另一个字符串结尾
            BOOL result2= [str hasSuffix:@"kk"];
            NSLog(@"%d",result2);
        }
    }
    return 0;
}

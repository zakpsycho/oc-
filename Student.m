//
//  Student.m
//  封装1
//
//  Created by 张安康 on 2019/6/28.
//  Copyright © 2019年 zak. All rights reserved.
//

#import "Student.h"

@implementation Student
-(void)eat
{
    printf("年龄为%d岁的学生体重为%f斤",_age,_weight);
}
-(void)setWeight:(float)weight
{
    
    if (weight>=100 || weight<=0) {
        printf("体重不合法");
    }
    else
        _weight=weight;
}
-(float)weight
{
    return _weight;
}
-(void)setAge:(int)age
{
    
    if (age<=0) {
        printf("年龄不对你别遭罪");
    }
    else
        _age=age;
}
-(int)age
{
    return _age;
}
@end

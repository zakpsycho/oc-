//
//  main.m
//  封装1
//
//  Created by 张安康 on 2019/6/28.
//  Copyright © 2019年 zak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *stu =[[Student alloc]init];
        [stu setAge:1];
        [stu setWeight:20];
        [stu eat];
    }
    return 0;
}

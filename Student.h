//
//  Student.h
//  封装1
//
//  Created by 张安康 on 2019/6/28.
//  Copyright © 2019年 zak. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Student : NSObject
{
    float _weight;
    int _age;
}
-(void)eat;
-(void)setWeight:(float)weight;
-(float)weight;
-(void)setAge:(int)age;
-(int)age;
@end

NS_ASSUME_NONNULL_END

//
//  TestClass.m
//  TestApp
//
//  Created by chingment on 15/8/1.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import "TestClass.h"

@implementation TestClass
@synthesize name,grade,students;

+(id)students_class{
    return [TestStudent class];
}
@end

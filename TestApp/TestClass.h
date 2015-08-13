//
//  TestClass.h
//  TestApp
//
//  Created by chingment on 15/8/1.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Jastor.h"
#import "TestStudent.h"
@interface TestClass : Jastor
@property (strong,nonatomic) NSString* name;
@property (strong,nonatomic) NSString* grade;
@property (strong,nonatomic) NSArray* students;
+(id)students_class;
@end

//
//  UILumosRegisterView.m
//  TestApp
//
//  Created by chingment on 15/8/8.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import "UILumRegisterView.h"

@implementation UILumRegisterView

@synthesize btnLogin,btnRegister,txtLoginNo,txtLoginPwd,txtUserName;
-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        CGRect frameRect = self.frame;  //获取界面区域

        UIView *viewRegister=[[UIView alloc] init];
        //viewRegister.backgroundColor=[UIColor redColor];
        [self addSubview:viewRegister];
        [viewRegister mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(50);
            make.size.mas_equalTo(CGSizeMake(320, 180));
        }];
        
        
        txtUserName = [[UILumTextField alloc] init];
       // txtUserName.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0 alpha:0.5];
        txtUserName.borderStyle = UITextBorderStyleNone;                        //设置边框类型
        txtUserName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//文字内容 垂直居中，此为UIControl的属性
        txtUserName.placeholder = @"姓名";                                         //设置默认提示文
        txtUserName.keyboardType = UIKeyboardTypeDefault;
        txtUserName.returnKeyType =  UIReturnKeyNext;
        [viewRegister addSubview:txtUserName];
        [txtUserName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(viewRegister);
            make.size.mas_equalTo(CGSizeMake(300, 30));
            make.top.offset(10);//以imagesView作为参考父控件 离父控件10
        }];
        
        txtLoginNo = [[UILumTextField alloc] init];
        //txtLoginNo.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0 alpha:0.5];
        txtLoginNo.borderStyle = UITextBorderStyleNone;                        //设置边框类型
        txtLoginNo.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//文字内容 垂直居中，此为UIControl的属性
        txtLoginNo.placeholder = @"邮箱或中国大陆手机";                                         //设置默认提示文
        txtLoginNo.keyboardType = UIKeyboardTypeASCIICapable;
        //txtLoginNo.delegate=self;
        txtLoginNo.returnKeyType =  UIReturnKeyNext;
        
        [viewRegister addSubview:txtLoginNo];
        
        [txtLoginNo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(viewRegister);
            make.size.mas_equalTo(CGSizeMake(300, 30));
            make.top.mas_equalTo(txtUserName.mas_bottom).offset(10);//以imagesView作为参考父控件 离父控件10
        }];
        
        txtLoginPwd = [[UILumTextField alloc] init];
       // txtLoginPwd.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0 alpha:0.5];
        txtLoginPwd.borderStyle = UITextBorderStyleNone;                        //设置边框类型
        txtLoginPwd.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//文字内容 垂直居中，此为UIControl的属性
        txtLoginPwd.placeholder = @"密码(不少于6位)";                                         //设置默认提示文
        txtLoginPwd.secureTextEntry = YES;//设置为密码格式
        txtLoginPwd.returnKeyType = UIReturnKeyDefault;
        [viewRegister addSubview:txtLoginPwd];
        [txtLoginPwd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(viewRegister);
            make.size.mas_equalTo(CGSizeMake(300, 30));
            make.top.mas_equalTo(txtLoginNo.mas_bottom).offset(10);//以imagesView作为参考父控件 离父控件10
        }];
        
        btnRegister = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnRegister.backgroundColor =[UIColor colorWithRed:68/255.0 green:178/255.0 blue:249/255.0 alpha:1];
        [btnRegister setTitle:@"注册" forState:UIControlStateNormal];
        [btnRegister setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnRegister.layer setCornerRadius:3];//设置按钮圆角
        [viewRegister addSubview:btnRegister];
        [btnRegister mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(viewRegister);
            make.size.mas_equalTo(CGSizeMake(300, 42));
            make.top.mas_equalTo(txtLoginPwd.mas_bottom).offset(10);
        }];
        
        btnLogin= [[UIButton alloc] init];
        [btnLogin setTitle:@"登录帐号" forState:UIControlStateNormal];
        [btnLogin setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:btnLogin];
        [btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(viewRegister);
            make.size.mas_equalTo(CGSizeMake(frameRect.size.width, 50));
            make.top.mas_equalTo(frameRect.size.height-50);
        }];
        
    }
    
    return  self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

//
//  LoginViewController.m
//  TestPro
//
//  Created by chingment on 15/6/12.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import "UILumLoginView.h"
@implementation UILumLoginView

@synthesize btnLogin,btnRegister,txtLoginNo,txtLoginPwd,btnForgetPwd;

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        CGRect frameRect = self.frame;  //获取界面区域
        NSString *imageName = [NSString  stringWithFormat:@"Guide_background_0%d@2x.jpg" ,1];
        UIImage *image = [UIImage imageNamed: imageName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        [self addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);//水平对齐
            make.size.mas_equalTo(CGSizeMake(100, 100));//宽度100 高度100
            make.top.offset(50);//离父视图50
        }];
        
        UILabel *lblBigTitle=[[UILabel alloc] init];
        lblBigTitle.text=@"大标题";
        lblBigTitle.font=[UIFont systemFontOfSize:24.0];//设置字体大小
        lblBigTitle.userInteractionEnabled=YES;
  
        
        
        [self addSubview:lblBigTitle];
        [lblBigTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);//水平对齐
            make.top.equalTo(imageView.mas_bottom).offset(10);//以imagesView作为参考父控件 离父控件10
        }];
        
        UILabel *lblSamllTitle=[[UILabel alloc] init];
        lblSamllTitle.text=@"小标题小标题";
        lblSamllTitle.font=[UIFont systemFontOfSize:16.0];//设置字体大小
        
        [self addSubview:lblSamllTitle];
        [lblSamllTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);//水平对齐
            make.top.equalTo(lblBigTitle.mas_bottom).offset(10);//以imagesView作为参考父控件 离父控件10
        }];
        
        UIView *viewLogin=[[UIView alloc] init];
        // viewLogin.backgroundColor=[UIColor redColor];
        [self addSubview:viewLogin];
        [viewLogin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(lblSamllTitle.mas_bottom).offset(10);
            //make.width.mas_equalTo(100);
            make.size.mas_equalTo(CGSizeMake(320, 200));
        }];
        
        //MASViewAttribute *a= viewLogin.mas_width;
        txtLoginNo = [[UILumTextField alloc] init];
        //txtLoginNo.backgroundColor = [UIColor whiteColor];
        txtLoginNo.borderStyle = UITextBorderStyleNone;                        //设置边框类型
        txtLoginNo.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//文字内容 垂直居中，此为UIControl的属性
        txtLoginNo.placeholder = @"邮箱";                                         //设置默认提示文
        txtLoginNo.keyboardType = UIKeyboardTypeASCIICapable;
        //txtLoginNo.delegate=self;
        txtLoginNo.returnKeyType =  UIReturnKeyNext;
       // [LumCommon setUITextFieldUnderLine:txtLoginNo];
        [viewLogin addSubview:txtLoginNo];
        
        [txtLoginNo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(viewLogin);
            make.size.mas_equalTo(CGSizeMake(300, 42));
            make.top.offset(10);//以imagesView作为参考父控件 离父控件10
        }];
        
        //UILumTextField *AView=[[UILumTextField alloc]  init];
        
        txtLoginPwd = [[UILumTextField alloc] init];
        //txtLoginPwd.backgroundColor = [UIColor whiteColor];
        txtLoginPwd.borderStyle = UITextBorderStyleNone;                        //设置边框类型
        txtLoginPwd.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;//文字内容 垂直居中，此为UIControl的属性
        txtLoginPwd.placeholder = @"密码";                                         //设置默认提示文
        txtLoginPwd.secureTextEntry = YES;//设置为密码格式
        // txtLoginPwd.delegate =self;
        txtLoginPwd.returnKeyType = UIReturnKeyDefault;
        [viewLogin addSubview:txtLoginPwd];
        
        [txtLoginPwd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(viewLogin);
            make.size.mas_equalTo(CGSizeMake(300, 42));
            make.top.mas_equalTo(txtLoginNo.mas_bottom).offset(10);//以imagesView作为参考父控件 离父控件10
        }];
        
       // btnLogin = [[UIButton alloc] init];
        btnLogin= [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btnLogin.backgroundColor =[UIColor colorWithRed:68/255.0 green:178/255.0 blue:249/255.0 alpha:1];
        [btnLogin setTitle:@"登录" forState:UIControlStateNormal];
        [btnLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btnLogin.layer setCornerRadius:3];//设置按钮圆角
        [viewLogin addSubview:btnLogin];
        [btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(viewLogin);
            make.size.mas_equalTo(CGSizeMake(300, 42));
            make.top.mas_equalTo(txtLoginPwd.mas_bottom).offset(10);
        }];
        
        
        btnForgetPwd=[[UIButton alloc] init];
        [btnForgetPwd setTitle:@"忘记密码？" forState:UIControlStateNormal];
        btnForgetPwd.titleLabel.font=[UIFont systemFontOfSize:12.0];//设置字体大小
        btnForgetPwd.titleLabel.textColor=[UIColor blackColor];
        
        [viewLogin addSubview:btnForgetPwd];
        [btnForgetPwd setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];//设置按钮字体颜色
        //btnForgetPwd.backgroundColor=[UIColor redColor];
        [btnForgetPwd mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(viewLogin);//水平对齐
            make.size.mas_equalTo(CGSizeMake(60, 20));
            make.top.equalTo(btnLogin.mas_bottom).offset(10);//以imagesView作为参考父控件 离父控件10
        }];
        
        
        btnRegister= [[UIButton alloc] init];
        //btnRegister.backgroundColor = [UIColor blueColor];
        [btnRegister setTitle:@"注册用户" forState:UIControlStateNormal];
        [btnRegister setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //addTarget:self 设置响应点击事件的对象
        //action:@selector(onTextFieldButtonClicked:) 设置响应点击事件的对象的方法函数，我们在下面会声明这个函数
        [self addSubview:btnRegister];
        [btnRegister mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(viewLogin);
            make.size.mas_equalTo(CGSizeMake(frameRect.size.width, 50));
            make.top.mas_equalTo(frameRect.size.height-50);
        }];
     
    }
    
    return  self;
}


@end

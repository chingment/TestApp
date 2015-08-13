//
//  LoginViewController.h
//  TestPro
//
//  Created by chingment on 15/6/12.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILumKit.h"
#import "LumCommon.h"
//@protocol UILumosLoginViewDelegate;
@interface UILumLoginView : UIView 
//@property (weak,atomic)  id<UILumosLoginViewDelegate> delegate;
@property (nonatomic,strong) UIButton *btnLogin;
@property (nonatomic,strong) UIButton *btnForgetPwd;
@property (nonatomic,strong) UIButton *btnRegister;
@property (nonatomic,strong) UITextField *txtLoginNo;
@property (nonatomic,strong) UITextField *txtLoginPwd;

@end

//@protocol UILumosLoginViewDelegate <NSObject>
//
//@optional
//- (void)loginButtonClicked:(id)sender;
//@end

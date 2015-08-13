//
//  LoginViewController.h
//  TestApp
//
//  Created by chingment on 15/7/7.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILumKit.h"
#import "RegisterViewController.h"
#import "MainTabBarViewController.h"
#import "MainTabBarFirstViewController.h"
#import "MainTabBarSecondViewController.h"
@interface LoginViewController: UIViewController<MBProgressHUDDelegate,UITextFieldDelegate,UIActionSheetDelegate>{
  MBProgressHUD *HUD;
    
}
@property (nonatomic,strong) UITextField *txtLoginNo;
@property (nonatomic,strong) UITextField *txtLoginPwd;
- (void)myTask;
@end

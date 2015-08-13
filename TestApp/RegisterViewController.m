//
//  RegisterViewController.m
//  TestApp
//
//  Created by chingment on 15/8/8.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建登录视图
    UILumRegisterView *view=[[UILumRegisterView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    [view.btnLogin addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view.btnRegister addTarget:self action:@selector(registerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view];
    // Do any additional setup after loading the view.
}


-(void) loginButtonClicked:(id)sender
{
    //加载注册视图控制器
    LoginViewController *viewController = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:viewController animated:NO completion:^{
    }];
    
}


-(void) registerButtonClicked:(id)sender{
   
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

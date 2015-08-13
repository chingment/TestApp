//
//  GuideViewController.m
//  TestApp
//
//  Created by chingment on 15/6/26.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import "GuideViewController.h"

@implementation GuideViewController

@synthesize pageControl;
@synthesize scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor blackColor];
    
    CGRect frameRect = self.view.frame;  //获取界面区域
    UILumGuideView *uILumosGuideView=[[UILumGuideView alloc] initWithFrame:CGRectMake(0,0,frameRect.size.width,frameRect.size.height)];
    
    [uILumosGuideView.btnLogin addTarget:self action:@selector(bottomLoginButtonClick:) forControlEvents:UIControlEventTouchUpInside];//注册按钮Click事件
    [uILumosGuideView.btnRegister addTarget:self action:@selector(bottomRegisterButtonClick:) forControlEvents:UIControlEventTouchUpInside];//注册按钮Click事件
    [self.view addSubview:uILumosGuideView];
    
}

-(void) bottomRegisterButtonClick:(id)sender
{
    //加载注册视图控制器
    RegisterViewController *registerViewController = [[RegisterViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:registerViewController animated:YES completion:^{
    }];
}

-(void) bottomLoginButtonClick:(id)sender
{
    //加载登陆视图控制器
    LoginViewController *loginViewController = [[LoginViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:loginViewController animated:YES completion:^{
    }];
    
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

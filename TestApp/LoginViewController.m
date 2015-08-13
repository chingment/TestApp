//
//  LoginViewController.m
//  TestApp
//
//  Created by chingment on 15/7/7.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import "LoginViewController.h"
#import "UILumTextField.h"

@implementation LoginViewController
@synthesize txtLoginNo,txtLoginPwd;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建登录视图
    UILumLoginView *view=[[UILumLoginView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    
    //登录和忘记密码Click事件
    [view.btnLogin addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view.btnForgetPwd addTarget:self action:@selector(forgetPwdButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view.btnRegister addTarget:self action:@selector(registerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    //注册键盘响应事件方法
    //[view.txtLoginNo addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    //[view.txtLoginPwd addTarget:self action:@selector(nextOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    view.txtLoginNo.delegate=self;
    view.txtLoginPwd.delegate=self;
    
    txtLoginNo=view.txtLoginNo;
    txtLoginPwd=view.txtLoginPwd;
    
    //从沙盒中获取 账号和密码
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    NSString *loginNo=[userDefaults objectForKey:@"loginNo"];
    txtLoginNo.text=loginNo;
    NSString *loginPwd=[userDefaults objectForKey:@"loginPwd"];
    txtLoginPwd.text=loginPwd;
    
    
    //添加手势，点击屏幕其他区域关闭键盘的操作
//    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
//    gesture.numberOfTapsRequired = 1;
//    [self.view addGestureRecognizer:gesture];
    [self.view addSubview:view];
    
    
    //[self.view addSubview:AView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loginButtonClicked:(id)sender
{
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    
    HUD.delegate = self;
    HUD.labelText = @"正在登录";
    HUD.square = YES;
    
    [HUD showWhileExecuting:@selector(myTask) onTarget:self withObject:nil animated:YES];
    
    NSString *loginNo=txtLoginNo.text;
    NSString *loginPwd=txtLoginPwd.text;
    NSUserDefaults *userDefaults=[NSUserDefaults standardUserDefaults];
    [userDefaults setObject:loginNo forKey:@"loginNo"];
    [userDefaults setObject:loginPwd forKey:@"loginPwd"];
    
    
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    MainTabBarFirstViewController *testOne1 = [[MainTabBarFirstViewController alloc] init];
    [items addObject:testOne1];
    MainTabBarSecondViewController *twoController = [[MainTabBarSecondViewController alloc] init];
    [items addObject:twoController];
    
    
    
//    MainTabBarViewController *mainTabBarViewController = [[MainTabBarViewController alloc]init];
//    
//    [mainTabBarViewController setTitle:@"TabBarController"];
//    [mainTabBarViewController setViewControllers:items];
//    [self presentViewController:mainTabBarViewController animated:YES completion:nil];
    //  [self.view.window setRootViewController:mainTabBarViewController];
    
    
    
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
    //                                                    message:@"您是否要删除该信息？"
    //                                                   delegate:nil
    //                                          cancelButtonTitle:@"取消"
    //                                          otherButtonTitles:@"OK",@"Hello",@"World", nil];
    //
    //    alert.tag = 0;
    //    [alert show];
    
}

-(void) forgetPwdButtonClicked:(id)sender{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:@"取消"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"重设密码", @"手机验证登录",nil];
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackOpaque;
    [actionSheet showInView:self.view];
}


-(void) registerButtonClicked:(id)sender{
    //加载注册视图控制器
    RegisterViewController *registerViewController = [[RegisterViewController alloc] initWithNibName:nil bundle:nil];
    [registerViewController setModalTransitionStyle:UIModalTransitionStyleCoverVertical];//设置转入动画效果
    [self presentViewController:registerViewController animated:NO completion:nil];
}

- (void)myTask {
    // Do something usefull in here instead of sleeping ...
    //sleep(3);
}

//
//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [[IQKeyboardManager sharedManager] setShouldToolbarUsesTextFieldTintColor:YES];
//}
//
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    [[IQKeyboardManager sharedManager] setShouldToolbarUsesTextFieldTintColor:NO];
//}

////UITextField的协议方法，当开始编辑时监听
//-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    NSTimeInterval animationDuration=0.30f;
//    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
//    [UIView setAnimationDuration:animationDuration];
//    float width = self.view.frame.size.width;
//    float height = self.view.frame.size.height;
//    //上移30个单位，按实际情况设置
//    CGRect rect=CGRectMake(0.0f,-180,width,height);
//    self.view.frame=rect;
//    [UIView commitAnimations];
//    return YES;
//}
//
////恢复原始视图位置
//-(void)resumeView
//{
//    NSTimeInterval animationDuration=0.30f;
//    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
//    [UIView setAnimationDuration:animationDuration];
//    float width = self.view.frame.size.width;
//    float height = self.view.frame.size.height;
//    //如果当前View是父视图，则Y为20个像素高度，如果当前View为其他View的子视图，则动态调节Y的高度
//    float Y = 0.0f;
//    CGRect rect=CGRectMake(0.0f,Y,width,height);
//    self.view.frame=rect;
//    [UIView commitAnimations];
//}
//
////隐藏键盘的方法
//-(void)hidenKeyboard
//{
//    [txtLoginNo resignFirstResponder];
//    [txtLoginPwd resignFirstResponder];
//    [self resumeView];
//}
//
////点击键盘上的Return按钮响应的方法
//-(IBAction)nextOnKeyboard:(UITextField *)sender
//{
//    if (sender == self.txtLoginNo) {
//        [self.txtLoginPwd becomeFirstResponder];
//    }else if (sender == self.txtLoginPwd){
//        [self hidenKeyboard];
//    }
//}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

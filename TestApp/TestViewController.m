//
//  TestViewController.m
//  TestApp
//
//  Created by chingment on 15/8/1.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import "TestViewController.h"
#define HOSTURL @"http://192.168.1.105/NetDemo/index.php";
@interface TestViewController ()

@end

@implementation TestViewController
@synthesize username,password;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.window.backgroundColor=[UIColor blueColor];
    
    
    
    //json字符串转model
    NSString *resultStr = @"{\"name\": \"一班\",\"grade\":\"99级\",\"students\":[{\"name\":\"李理\",\"sex\":\"男\",\"age\":20}]}";
    NSData* jsonData = [resultStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *resultDict = [jsonData objectFromJSONData];
    TestClass* c = [[TestClass alloc]initWithDictionary:resultDict];
    
    UILabel *lblSamllTitle=[[UILabel alloc] init];
    lblSamllTitle.text=c.name;
    lblSamllTitle.font=[UIFont systemFontOfSize:16.0];//设置字体大小
    lblSamllTitle.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:lblSamllTitle];
    [lblSamllTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(320, 150));
    }];
    
    
    
    UILabel *txt1 = [[UILabel alloc] initWithFrame:CGRectMake(30,100,70,30)];
    [txt1 setText:@"用户名"];
    [txt1 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:txt1];
    
    UILabel *txt2 = [[UILabel alloc] initWithFrame:CGRectMake(30,140,70,30)];
    [txt2 setText:@"密   码"];
    [txt2 setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:txt2];
    
    username = [[UITextField alloc]initWithFrame:CGRectMake(120,100, 150, 30)];
    [username setBorderStyle:UITextBorderStyleRoundedRect];
    [self.view addSubview:username];
    
    password = [[UITextField alloc]initWithFrame:CGRectMake(120,140, 150, 30)];
    [password setBorderStyle:UITextBorderStyleRoundedRect];
    [password setSecureTextEntry:YES];
    [self.view addSubview:password];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"提交" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [btn setFrame:CGRectMake(90, 180, 150, 40)];
    [self.view addSubview:btn];
    
    
  
    // self.view.backgroundColor=[UIColor redColor];
    // Do any additional setup after loading the view.
}

-(void) login:(id)sender
{
    //表单提交前的验证
    if (username.text == nil||password.text==nil ) {
        //[tooles MsgBox:@"用户名或密码不能为空！"];
        return;
    }
    //隐藏键盘
    [username resignFirstResponder];
    [password resignFirstResponder];

    
  //  [tooles showHUD:@"正在登陆...."];
    NSString *urlstr = HOSTURL;
    NSURL *myurl = [NSURL URLWithString:urlstr];
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:myurl];
    //设置表单提交项
    [request setPostValue:username.text forKey:@"username"];
    [request setPostValue:username.text forKey:@"password"];
    [request setDelegate:self];
    [request setDidFinishSelector:@selector(GetResult:)];
    [request setDidFailSelector:@selector(GetErr:)];
    [request startAsynchronous];
    
    
}

- (void)GetResult:(ASIHTTPRequest *)request{
    
   // [tooles removeHUD];
    NSData *data =[request responseData];
    NSDictionary *dictionary = [data objectFromJSONData];
//    <p class="p1"><span class="s1">    </span><span class="s2">//</span>输出接收到的字符串</p><p class="p2"><span class="s4">    NSString</span><span class="s3"> *str = [</span><span class="s4">NSString</span><span class="s3"> </span>stringWithUTF8String<span class="s3">:[data </span>bytes<span class="s3">]];</span></p><p class="p3">    <span class="s5">NSLog</span>(<span class="s6">@"%@"</span>,str);</p><p class="p1"><span class="s1">    </span><span class="s2">//</span>判断是否登陆成功</p>
    if ([dictionary objectForKey:@"yes"]) {
        NSLog(@"YES");
        //[tooles MsgBox:[dictionary objectForKey:@"yes"]];
       return;
    }else if ([dictionary objectForKey:@"error"] != [NSNull null]) {
        NSLog(@"error");
        //[tooles MsgBox:[dictionary objectForKey:@"error"]];
        return;
    }
    
}

//连接错误调用这个函数
- (void) GetErr:(ASIHTTPRequest *)request{
    
    NSLog(@"网络错误,连接不到服务器");
   // [tooles removeHUD];
    
   // [tooles MsgBox:@"网络错误,连接不到服务器"];
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
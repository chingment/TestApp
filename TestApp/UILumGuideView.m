//
//  GuideView.m
//  TestApp
//
//  Created by chingment on 15/7/2.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import "UILumGuideView.h"


@implementation UILumGuideView

@synthesize pageControl;
@synthesize scrollView;
@synthesize btnLogin;
@synthesize btnRegister;

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

-(id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        CGRect frameRect = self.frame;  //获取界面区域
        
        //构造scrollView
        scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0,0,frameRect.size.width,frameRect.size.height)];
        [self addSubview:scrollView];
        
        NSInteger scrollViewChildCount=5;
        for (int i = 0; i < scrollViewChildCount; i++) {
            NSString *imageName = [NSString  stringWithFormat:@"Guide_background_0%d@2x.jpg" ,i];
            UIImage *image = [UIImage imageNamed: imageName];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake(i*frameRect.size.width, 0, frameRect.size.width, frameRect.size.height);
            [scrollView addSubview:imageView];
        }
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.contentSize = CGSizeMake(scrollViewChildCount*frameRect.size.width, frameRect.size.height);
        scrollView.bounces=NO;
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        
        //构造pageControl
        pageControl=[[UIPageControl alloc] init];
        // pageControl=  [[UIPageControl alloc] initWithFrame:CGRectMake(0, frameRect.size.height - 100, frameRect.size.width, 20)];
        pageControl.numberOfPages = scrollViewChildCount;//页面数目
        pageControl.currentPage = 0;//当前页面索引
        //[pageControl addTarget:self action:@selector(onPointClick) forControlEvents:UIControlEventValueChanged];
        //pageControl.backgroundColor=[UIColor redColor];
        [self addSubview:pageControl];
        [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(frameRect.size.width,20));//定义宽度为设备的宽度
            make.left.mas_equalTo(0);//必须定义left 不然会出现兼容性问题
            make.top.mas_equalTo(frameRect.size.height-100);//定义离top为设备的高度－100
            
        }];
        
        
        //构造底部按钮视图
        UIView *viewBottom=[[UIView alloc]  init];
        //UIView *bottomView=[[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
        viewBottom.backgroundColor=[UIColor whiteColor];
        viewBottom.alpha=0.5;//设置背景透明度
        [self addSubview:viewBottom];
        
        CGFloat bottomViewHeight=50;//定义为bottomViewHeight50
        [viewBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(frameRect.size.width, bottomViewHeight));
            make.left.mas_equalTo(0);//必须定义left 不然会出现兼容性问题
            make.top.mas_equalTo(frameRect.size.height-bottomViewHeight);
        }];
        
        //注册按钮
        btnRegister=[[UIButton alloc] init];
        btnRegister.backgroundColor=[UIColor whiteColor];
        [btnRegister setTitle:@"注册" forState:UIControlStateNormal];
        [btnRegister setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        //bottomRegisterButton.titleLabel.font=[UIFont systemFontOfSize:24.0];
        //  [bottomRegisterButton addTarget:self action:@selector(bottomRegisterButtonClick:) forControlEvents:UIControlEventTouchUpInside];//注册按钮Click事件
        //登录按钮
        btnLogin=[[UIButton alloc] init];
        btnLogin.backgroundColor=[UIColor whiteColor];
        [btnLogin setTitle:@"登录" forState:UIControlStateNormal];
        [btnLogin setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        //[bottomLoginButton addTarget:self action:@selector(bottomLoginButtonClick:) forControlEvents:UIControlEventTouchUpInside];//注册按钮Click事件
        
        [viewBottom addSubview:btnLogin];
        [viewBottom addSubview:btnRegister];
        
        [btnRegister mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(viewBottom.mas_centerY);
            make.left.equalTo(viewBottom.mas_left).with.offset(0);
            make.right.equalTo(btnLogin.mas_left).with.offset(0);
            make.height.mas_equalTo(bottomViewHeight);//高度为bottomView的高度
        }];
        
        [btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(viewBottom.mas_centerY);
            make.left.equalTo(btnRegister.mas_right).with.offset(0);
            make.right.equalTo(viewBottom.mas_right).with.offset(0);
            make.height.mas_equalTo(bottomViewHeight);
            make.width.mas_equalTo(btnRegister);//高度为bottomView的高度
        }];
        
    }
    return  self;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)sender
{
    int pageNum = sender.contentOffset.x / sender.frame.size.width;
    pageControl.currentPage = pageNum;
}




@end

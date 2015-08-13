//
//  GuideViewController.h
//  TestApp
//
//  Created by chingment on 15/6/26.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "UILumKit.h"
@interface GuideViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) UIScrollView *scrollView;

@end

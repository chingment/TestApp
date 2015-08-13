//
//  GuideView.h
//  TestApp
//
//  Created by chingment on 15/7/2.
//  Copyright (c) 2015年 chingment. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILumKit.h"
@interface UILumGuideView : UIView<UIScrollViewDelegate>

@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIButton *btnRegister;
@property (nonatomic,strong) UIButton *btnLogin;

@end

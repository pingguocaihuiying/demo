//
//  MainViewController.m
//  直播
//
//  Created by apple on 2017/1/13.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "MyViewController.h"
#import "UIView+LYMExtension.h"
#import "MGNavController.h"
#import "UIImage+Extension.h"
#import "FindViewController.h"
@interface MainViewController ()<UITabBarControllerDelegate>

@end

@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // 0.设置代理
    self.delegate = self;
    
    // 1.当系统的Tabbar满足不了需求的时候，用自己的TabBar代替系统的TabBar
    // [self setValue:[[LYMTabBar alloc] init] forKey:@"tabBar"];
    
    // 2.初始化所有的自控制器
    [self setUpAllChildController];
    
}

#pragma mark ========= initialize ===========
+ (void)initialize{
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName:[UIColor grayColor]
                           };
    [[UITabBarItem appearance] setTitleTextAttributes:dict forState:UIControlStateNormal];
}

#pragma mark ========= 初始化所有的子控制器 =========
/**
 *  初始化所有的子控制器
 */
- (void)setUpAllChildController{
    // 1.精华界面
    ViewController *essenceCV = [[ViewController alloc] init];
    [self setNavOneChildViewController:essenceCV title:@"精华" image:@"toolbar_home"];
    
    // 2.朋友
    MyViewController *friendVC = [[MyViewController alloc] init];
    [self setNavOneChildViewController:friendVC  title:@"showTime" image:@"toolbar_live"];
    
    // 2.朋友
//    FindViewController *findVC = [[FindViewController alloc] init];
//    [self setNavOneChildViewController:findVC  title:@"showTime" image:@"toolbar_live"];
}

/**
 *  初始化一个子控制器的方法
 */
- (void)setNavOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image {
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage mg_ImageRenderingModeAlwaysOriginal:image];
    NSString *selImage = [NSString stringWithFormat:@"%@_sel",image];
    vc.tabBarItem.selectedImage = [UIImage mg_ImageRenderingModeAlwaysOriginal:selImage];
    
    [self addChildViewController:[[MGNavController alloc] initWithRootViewController:vc]];
}

#pragma mark - UITabBarControllerDelegate
-  (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if ([tabBarController.childViewControllers indexOfObject:viewController] == tabBarController.childViewControllers.count-2) {
        
        if ([UIImagePickerController
             isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            NSArray *availableMediaTypes = [UIImagePickerController
                                            availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
            
        }
        
         
        return YES;
    }
    return YES;
}




@end

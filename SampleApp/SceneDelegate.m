//
//  SceneDelegate.m
//  SampleApp
//
//  Created by iaosee on 2022/8/1.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "RecommendViewController.h"
#import "MineViewController.h"
#import "SplashView.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;

    NewsViewController *newsController = [[NewsViewController alloc] init];
    VideoViewController *videoController = [[VideoViewController alloc] init];
    RecommendViewController *recommendController = [[RecommendViewController alloc] init];
    MineViewController *mineController = [[MineViewController alloc] init];

    UITabBarController *tabbarController = [[UITabBarController alloc] init];

//    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:newsController];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    navController.tabBarItem.title = @"Nav";
    navController.view.backgroundColor = [UIColor whiteColor];

//    将四个页面的 UIViewController 加入到 UITabBarController 之中
//    [tabbarController setViewControllers: @[navController, videoController, recommendController, mineController]];
    [tabbarController setViewControllers: @[newsController, videoController, recommendController, mineController]];
    tabbarController.tabBar.translucent = NO;
//    tabbarController.navigationItem.title = @"iOS App";
//    [navController setNavigationBarHidden:YES];

//    self.window.rootViewController = tabbarController;
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    
//    [self.window addSubview:({
//        SplashView *splash = [[SplashView alloc] initWithFrame:self.window.bounds];
//        splash;
//    })];

/**
 布局方式：
 
 window 的 RootViewController 为 TabbarController，每个 tabView 都是 NavgationController：这样每个 ViewController 切换都是在 TabbarController 内部切换
 
             UIWindow
                |
          TabbarController
              /        \
NavgationController       NavgationController
       |                                   |
 ViewController               ViewController
 
 
 window 的 RootViewController 为 NavgationController，第一个容器为 TabbarController：这样每个 ViewController  切换是以 TabbarController 整体切换，会覆盖 Tabbar
 
        UIWindow
            |
     NavgationController
            |
     TabbarController
          /       \
 ViewController       ViewController
 
 */
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}

-(void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts {
    NSLog(@"openURL - %@", URLContexts);
}

@end

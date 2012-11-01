//
//  AppDelegate.h
//  CA2012Summer01
//
//  Created by 渡辺 賢悟 on 12/08/28.
//  Copyright (c) 2012年 けん悟庵. All rights reserved.
//

#import <UIKit/UIKit.h>

// (3-1)MyViewControllerを使えるようにするため、ヘッダを#importしてつなぐ
#import "MyViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    // (3-2)ビューコントローラ
    MyViewController*           _myVC;
    
    // (4-1)ナビゲーションコントローラ
    UINavigationController*     _navi;
}

@property (strong, nonatomic) UIWindow *window;

@end

//
//  MyViewController.m
//  Project19-NaviStep3
//
//  Created by 渡辺 賢悟 on 12/09/02.
//  Copyright (c) 2012年 けん悟庵. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// viewがロードされた時に呼び出される
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // (1-1) 自分自身の背景の色を指定
    self.view.backgroundColor = [UIColor cyanColor];
    
    
    self.title = @"OSCTest";
   
    
    _myview = [[MyView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    
    [self.view addSubview:_myview];
}

// viewが何かしらかの理由でアンロード(解放)されるときに呼び出される
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    // (2-5) _creappViewをSuperView(親のView）から”剥がす”
    [_myview removeFromSuperview];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end

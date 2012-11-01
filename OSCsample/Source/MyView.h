//
//  MyView.h
//  Project19-NaviStep3
//
//  Created by KenshoAndo on 2012/09/28.
//  Copyright (c) 2012年 けん悟庵. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OSCPort.h"

@interface MyView : UIView{
    UIImage*        _imageLily;
    UIImageView*    _viewLily;
    
    int             _touchX;
    int             _touchY;
    
    
    //****************OSCの変数********************
    OSCPort*        _port;
}

@end

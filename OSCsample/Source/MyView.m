//
//  MyView.m
//  Project19-NaviStep3
//
//  Created by KenshoAndo on 2012/09/28.
//  Copyright (c) 2012年 けん悟庵. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        _imageLily = [UIImage imageNamed:@"Lily.png"];
        
        [self addSubview:_viewLily];
        
        
        //******************************OSCのポート設定（相手のIPアドレス）************************************
        _port = [OSCPort oscPortToAddress:"127.0.0.1"  portNumber:12000];

    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [_imageLily drawInRect:CGRectMake(_touchX, _touchY, 100, 100)];
}


// (+) タッチしたときに呼ばれる関数
- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    // (7) タッチした位置を(x,y)座標で取得する
    for(UITouch* touch in touches) {
        // タッチした位置をこのビュー内の座標値で取得する(locationの中に座標が入る)
        CGPoint location = [touch locationInView:self.superview];
        
        // locationの座標値を_touchX, _touchYに保存
        _touchX = location.x;
        _touchY = location.y;
    }
    
    //自分の今の位置と大きさが取れる
    CGRect rect = self.frame;
    
    int selfW = rect.size.width;
    int selfH = rect.size.height;
    
    //自分の今の位置と大きさが変更できる
    self.frame = CGRectMake(_touchX-selfW/2, _touchY-selfH/2, selfW, selfH);
    
    
    //************************************OSCでメッセージ送信************************************************
    [_port sendTo:"/touchX" types:"i", _touchX];
    [_port sendTo:"/touchY" types:"i", _touchY];    
}



// (+) 指を離したときに呼ばれる関数
- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{
    // (9) タッチした位置を(x,y)座標で取得する
    for(UITouch* touch in touches) {
        // タッチした位置をこのビュー内の座標値で取得する(locationの中に座標が入る)
        CGPoint location = [touch locationInView:self.superview];
        
        // locationの座標値を_touchX, _touchYに保存
        _touchX = location.x;
        _touchY = location.y;
    }
    
    //自分の今の位置と大きさが取れる
    CGRect rect = self.frame;
    
    int selfW = rect.size.width;
    int selfH = rect.size.height;
    
    //自分の今の位置と大きさが変更できる
    self.frame = CGRectMake(_touchX-selfW/2, _touchY-selfH/2, selfW, selfH);

}



// (11) タッチして指を動かした時の関数
- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event
{
    // タッチした位置を(x,y)座標で取得する
    for(UITouch* touch in touches) {
        // タッチした位置をこのビュー内の座標値で取得する(locationの中に座標が入る)
        CGPoint location = [touch locationInView:self.superview];
        
        // locationの座標値を_touchX, _touchYに保存
        _touchX = location.x;
        _touchY = location.y;
    }
    
    //自分の今の位置と大きさが取れる
    CGRect rect = self.frame;
 
    int selfW = rect.size.width;
    int selfH = rect.size.height;
    
    //自分の今の位置と大きさが変更できる
    self.frame = CGRectMake(_touchX-selfW/2, _touchY-selfH/2, selfW, selfH);

    
    //************************************OSCでメッセージ送信************************************************
    [_port sendTo:"/touchX" types:"i", _touchX];
    [_port sendTo:"/touchY" types:"i", _touchY];
}


@end

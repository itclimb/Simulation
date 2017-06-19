//
//  JJPushView.m
//  Simulation
//
//  Created by itclimb on 13/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import "JJPushView.h"

@implementation JJPushView
{
    UIImageView *_smallImgView;
    
    CGPoint _currentPoint;
    
    UIPushBehavior *_push;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *smallImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        smallImgView.hidden = YES;
        [self addSubview:smallImgView];
        _smallImgView = smallImgView;
        
        //拖拽识别器
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:pan];
        
        //推动行为
        UIPushBehavior *push = [[UIPushBehavior alloc] initWithItems:@[self.boxImgView] mode:UIPushBehaviorModeContinuous];
        [self.animator addBehavior:push];
        _push = push;
        
        //边缘检测
        UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.boxImgView]];
        collision.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:collision];
        
        
    }
    return self;
}

- (void)panAction:(UIGestureRecognizer *)recognizer{
    CGPoint loc = [recognizer locationInView:self];
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        _smallImgView.hidden = NO;
        _smallImgView.center = loc;
    }else if (recognizer.state == UIGestureRecognizerStateChanged){
        _currentPoint = loc;
        [self setNeedsDisplay];//调用drawRect方法
    }else if (recognizer.state == UIGestureRecognizerStateEnded){
        
        //推动行为设置
        CGFloat offsetX = _smallImgView.center.x - _currentPoint.x;
        CGFloat offsetY = _smallImgView.center.y - _currentPoint.y;
        
        //斜边长度
        CGFloat distance = hypot(offsetX, offsetY);
        //角度
        CGFloat angle = atan2(offsetY, offsetX);
        _push.magnitude = distance;
        _push.angle = angle;
        _push.active = YES;
        
        //隐藏小图片框
        _smallImgView.hidden = YES;
        _smallImgView.center = CGPointZero;
        _currentPoint = CGPointZero;
        
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:_smallImgView.center];
    [path addLineToPoint:_currentPoint];
    path.lineWidth = 5;
    [UIColor.grayColor setStroke];
    [path stroke];
}

@end

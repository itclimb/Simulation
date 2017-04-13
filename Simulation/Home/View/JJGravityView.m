//
//  JJGravityView.m
//  Simulation
//
//  Created by itclimb on 13/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import "JJGravityView.h"

@implementation JJGravityView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, 80, 20)];
        lineView.backgroundColor = [UIColor blackColor];
        [self addSubview:lineView];
        
        UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        redView.backgroundColor = [UIColor redColor];
        redView.transform = CGAffineTransformMakeRotation(M_PI_2 * 0.5);
        [self addSubview:redView];
        
        //重力行为
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[redView,self.boxImgView]];
        [self.animator addBehavior:gravity];
        
        //边缘检测行为
        UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[redView,self.boxImgView]];
        CGPoint fromP = CGPointMake(0, 300);
        CGPoint toP = CGPointMake(80, 300);
        [collision addBoundaryWithIdentifier:@"line" fromPoint:fromP toPoint:toP];
        //将参考视图(父视图)设置为边界
        collision.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:collision];
    }
    return self;
}

@end

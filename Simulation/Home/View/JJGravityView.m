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
        UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        redView.backgroundColor = [UIColor redColor];
        redView.transform = CGAffineTransformMakeRotation(M_PI_2 * 0.5);
        [self addSubview:redView];
        
        //重力行为
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[redView,self.boxImgView]];
        [self.animator addBehavior:gravity];
        
        //边缘检测行为
        UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[redView,self.boxImgView]];
        collision.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:collision];
    }
    return self;
}

@end

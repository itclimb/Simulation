//
//  JJTestGravityView.m
//  Simulation
//
//  Created by itclimb on 20/06/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import "JJTestGravityView.h"

@interface JJTestGravityView ()

@property(nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation JJTestGravityView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor lightGrayColor];
        CGFloat bgView_w = [UIScreen mainScreen].bounds.size.width;
        CGFloat bgView_h = 300;
        CGFloat bgView_x = 0;
        CGFloat bgView_y = ([UIScreen mainScreen].bounds.size.height - bgView_h)/2;
        bgView.frame = CGRectMake(bgView_x, bgView_y, bgView_w, bgView_h);
        [self addSubview:bgView];
        
        self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:bgView];
        
        UIView *testView = [[UIView alloc] init];
        testView.backgroundColor = [UIColor blueColor];
        testView.frame = CGRectMake(0, 0, 30, 30);
        [bgView addSubview:testView];
        
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[testView]];
        [self.animator addBehavior:gravity];
        
        UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[testView]];
        collision.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:collision];
    }
    return self;
}

@end

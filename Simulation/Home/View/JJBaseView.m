//
//  JJBaseView.m
//  Simulation
//
//  Created by itclimb on 13/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import "JJBaseView.h"

@implementation JJBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
        UIImageView *boximgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Box1"]];
        boximgView.center = CGPointMake(self.center.x, 130);
        [self addSubview:boximgView];
        self.boxImgView = boximgView;
        
        //仿真者
        UIDynamicAnimator *animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
        self.animator = animator;
    }
    return self;
}

@end

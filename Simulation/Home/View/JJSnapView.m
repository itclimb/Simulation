//
//  JJSnapView.m
//  Simulation
//
//  Created by itclimb on 13/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import "JJSnapView.h"

@implementation JJSnapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapAction:(UITapGestureRecognizer *)recognizer{
    
    [self.animator removeAllBehaviors];
    
    CGPoint loc = [recognizer locationInView:self];
    
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.boxImgView snapToPoint:loc];
    
    snap.damping = 0.5;
    
    [self.animator addBehavior:snap];
}

@end

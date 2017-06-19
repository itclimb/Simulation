//
//  JJSpringView.m
//  Simulation
//
//  Created by itclimb on 13/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import "JJSpringView.h"

@implementation JJSpringView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //频率
        self.attachment.frequency = 0.5;
        //振幅
        self.attachment.damping = 0.0;
        
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.boxImgView]];
        [self.animator addBehavior:gravity];
        
        //添加监听
        [self.boxImgView addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:@"spring"];
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    [self setNeedsDisplay];
}

//移除通知
- (void)dealloc{
    [self.boxImgView removeObserver:self forKeyPath:@"center"];
}

@end

//
//  JJAttachmentView.m
//  Simulation
//
//  Created by itclimb on 13/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import "JJAttachmentView.h"

@implementation JJAttachmentView
{
    UIImageView *_anchorImgView;
    UIImageView *_offsetImgView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.boxImgView.center = CGPointMake(self.center.x, 230);
        
        //创建刚性附着行为
        //从中心点的偏移量
        UIOffset offset = UIOffsetMake(0, 0);
        //附着点的位置
        CGPoint anchorP = CGPointMake(self.boxImgView.center.x, 120);
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc] initWithItem:self.boxImgView offsetFromCenter:offset attachedToAnchor:anchorP];
        [self.animator addBehavior:attachment];
        _attachment = attachment;
        
        //创建图片
        UIImage *smallImg = [UIImage imageNamed:@"AttachmentPoint_Mask"];
        UIImageView *anchorImgView = [[UIImageView alloc] initWithImage:smallImg];
        anchorImgView.center = anchorP;
        [self addSubview:anchorImgView];
        _anchorImgView = anchorImgView;
        
        UIImageView *offsetImgView = [[UIImageView alloc] initWithImage:smallImg];
        CGSize boxSize = self.boxImgView.bounds.size;
        offsetImgView.center = CGPointMake(boxSize.width * 0.5 + offset.horizontal, boxSize.height * 0.5 + offset.vertical);
        [self.boxImgView addSubview:offsetImgView];
        _offsetImgView = offsetImgView;
        
        //拖拽手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}

- (void)panAction:(UIPanGestureRecognizer *)recognizer{
    CGPoint loc = [recognizer locationInView:self];
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        _attachment.anchorPoint = loc;
        _anchorImgView.center = loc;
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:_anchorImgView.center];
    //创建末端位置
    CGPoint endP = [self convertPoint:_offsetImgView.center fromView:self.boxImgView];
    [path addLineToPoint:endP];
    path.lineWidth = 5;
    path.lineCapStyle = kCGLineCapRound;
    [UIColor.grayColor setStroke];
    [path stroke];
}

@end

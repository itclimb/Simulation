//
//  JJMarbleController.m
//  Simulation
//
//  Created by itclimb on 19/06/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import "JJMarbleController.h"
#import "JJMarbleView.h"
#import <CoreMotion/CoreMotion.h>

#define kMarbleCount 10

@interface JJMarbleController ()

@property(nonatomic, strong) NSMutableArray<JJMarbleView *> *marbleArr;

@property(nonatomic, strong) UIDynamicAnimator *animator;

@property(nonatomic, strong) UIView *bgView;

@property(nonatomic, strong) CMMotionManager *moManager;

@property(nonatomic, strong) UIGravityBehavior *gravity;

@end

@implementation JJMarbleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.bgView];
    //1.创建子控件
    [self initSubviews];
    //2.添加重力行为
    [self addGravity];
    //3.添加碰撞行为
    [self addCollision];
    //4.加速器
    [self addMotion];
}

- (void)initSubviews{
    CGFloat bgView_w = [UIScreen mainScreen].bounds.size.width;
    CGFloat bgView_h = 300;
    CGFloat bgView_x = 0;
    CGFloat bgView_y = ([UIScreen mainScreen].bounds.size.height - bgView_h)/2;
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(bgView_x, bgView_y, bgView_w, bgView_h)];
    bgView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bgView];
    
    CGFloat marble_r = 15;
    CGFloat marble_d = 2 * marble_r;
    for (NSInteger i = 0; i <= kMarbleCount; i++) {
        JJMarbleView *marble = [[JJMarbleView alloc] init];
        CGFloat marble_x = i * marble_d;
        CGFloat marble_y = 0;
        CGFloat marble_w = marble_d;
        CGFloat marble_h = marble_w;
        marble.frame = CGRectMake(marble_x, marble_y, marble_w, marble_h);
        marble.backgroundColor = [UIColor blueColor];
        marble.layer.masksToBounds = YES;
        marble.layer.cornerRadius = marble_r;
        [bgView addSubview:marble];
        [self.marbleArr addObject:marble];
    }
    
    self.bgView = bgView;
}

- (void)addGravity{
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:self.marbleArr];
    [self.animator addBehavior:gravity];
    self.gravity = gravity;
}

- (void)addCollision{
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:self.marbleArr];
//    collision.translatesReferenceBoundsIntoBoundary = YES;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.bgView.bounds];
    [collision addBoundaryWithIdentifier:@"bgView" forPath:path];
    [self.animator addBehavior:collision];
}

- (void)addMotion{

    self.moManager = [[CMMotionManager alloc] init];
    [self.moManager startDeviceMotionUpdatesToQueue:[[NSOperationQueue alloc] init] withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.gravity.gravityDirection = CGVectorMake(motion.gravity.x, -motion.gravity.y);
            });
        }
    }];
}

//MARK: - lazy load
- (NSMutableArray<JJMarbleView *> *)marbleArr{
    if (!_marbleArr) {
        _marbleArr = [NSMutableArray array];
    }
    return _marbleArr;
}

@end

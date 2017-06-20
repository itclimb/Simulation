//
//  JJDemoController.m
//  Simulation
//
//  Created by itclimb on 12/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import "JJDemoController.h"
#import "JJBaseView.h"
#import "JJGravityView.h"
#import "JJSnapView.h"
#import "JJPushView.h"
#import "JJAttachmentView.h"
#import "JJSpringView.h"
#import "JJTestGravityView.h"

@interface JJDemoController ()

@end

@implementation JJDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    switch (self.funcType) {
            
        case kDemoFuncGravity:
        {
            JJBaseView *backView = [[JJGravityView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:backView];
            break;
        }
        case kDemoFuncSnap:
        {
            JJBaseView *backView = [[JJSnapView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:backView];
            break;
        }
        case kDemoFuncPush:
        {
            JJBaseView *backView = [[JJPushView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:backView];
            break;
        }
        case kDemoFuncAttachment:
        {
            JJBaseView *backView = [[JJAttachmentView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:backView];
            break;
        }
        case kDemoFuncSpring:
        {
            JJBaseView *backView = [[JJSpringView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:backView];
            break;
        }
        case kDemoFuncTest:
        {
            JJTestGravityView *backView = [[JJTestGravityView alloc] initWithFrame:self.view.bounds];
            [self.view addSubview:backView];
            break;
        }
        default:
            break;
    }
}


@end

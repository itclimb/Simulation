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

@interface JJDemoController ()

@end

@implementation JJDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    JJBaseView *backView;
    switch (self.funcType) {
            
        case kDemoFuncGravity:
            backView = [[JJGravityView alloc] initWithFrame:self.view.bounds];
            break;
            
        case kDemoFuncSnap:
            backView = [[JJSnapView alloc] initWithFrame:self.view.bounds];
            break;
            
        case kDemoFuncPush:
            backView = [[JJPushView alloc] initWithFrame:self.view.bounds];
            break;
            
        case kDemoFuncAttachment:
            backView = [[JJAttachmentView alloc] initWithFrame:self.view.bounds];
            break;
            
        case kDemoFuncSpring:
            backView = [[JJSpringView alloc] initWithFrame:self.view.bounds];
            break;
            
        default:
            break;
    }
    [self.view addSubview:backView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

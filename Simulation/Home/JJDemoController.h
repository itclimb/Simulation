//
//  JJDemoController.h
//  Simulation
//
//  Created by itclimb on 12/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kDemoFuncGravity,
    kDemoFuncSnap,
    kDemoFuncPush,
    kDemoFuncAttachment,
    kDemoFuncSpring,
    kDemoFuncTest
} kDemoFunc;

@interface JJDemoController : UIViewController

@property(nonatomic, assign) kDemoFunc funcType;

@end

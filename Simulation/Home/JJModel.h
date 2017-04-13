//
//  JJModel.h
//  Simulation
//
//  Created by itclimb on 12/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJModel : NSObject

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *Controller;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end

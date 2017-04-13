//
//  JJModel.m
//  Simulation
//
//  Created by itclimb on 12/04/2017.
//  Copyright © 2017 itclimb.yuancheng.com. All rights reserved.
//

#import "JJModel.h"

@implementation JJModel

+ (instancetype)modelWithDict:(NSDictionary *)dict{
    JJModel *model = [[JJModel alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}
@end

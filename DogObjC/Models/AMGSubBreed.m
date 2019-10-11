//
//  AMGSubBreed.m
//  DogObjC
//
//  Created by Austin Goetz on 10/9/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import "AMGSubBreed.h"

@implementation AMGSubBreed

- (instancetype)initWithName:(NSString *)name imageURL:(NSArray<NSString *> *)imageURL{
    self = [super init];
    if (self)
    {
        _name = name;
        _imageURL = imageURL;
    }
    return self;
}

@end

//
//  AMGBreeds.m
//  DogObjC
//
//  Created by Austin Goetz on 10/9/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import "AMGBreeds.h"

@implementation AMGBreeds

- (AMGBreeds *)initWithName:(NSString *)name subBreed:(NSArray<AMGSubBreed *> *)subBreed imageURL:(NSArray<NSString *> *)imageURL
{
        
    self = [super init];
    if (self)
    {
        _name = name;
        _subBreed = subBreed;
        _imageURL = imageURL;
    }
    return self;
}

@end

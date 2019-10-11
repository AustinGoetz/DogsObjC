//
//  AMGBreeds.h
//  DogObjC
//
//  Created by Austin Goetz on 10/9/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMGSubBreed.h"

NS_ASSUME_NONNULL_BEGIN

@interface AMGBreeds : NSObject

@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSArray<AMGSubBreed *> *subBreed;
@property (nonatomic, copy) NSArray *imageURL;

- (AMGBreeds *)initWithName:(NSString *)name
                   subBreed:(NSArray<NSString *> *)subBreed
                   imageURL:(NSArray<NSString *> *)imageURL;

@end


NS_ASSUME_NONNULL_END

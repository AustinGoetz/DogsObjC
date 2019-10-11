//
//  AMGSubBreed.h
//  DogObjC
//
//  Created by Austin Goetz on 10/9/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface AMGSubBreed : NSObject

@property (nonatomic, copy) NSArray *imageURL;
@property (nonatomic, copy, readonly) NSString *name;

- (instancetype)initWithName:(NSString *)name
                    imageURL:(NSArray<NSString *> *)imageURL;


@end


//
//  AMGBreedsController.h
//  DogObjC
//
//  Created by Austin Goetz on 10/9/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMGBreeds.h"
#import "AMGSubBreed.h"

NS_ASSUME_NONNULL_BEGIN

@interface AMGBreedsController : NSObject

// Does this need to be private
+ (instancetype) sharedController;

@property(nonatomic, copy) NSArray<AMGBreeds *> *breeds;
@property(nonatomic, copy) NSArray<AMGSubBreed *> *subBreeds;

- (void)fetchBreeds:(void (^)(NSArray<AMGBreeds *> *breeds))completion;

- (void)fetchBreedImageURL:(AMGBreeds *)breed
                completion:(void (^)(NSArray *))completion;

- (void)fetchSubBreedImage:(AMGSubBreed *)subbreed
                        breed:(AMGBreeds *)breed
                   completion:(void (^)(NSArray *))completion;

- (void)fetchImageDataFromURL:(NSString *)url
                   completion:(void (^)(NSData * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END

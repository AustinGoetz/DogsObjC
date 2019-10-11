//
//  AMGBreedsController.m
//  DogObjC
//
//  Created by Austin Goetz on 10/9/19.
//  Copyright © 2019 Austin Goetz. All rights reserved.
//

#import "AMGBreedsController.h"


static NSString * const kfetchBreedsBaseURL = @"https://dog.ceo/api/breeds/list/all";
static NSString * const kfetchBreedImageBaseURL = @"https://dog.ceo/api/breed";
static NSString * const kImageComponent = @"images";

@implementation AMGBreedsController

+ (instancetype)sharedController
{
    static AMGBreedsController *sharedController = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedController = [[AMGBreedsController alloc] init];
    });
    return sharedController;
    
}


- (void)fetchBreeds:(void (^)(NSArray<AMGBreeds *> * _Nonnull))completion
{
    NSURL *finalURL = [NSURL URLWithString:kfetchBreedsBaseURL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching breed: %@", error);
            completion(@[]);
            return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (data)
        {
            NSDictionary *topLevelDict = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (error)
            {
                NSLog(@"Error parsing JSON Data: %@", [error localizedDescription]);
                completion(@[]);
                return;
            }
            
            NSDictionary *messageDictionary =topLevelDict[@"message"];
            
            NSMutableArray *arrayOfBreeds = [NSMutableArray new];
            for (id key in messageDictionary)
            {
                
                NSMutableArray *subBreeds = [NSMutableArray new];
                for (NSString *name in messageDictionary[key])
                {
                    
                    AMGSubBreed *subBreed = [[AMGSubBreed alloc] initWithName:name imageURL:[NSMutableArray new]];
                    [subBreeds addObject:subBreed];
                }
                AMGBreeds *breed = [[AMGBreeds alloc] initWithName:key subBreed:subBreeds imageURL:[NSMutableArray new]];
                [arrayOfBreeds addObject:breed];
            }
            completion(arrayOfBreeds);
        }
        
    }]resume];
}

- (void)fetchBreedImageURL:(AMGBreeds *)breed completion:(void (^)(NSArray * _Nonnull))completion
{
    NSURL *baseURL = [NSURL URLWithString:kfetchBreedImageBaseURL];
    
    NSURL *breedURL = [baseURL URLByAppendingPathComponent:breed.name];
    
    NSURL *finalURL = [breedURL URLByAppendingPathComponent:kImageComponent];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            completion(@[]);
        }
        
        if (data) {
            NSDictionary *imageDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (error)
            {
                NSLog(@"Error parsing JSON Data: %@", [error localizedDescription]);
                return;
            }
            NSMutableArray *imageArray = imageDictionary[@"message"];
            completion(imageArray);
        }
    }]resume];
}

- (void)fetchSubBreedImage:(AMGSubBreed *)subbreed breed:(AMGBreeds *)breed completion:(void (^)(NSArray * _Nonnull))completion
{
    NSURL *baseURL = [NSURL URLWithString:kfetchBreedImageBaseURL];
    NSURL *breedURL = [baseURL URLByAppendingPathComponent:breed.name];
    NSURL *subBreedURL = [breedURL URLByAppendingPathComponent:subbreed.name];
    NSURL *finalURL = [subBreedURL URLByAppendingPathComponent:kImageComponent];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            completion(@[]);
        }
        
        if (data) {
            NSDictionary *imageDictionary = [NSJSONSerialization JSONObjectWithData:data options:2 error:&error];
            if (error)
            {
                NSLog(@"Error parsing JSON Data: %@", [error localizedDescription]);
                return;
            }
            NSMutableArray *imageArray = imageDictionary[@"message"];
            NSLog(@"Succesful data!!!");
            completion(imageArray);
        }
    }]resume];
}

- (void)fetchImageDataFromURL:(NSString *)url completion:(void (^)(NSData * _Nullable))completion
{
    NSURL *finalURL = [NSURL URLWithString:(url)];
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
            completion(nil);
        }
        
        if (data) {
            completion(data);
        }
    }]resume];
}

@end

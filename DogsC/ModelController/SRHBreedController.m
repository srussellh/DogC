//
//  SRHBreedController.m
//  DogsC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "SRHBreedController.h"
#import "SRHBreed.h"

@implementation SRHBreedController

+(instancetype)shared
{
    static SRHBreedController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [SRHBreedController new];
    });
    return shared;
}

- (void)fetchBreed:(void (^)(BOOL))completion
{
    NSURL *url = [NSURL URLWithString:@"https://dog.ceo/api/breeds/list/all"];
    NSLog(@"%@", [url absoluteString]);
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"there was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(false);
            return;
        }
        if (!data){
            NSLog(@"data is missing");
            completion(false);
            return;
        }
        NSDictionary *JSonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSDictionary *messageDictionary = JSonDictionary[@"message"];
        NSMutableArray *breedArray = [NSMutableArray new];
        for (NSString *key in messageDictionary) {
            
            NSMutableArray *subBreeds = [NSMutableArray new];
            
            for (NSString *subBreedString in messageDictionary[key]) {
                SRHSubBreed *subbreed = [[SRHSubBreed alloc] initWithName:subBreedString];
                [subBreeds addObject:subbreed];
            }
            
            SRHBreed *breed = [[SRHBreed alloc] initWithName:key subbreed:subBreeds imageURLs:@[]];
            [breedArray addObject:breed];
        }
        SRHBreedController.shared.breed = breedArray;
        completion(true);
    }]resume];
}

- (void)fetchImageBreed:(SRHBreed *)breed completion:(void (^)(BOOL))completion
{
    NSURL *url = [NSURL URLWithString:@"https://dog.ceo/api/breed/"];
    NSURL *breedURL = [[url URLByAppendingPathComponent:[breed name]] URLByAppendingPathComponent:@"images"];
    NSLog(@"%@", breedURL);
    [[[NSURLSession sharedSession] dataTaskWithURL:breedURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error){
            NSLog(@"Error in %s , %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(false);
            return;
        }
        if (!data){
            NSLog(@"data is missing");
            completion(false);
            return;
        }
        NSDictionary *JsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSArray *imageArray = JsonDictionary[@"message"];
        [breed setImageURLs:imageArray];
        
        completion(true);
    }]resume];
}

-(void) fetchImage:(NSString *)imageURL completion:(void(^)(UIImage *_Nullable))completion
{
    
        NSURL *url = [NSURL URLWithString:imageURL];
        [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error){
                NSLog(@"Error in %s , %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
                completion(nil);
                return;
            }
            if (data){
                UIImage *breedImage = [UIImage imageWithData:data];
                completion(breedImage);
                return;
            }
            completion(nil);
        }]resume];
    }

@end

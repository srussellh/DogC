//
//  SRHDog.m
//  DogsC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import "SRHBreed.h"

@implementation SRHBreed
- (instancetype)initWithName:(NSString *)name subbreed:(NSArray<SRHSubBreed *> *)subbreed imageURLs:(NSArray *)imageURLs
{
    self = [super init];
    if (self){
        _name = name;
        _subbreed = subbreed;
        _imageURLs = @[];
    }
    return self;
}

//- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
//{
//    NSString *names = dictionary[@"message"];
////    NSString *subbreed = names[];
//}

@end

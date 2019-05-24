//
//  SRHSubBreed.m
//  DogsC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import "SRHSubBreed.h"

@implementation SRHSubBreed
- (instancetype)initWithName:(NSString *)name 
{
    self = [super init];
    if (self){
        _name = name;
        _imageURLs = @[];
    }
    return self;
}

@end

//
//  SRHDog.h
//  DogsC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SRHSubBreed.h"

NS_ASSUME_NONNULL_BEGIN

@interface SRHBreed : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readwrite, nullable) NSArray<SRHSubBreed *> *subbreed;
@property (nonatomic, readwrite, nullable) NSArray<NSString *> *imageURLs;

-(instancetype) initWithName:(NSString *)name subbreed:(NSArray *)subbreed imageURLs:(NSArray *)imageURLs;

@end

NS_ASSUME_NONNULL_END

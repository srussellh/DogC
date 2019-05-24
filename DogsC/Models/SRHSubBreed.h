//
//  SRHSubBreed.h
//  DogsC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRHSubBreed : NSObject

@property (nonatomic, readonly) NSString *name;
@property (nonatomic, readonly) NSArray *imageURLs;

-(instancetype) initWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END

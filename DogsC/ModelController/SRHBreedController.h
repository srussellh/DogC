//
//  SRHBreedController.h
//  DogsC
//
//  Created by Bobba Kadush on 5/22/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRHBreed.h"

@class SRHBreed;

NS_ASSUME_NONNULL_BEGIN

@interface SRHBreedController : NSObject

@property (nonatomic, copy) NSArray<SRHBreed *> *breed;

-(void) fetchBreed:(void(^)(BOOL))completion;
-(void) fetchImageBreed:(SRHBreed *)breed  completion:(void (^)(BOOL))completion;
-(void) fetchImage:(SRHBreed *) breed completion:(void(^)(UIImage *_Nullable))completion;
+(instancetype)shared;

@end

NS_ASSUME_NONNULL_END

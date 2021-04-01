//
//  BCKBaseClass.h
//
//  Created by Engel Alipio on 3/9/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DestinyInventoryBucketDefinition;

@interface BCKBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) DestinyInventoryBucketDefinition *destinyInventoryBucketDefinition;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

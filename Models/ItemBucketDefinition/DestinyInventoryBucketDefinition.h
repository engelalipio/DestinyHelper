//
//  DestinyInventoryBucketDefinition.h
//
//  Created by Engel Alipio on 3/9/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BCKDisplayProperties;

@interface DestinyInventoryBucketDefinition : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double category;
@property (nonatomic, assign) double hash;
@property (nonatomic, assign) double index;
@property (nonatomic, assign) BOOL hasTransferDestination;
@property (nonatomic, assign) double itemCount;
@property (nonatomic, assign) double scope;
@property (nonatomic, assign) BOOL redacted;
@property (nonatomic, assign) double bucketOrder;
@property (nonatomic, assign) BOOL blacklisted;
@property (nonatomic, assign) double location;
@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, strong) BCKDisplayProperties *displayProperties;
@property (nonatomic, assign) BOOL fifo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

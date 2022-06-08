//
//  DestinyStatDefinition.h
//
//  Created by Engel Alipio on 6/6/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class StatDisplayProperties;

@interface DestinyStatDefinition : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL interpolate;
@property (nonatomic, assign) double hash;
@property (nonatomic, assign) BOOL blacklisted;
@property (nonatomic, assign) BOOL redacted;
@property (nonatomic, strong) StatDisplayProperties *displayProperties;
@property (nonatomic, assign) BOOL hasComputedBlock;
@property (nonatomic, assign) double aggregationType;
@property (nonatomic, assign) double statCategory;
@property (nonatomic, assign) double index;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  DestinyItemCategoryDefinition.h
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITMCATDisplayProperties;

@interface DestinyItemCategoryDefinition : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL groupCategoryOnly;
@property (nonatomic, assign) double hash;
@property (nonatomic, strong) NSString *itemTypeRegex;
@property (nonatomic, assign) double index;
@property (nonatomic, assign) double grantDestinySubType;
@property (nonatomic, strong) NSString *shortTitle;
@property (nonatomic, assign) double grantDestinyClass;
@property (nonatomic, assign) BOOL deprecated;
@property (nonatomic, assign) BOOL blacklisted;
@property (nonatomic, assign) BOOL redacted;
@property (nonatomic, strong) NSArray *groupedCategoryHashes;
@property (nonatomic, strong) ITMCATDisplayProperties *displayProperties;
@property (nonatomic, assign) BOOL visible;
@property (nonatomic, assign) double grantDestinyItemType;
@property (nonatomic, assign) BOOL isPlug;
@property (nonatomic, strong) NSArray *parentCategoryHashes;
@property (nonatomic, assign) double grantDestinyBreakerType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  ActivityModeHash.h
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ACMDisplayProperties;

@interface ActivityModeHash : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double hash;
@property (nonatomic, assign) double index;
@property (nonatomic, strong) NSArray *parentHashes;
@property (nonatomic, assign) BOOL display;
@property (nonatomic, strong) NSString *friendlyName;
@property (nonatomic, assign) double tier;
@property (nonatomic, assign) double modeType;
@property (nonatomic, assign) double activityModeCategory;
@property (nonatomic, assign) BOOL isAggregateMode;
@property (nonatomic, assign) BOOL redacted;
@property (nonatomic, assign) BOOL blacklisted;
@property (nonatomic, assign) double order;
@property (nonatomic, strong) ACMDisplayProperties *displayProperties;
@property (nonatomic, assign) BOOL isTeamBased;
@property (nonatomic, strong) NSString *pgcrImage;
@property (nonatomic, assign) BOOL supportsFeedFiltering;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

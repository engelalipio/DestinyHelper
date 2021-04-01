//
//  INVDQuality.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface INVDQuality : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *infusionCategoryName;
@property (nonatomic, assign) double infusionCategoryHash;
@property (nonatomic, strong) NSArray *versions;
@property (nonatomic, assign) double currentVersion;
@property (nonatomic, strong) NSArray *infusionCategoryHashes;
@property (nonatomic, assign) double progressionLevelRequirementHash;
@property (nonatomic, strong) NSArray *displayVersionWatermarkIcons;
@property (nonatomic, strong) NSArray *itemLevels;
@property (nonatomic, assign) double qualityLevel;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

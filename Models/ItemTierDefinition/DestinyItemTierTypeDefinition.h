//
//  DestinyItemTierDefinition.h
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ITMTInfusionProcess, ITMTDisplayProperties;

@interface DestinyItemTierTypeDefinition : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL redacted;
@property (nonatomic, assign) double hash;
@property (nonatomic, strong) ITMTInfusionProcess *infusionProcess;
@property (nonatomic, assign) BOOL blacklisted;
@property (nonatomic, strong) ITMTDisplayProperties *displayProperties;
@property (nonatomic, assign) double index;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  VNDDetails.h
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VNDDetailsDisplayProperties, VNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties;

@interface VNDDetails : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL returnWithVendorRequest;
@property (nonatomic, assign) BOOL consolidateCategories;
@property (nonatomic, strong) VNDDetailsDisplayProperties *displayProperties;
@property (nonatomic, strong) NSArray *actions;
@property (nonatomic, strong) NSArray *inventoryFlyouts;
@property (nonatomic, strong) NSArray *groups;
@property (nonatomic, strong) NSArray *ignoreSaleItemHashes;
@property (nonatomic, assign) BOOL redacted;
@property (nonatomic, strong) NSArray *failureStrings;
@property (nonatomic, strong) NSArray *unlockRanges;
@property (nonatomic, assign) double vendorProgressionType;
@property (nonatomic, strong) NSArray *displayCategories;
@property (nonatomic, assign) double index;
@property (nonatomic, strong) NSArray *services;
@property (nonatomic, assign) double hash;
@property (nonatomic, assign) double resetIntervalMinutes;
@property (nonatomic, strong) NSArray *locations;
@property (nonatomic, strong) NSArray *originalCategories;
@property (nonatomic, assign) double displayItemHash;
@property (nonatomic, assign) double factionHash;
@property (nonatomic, strong) VNDDetailsBungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties *bungieNetEngineContractDestinyWorldDefinitionsIDestinyDisplayDefinitionDisplayProperties;
@property (nonatomic, assign) double resetOffsetMinutes;
@property (nonatomic, assign) BOOL blacklisted;
@property (nonatomic, assign) BOOL visible;
@property (nonatomic, assign) double unlockValueHash;
@property (nonatomic, strong) NSArray *interactions;
@property (nonatomic, strong) NSArray *categories;
@property (nonatomic, assign) BOOL inhibitSelling;
@property (nonatomic, strong) NSString *vendorIdentifier;
@property (nonatomic, strong) NSArray *itemList;
@property (nonatomic, assign) BOOL inhibitBuying;
@property (nonatomic, assign) BOOL enabled;
@property (nonatomic, strong) NSArray *acceptedItems;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

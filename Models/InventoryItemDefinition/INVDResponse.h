//
//  INVDResponse.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class INVDDisplayProperties, INVDPreview, INVDQuality, INVDSockets, INVDBackgroundColor, INVDInventory;

@interface INVDResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *damageTypes;
@property (nonatomic, assign) BOOL allowActions;
@property (nonatomic, strong) INVDDisplayProperties *displayProperties;
@property (nonatomic, strong) NSArray *tooltipNotifications;
@property (nonatomic, assign) double classType;
@property (nonatomic, strong) INVDPreview *preview;
@property (nonatomic, strong) INVDQuality *quality;
@property (nonatomic, strong) NSString *screenshot;
@property (nonatomic, strong) NSArray *investmentStats;
@property (nonatomic, assign) double acquireUnlockHash;
@property (nonatomic, strong) NSArray *itemCategoryHashes;
@property (nonatomic, strong) NSString *iconWatermarkShelved;
@property (nonatomic, strong) NSString *itemTypeDisplayName;
@property (nonatomic, strong) INVDSockets *sockets;
@property (nonatomic, strong) NSArray *traitIds;
@property (nonatomic, strong) NSString *uiItemDisplayStyle;
@property (nonatomic, strong) NSString *displaySource;
@property (nonatomic, assign) BOOL doesPostmasterPullHaveSideEffects;
@property (nonatomic, strong) INVDBackgroundColor *backgroundColor;
@property (nonatomic, assign) double breakerType;
@property (nonatomic, assign) BOOL redacted;
@property (nonatomic, assign) double collectibleHash;
@property (nonatomic, assign) double index;
@property (nonatomic, assign) double hash;
@property (nonatomic, strong) NSString *flavorText;
@property (nonatomic, assign) BOOL equippable;
@property (nonatomic, strong) INVDInventory *inventory;
@property (nonatomic, strong) NSArray *damageTypeHashes;
@property (nonatomic, strong) NSString *itemTypeAndTierDisplayName;
@property (nonatomic, strong) NSDictionary *stats;
@property (nonatomic, assign) BOOL blacklisted;
@property (nonatomic, assign) BOOL nonTransferrable;
@property (nonatomic, assign) double defaultDamageTypeHash;
@property (nonatomic, assign) double summaryItemHash;
@property (nonatomic, assign) double itemSubType;
@property (nonatomic, assign) BOOL isWrapper;
@property (nonatomic, assign) double itemType;
@property (nonatomic, strong) NSDictionary *translationBlock;
@property (nonatomic, strong) NSDictionary *action;
@property (nonatomic, assign) double acquireRewardSiteHash;
@property (nonatomic, strong) NSDictionary *equippingBlock;
@property (nonatomic, strong) NSArray *perks;
@property (nonatomic, strong) NSDictionary *talentGrid;
@property (nonatomic, strong) NSString *iconWatermark;
@property (nonatomic, assign) double specialItemType;
@property (nonatomic, assign) double defaultDamageType;

+ (NSDictionary *)mapping;
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

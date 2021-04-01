//
//  Response.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVDResponse.h"
#import "INVDDisplayProperties.h"
#import "INVDPreview.h"
#import "INVDQuality.h"
#import "INVDInvestmentStats.h"
#import "INVDSockets.h"
#import "INVDBackgroundColor.h"
#import "INVDInventory.h"
//#import "Stats.h"
//#import "TranslationBlock.h"
//#import "Action.h"
//#import "EquippingBlock.h"
//#import "TalentGrid.h"


NSString *const kResponseDamageTypes = @"damageTypes";
NSString *const kResponseAllowActions = @"allowActions";
NSString *const kResponseDisplayProperties = @"displayProperties";
NSString *const kResponseTooltipNotifications = @"tooltipNotifications";
NSString *const kResponseClassType = @"classType";
NSString *const kResponsePreview = @"preview";
NSString *const kResponseQuality = @"quality";
NSString *const kResponseScreenshot = @"screenshot";
NSString *const kResponseInvestmentStats = @"investmentStats";
NSString *const kResponseAcquireUnlockHash = @"acquireUnlockHash";
NSString *const kResponseItemCategoryHashes = @"itemCategoryHashes";
NSString *const kResponseIconWatermarkShelved = @"iconWatermarkShelved";
NSString *const kResponseItemTypeDisplayName = @"itemTypeDisplayName";
NSString *const kResponseSockets = @"sockets";
NSString *const kResponseTraitIds = @"traitIds";
NSString *const kResponseUiItemDisplayStyle = @"uiItemDisplayStyle";
NSString *const kResponseDisplaySource = @"displaySource";
NSString *const kResponseDoesPostmasterPullHaveSideEffects = @"doesPostmasterPullHaveSideEffects";
NSString *const kResponseBackgroundColor = @"backgroundColor";
NSString *const kResponseBreakerType = @"breakerType";
NSString *const kResponseRedacted = @"redacted";
NSString *const kResponseCollectibleHash = @"collectibleHash";
NSString *const kResponseIndex = @"index";
NSString *const kResponseHash = @"hash";
NSString *const kResponseFlavorText = @"flavorText";
NSString *const kResponseEquippable = @"equippable";
NSString *const kResponseInventory = @"inventory";
NSString *const kResponseDamageTypeHashes = @"damageTypeHashes";
NSString *const kResponseItemTypeAndTierDisplayName = @"itemTypeAndTierDisplayName";
NSString *const kResponseStats = @"stats";
NSString *const kResponseBlacklisted = @"blacklisted";
NSString *const kResponseNonTransferrable = @"nonTransferrable";
NSString *const kResponseDefaultDamageTypeHash = @"defaultDamageTypeHash";
NSString *const kResponseSummaryItemHash = @"summaryItemHash";
NSString *const kResponseItemSubType = @"itemSubType";
NSString *const kResponseIsWrapper = @"isWrapper";
NSString *const kResponseItemType = @"itemType";
NSString *const kResponseTranslationBlock = @"translationBlock";
NSString *const kResponseAction = @"action";
NSString *const kResponseAcquireRewardSiteHash = @"acquireRewardSiteHash";
NSString *const kResponseEquippingBlock = @"equippingBlock";
NSString *const kResponsePerks = @"perks";
NSString *const kResponseTalentGrid = @"talentGrid";
NSString *const kResponseIconWatermark = @"iconWatermark";
NSString *const kResponseSpecialItemType = @"specialItemType";
NSString *const kResponseDefaultDamageType = @"defaultDamageType";


@interface INVDResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVDResponse

@synthesize damageTypes = _damageTypes;
@synthesize allowActions = _allowActions;
@synthesize displayProperties = _displayProperties;
@synthesize tooltipNotifications = _tooltipNotifications;
@synthesize classType = _classType;
@synthesize preview = _preview;
@synthesize quality = _quality;
@synthesize screenshot = _screenshot;
@synthesize investmentStats = _investmentStats;
@synthesize acquireUnlockHash = _acquireUnlockHash;
@synthesize itemCategoryHashes = _itemCategoryHashes;
@synthesize iconWatermarkShelved = _iconWatermarkShelved;
@synthesize itemTypeDisplayName = _itemTypeDisplayName;
@synthesize sockets = _sockets;
@synthesize traitIds = _traitIds;
@synthesize uiItemDisplayStyle = _uiItemDisplayStyle;
@synthesize displaySource = _displaySource;
@synthesize doesPostmasterPullHaveSideEffects = _doesPostmasterPullHaveSideEffects;
@synthesize backgroundColor = _backgroundColor;
@synthesize breakerType = _breakerType;
@synthesize redacted = _redacted;
@synthesize collectibleHash = _collectibleHash;
@synthesize index = _index;
@synthesize hash = _hash;
@synthesize flavorText = _flavorText;
@synthesize equippable = _equippable;
@synthesize inventory = _inventory;
@synthesize damageTypeHashes = _damageTypeHashes;
@synthesize itemTypeAndTierDisplayName = _itemTypeAndTierDisplayName;
@synthesize stats = _stats;
@synthesize blacklisted = _blacklisted;
@synthesize nonTransferrable = _nonTransferrable;
@synthesize defaultDamageTypeHash = _defaultDamageTypeHash;
@synthesize summaryItemHash = _summaryItemHash;
@synthesize itemSubType = _itemSubType;
@synthesize isWrapper = _isWrapper;
@synthesize itemType = _itemType;
@synthesize translationBlock = _translationBlock;
@synthesize action = _action;
@synthesize acquireRewardSiteHash = _acquireRewardSiteHash;
@synthesize equippingBlock = _equippingBlock;
@synthesize perks = _perks;
@synthesize talentGrid = _talentGrid;
@synthesize iconWatermark = _iconWatermark;
@synthesize specialItemType = _specialItemType;
@synthesize defaultDamageType = _defaultDamageType;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kResponseDamageTypes,@"damageTypes",
                         kResponseAllowActions,@"allowActions",
                         kResponseDisplayProperties,@"displayProperties",
                         kResponseTooltipNotifications,@"tooltipNotifications",
                         kResponseClassType,@"classType",
                         kResponsePreview,@"preview",
                         kResponseQuality,@"quality",
                         kResponseScreenshot,@"screenshot",
                         kResponseInvestmentStats,@"investmentStats",
                         kResponseAcquireUnlockHash,@"acquireUnlockHash",
                         kResponseItemCategoryHashes,@"itemCategoryHashes",
                         kResponseIconWatermarkShelved,@"iconWatermarkShelved",
                         kResponseItemTypeDisplayName,@"itemTypeDisplayName",
                         kResponseSockets,@"sockets",
                         kResponseTraitIds,@"traitIds",
                         kResponseUiItemDisplayStyle,@"uiItemDisplayStyle",
                         kResponseDisplaySource,@"displaySource",
                         kResponseDoesPostmasterPullHaveSideEffects,@"doesPostmasterPullHaveSideEffects",
                         kResponseBackgroundColor,@"backgroundColor",
                         kResponseBreakerType,@"breakerType",
                         kResponseRedacted,@"redacted",
                         kResponseCollectibleHash,@"collectibleHash",
                         kResponseIndex,@"index",
                         kResponseHash,@"hash",
                         kResponseFlavorText,@"flavorText",
                         kResponseEquippable,@"equippable",
                         kResponseInventory,@"inventory",
                         kResponseDamageTypeHashes,@"damageTypeHashes",
                         kResponseItemTypeAndTierDisplayName,@"itemTypeAndTierDisplayName",
                         kResponseStats,@"stats",
                         kResponseBlacklisted,@"blacklisted",
                         kResponseNonTransferrable,@"nonTransferrable",
                         kResponseDefaultDamageTypeHash,@"defaultDamageTypeHash",
                         kResponseSummaryItemHash,@"summaryItemHash",
                         kResponseItemSubType,@"itemSubType",
                         kResponseIsWrapper,@"isWrapper",
                         kResponseItemType,@"itemType",
                         kResponseTranslationBlock,@"translationBlock",
                         kResponseAction,@"action",
                         kResponseAcquireRewardSiteHash,@"acquireRewardSiteHash",
                         kResponseEquippingBlock,@"equippingBlock",
                         kResponsePerks,@"perks",
                         kResponseTalentGrid,@"talentGrid",
                         kResponseIconWatermark,@"iconWatermark",
                         kResponseSpecialItemType,@"specialItemType",
                         kResponseDefaultDamageType,@"defaultDamageType",
                         nil];
    
    return map;
}


+ (NSString *)key{
    return nil;
}


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.damageTypes = [self objectOrNilForKey:kResponseDamageTypes fromDictionary:dict];
            self.allowActions = [[self objectOrNilForKey:kResponseAllowActions fromDictionary:dict] boolValue];
            self.displayProperties = [INVDDisplayProperties modelObjectWithDictionary:[dict objectForKey:kResponseDisplayProperties]];
            self.tooltipNotifications = [self objectOrNilForKey:kResponseTooltipNotifications fromDictionary:dict];
            self.classType = [[self objectOrNilForKey:kResponseClassType fromDictionary:dict] doubleValue];
            self.preview = [INVDPreview modelObjectWithDictionary:[dict objectForKey:kResponsePreview]];
            self.quality = [INVDQuality modelObjectWithDictionary:[dict objectForKey:kResponseQuality]];
            self.screenshot = [self objectOrNilForKey:kResponseScreenshot fromDictionary:dict];
    NSObject *receivedInvestmentStats = [dict objectForKey:kResponseInvestmentStats];
    NSMutableArray *parsedInvestmentStats = [NSMutableArray array];
    if ([receivedInvestmentStats isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedInvestmentStats) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedInvestmentStats addObject:[INVDInvestmentStats modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedInvestmentStats isKindOfClass:[NSDictionary class]]) {
       [parsedInvestmentStats addObject:[INVDInvestmentStats modelObjectWithDictionary:(NSDictionary *)receivedInvestmentStats]];
    }

    self.investmentStats = [NSArray arrayWithArray:parsedInvestmentStats];
            self.acquireUnlockHash = [[self objectOrNilForKey:kResponseAcquireUnlockHash fromDictionary:dict] doubleValue];
            self.itemCategoryHashes = [self objectOrNilForKey:kResponseItemCategoryHashes fromDictionary:dict];
            self.iconWatermarkShelved = [self objectOrNilForKey:kResponseIconWatermarkShelved fromDictionary:dict];
            self.itemTypeDisplayName = [self objectOrNilForKey:kResponseItemTypeDisplayName fromDictionary:dict];
            self.sockets = [INVDSockets modelObjectWithDictionary:[dict objectForKey:kResponseSockets]];
            self.traitIds = [self objectOrNilForKey:kResponseTraitIds fromDictionary:dict];
            self.uiItemDisplayStyle = [self objectOrNilForKey:kResponseUiItemDisplayStyle fromDictionary:dict];
            self.displaySource = [self objectOrNilForKey:kResponseDisplaySource fromDictionary:dict];
            self.doesPostmasterPullHaveSideEffects = [[self objectOrNilForKey:kResponseDoesPostmasterPullHaveSideEffects fromDictionary:dict] boolValue];
            self.backgroundColor = [INVDBackgroundColor modelObjectWithDictionary:[dict objectForKey:kResponseBackgroundColor]];
            self.breakerType = [[self objectOrNilForKey:kResponseBreakerType fromDictionary:dict] doubleValue];
            self.redacted = [[self objectOrNilForKey:kResponseRedacted fromDictionary:dict] boolValue];
            self.collectibleHash = [[self objectOrNilForKey:kResponseCollectibleHash fromDictionary:dict] doubleValue];
            self.index = [[self objectOrNilForKey:kResponseIndex fromDictionary:dict] doubleValue];
            self.hash = [[self objectOrNilForKey:kResponseHash fromDictionary:dict] doubleValue];
            self.flavorText = [self objectOrNilForKey:kResponseFlavorText fromDictionary:dict];
            self.equippable = [[self objectOrNilForKey:kResponseEquippable fromDictionary:dict] boolValue];
            self.inventory = [INVDInventory modelObjectWithDictionary:[dict objectForKey:kResponseInventory]];
            self.damageTypeHashes = [self objectOrNilForKey:kResponseDamageTypeHashes fromDictionary:dict];
            self.itemTypeAndTierDisplayName = [self objectOrNilForKey:kResponseItemTypeAndTierDisplayName fromDictionary:dict];
            self.stats = [dict objectForKey:kResponseStats];
            self.blacklisted = [[self objectOrNilForKey:kResponseBlacklisted fromDictionary:dict] boolValue];
            self.nonTransferrable = [[self objectOrNilForKey:kResponseNonTransferrable fromDictionary:dict] boolValue];
            self.defaultDamageTypeHash = [[self objectOrNilForKey:kResponseDefaultDamageTypeHash fromDictionary:dict] doubleValue];
            self.summaryItemHash = [[self objectOrNilForKey:kResponseSummaryItemHash fromDictionary:dict] doubleValue];
            self.itemSubType = [[self objectOrNilForKey:kResponseItemSubType fromDictionary:dict] doubleValue];
            self.isWrapper = [[self objectOrNilForKey:kResponseIsWrapper fromDictionary:dict] boolValue];
            self.itemType = [[self objectOrNilForKey:kResponseItemType fromDictionary:dict] doubleValue];
            self.translationBlock = [dict objectForKey:kResponseTranslationBlock];
            self.action =  [dict objectForKey:kResponseAction];
            self.acquireRewardSiteHash = [[self objectOrNilForKey:kResponseAcquireRewardSiteHash fromDictionary:dict] doubleValue];
            self.equippingBlock = [dict objectForKey:kResponseEquippingBlock];
            self.perks = [self objectOrNilForKey:kResponsePerks fromDictionary:dict];
            self.talentGrid = [dict objectForKey:kResponseTalentGrid];
            self.iconWatermark = [self objectOrNilForKey:kResponseIconWatermark fromDictionary:dict];
            self.specialItemType = [[self objectOrNilForKey:kResponseSpecialItemType fromDictionary:dict] doubleValue];
            self.defaultDamageType = [[self objectOrNilForKey:kResponseDefaultDamageType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForDamageTypes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.damageTypes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDamageTypes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDamageTypes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDamageTypes] forKey:kResponseDamageTypes];
    [mutableDict setValue:[NSNumber numberWithBool:self.allowActions] forKey:kResponseAllowActions];
    [mutableDict setValue:[self.displayProperties dictionaryRepresentation] forKey:kResponseDisplayProperties];
    NSMutableArray *tempArrayForTooltipNotifications = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tooltipNotifications) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTooltipNotifications addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTooltipNotifications addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTooltipNotifications] forKey:kResponseTooltipNotifications];
    [mutableDict setValue:[NSNumber numberWithDouble:self.classType] forKey:kResponseClassType];
    [mutableDict setValue:[self.preview dictionaryRepresentation] forKey:kResponsePreview];
    [mutableDict setValue:[self.quality dictionaryRepresentation] forKey:kResponseQuality];
    [mutableDict setValue:self.screenshot forKey:kResponseScreenshot];
    NSMutableArray *tempArrayForInvestmentStats = [NSMutableArray array];
    for (NSObject *subArrayObject in self.investmentStats) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForInvestmentStats addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForInvestmentStats addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForInvestmentStats] forKey:kResponseInvestmentStats];
    [mutableDict setValue:[NSNumber numberWithDouble:self.acquireUnlockHash] forKey:kResponseAcquireUnlockHash];
    NSMutableArray *tempArrayForItemCategoryHashes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.itemCategoryHashes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItemCategoryHashes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItemCategoryHashes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItemCategoryHashes] forKey:kResponseItemCategoryHashes];
    [mutableDict setValue:self.iconWatermarkShelved forKey:kResponseIconWatermarkShelved];
    [mutableDict setValue:self.itemTypeDisplayName forKey:kResponseItemTypeDisplayName];
    [mutableDict setValue:[self.sockets dictionaryRepresentation] forKey:kResponseSockets];
    NSMutableArray *tempArrayForTraitIds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.traitIds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTraitIds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTraitIds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTraitIds] forKey:kResponseTraitIds];
    [mutableDict setValue:self.uiItemDisplayStyle forKey:kResponseUiItemDisplayStyle];
    [mutableDict setValue:self.displaySource forKey:kResponseDisplaySource];
    [mutableDict setValue:[NSNumber numberWithBool:self.doesPostmasterPullHaveSideEffects] forKey:kResponseDoesPostmasterPullHaveSideEffects];
    [mutableDict setValue:[self.backgroundColor dictionaryRepresentation] forKey:kResponseBackgroundColor];
    [mutableDict setValue:[NSNumber numberWithDouble:self.breakerType] forKey:kResponseBreakerType];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kResponseRedacted];
    [mutableDict setValue:[NSNumber numberWithDouble:self.collectibleHash] forKey:kResponseCollectibleHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kResponseIndex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kResponseHash];
    [mutableDict setValue:self.flavorText forKey:kResponseFlavorText];
    [mutableDict setValue:[NSNumber numberWithBool:self.equippable] forKey:kResponseEquippable];
    [mutableDict setValue:[self.inventory dictionaryRepresentation] forKey:kResponseInventory];
    NSMutableArray *tempArrayForDamageTypeHashes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.damageTypeHashes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDamageTypeHashes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDamageTypeHashes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDamageTypeHashes] forKey:kResponseDamageTypeHashes];
    [mutableDict setValue:self.itemTypeAndTierDisplayName forKey:kResponseItemTypeAndTierDisplayName];
    [mutableDict setValue:self.stats forKey:kResponseStats];
    [mutableDict setValue:[NSNumber numberWithBool:self.blacklisted] forKey:kResponseBlacklisted];
    [mutableDict setValue:[NSNumber numberWithBool:self.nonTransferrable] forKey:kResponseNonTransferrable];
    [mutableDict setValue:[NSNumber numberWithDouble:self.defaultDamageTypeHash] forKey:kResponseDefaultDamageTypeHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.summaryItemHash] forKey:kResponseSummaryItemHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemSubType] forKey:kResponseItemSubType];
    [mutableDict setValue:[NSNumber numberWithBool:self.isWrapper] forKey:kResponseIsWrapper];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemType] forKey:kResponseItemType];
    [mutableDict setValue:self.translationBlock forKey:kResponseTranslationBlock];
    [mutableDict setValue:self.action  forKey:kResponseAction];
    [mutableDict setValue:[NSNumber numberWithDouble:self.acquireRewardSiteHash] forKey:kResponseAcquireRewardSiteHash];
    [mutableDict setValue:self.equippingBlock  forKey:kResponseEquippingBlock];
    NSMutableArray *tempArrayForPerks = [NSMutableArray array];
    for (NSObject *subArrayObject in self.perks) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPerks addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPerks addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPerks] forKey:kResponsePerks];
    [mutableDict setValue:self.talentGrid  forKey:kResponseTalentGrid];
    [mutableDict setValue:self.iconWatermark forKey:kResponseIconWatermark];
    [mutableDict setValue:[NSNumber numberWithDouble:self.specialItemType] forKey:kResponseSpecialItemType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.defaultDamageType] forKey:kResponseDefaultDamageType];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.damageTypes = [aDecoder decodeObjectForKey:kResponseDamageTypes];
    self.allowActions = [aDecoder decodeBoolForKey:kResponseAllowActions];
    self.displayProperties = [aDecoder decodeObjectForKey:kResponseDisplayProperties];
    self.tooltipNotifications = [aDecoder decodeObjectForKey:kResponseTooltipNotifications];
    self.classType = [aDecoder decodeDoubleForKey:kResponseClassType];
    self.preview = [aDecoder decodeObjectForKey:kResponsePreview];
    self.quality = [aDecoder decodeObjectForKey:kResponseQuality];
    self.screenshot = [aDecoder decodeObjectForKey:kResponseScreenshot];
    self.investmentStats = [aDecoder decodeObjectForKey:kResponseInvestmentStats];
    self.acquireUnlockHash = [aDecoder decodeDoubleForKey:kResponseAcquireUnlockHash];
    self.itemCategoryHashes = [aDecoder decodeObjectForKey:kResponseItemCategoryHashes];
    self.iconWatermarkShelved = [aDecoder decodeObjectForKey:kResponseIconWatermarkShelved];
    self.itemTypeDisplayName = [aDecoder decodeObjectForKey:kResponseItemTypeDisplayName];
    self.sockets = [aDecoder decodeObjectForKey:kResponseSockets];
    self.traitIds = [aDecoder decodeObjectForKey:kResponseTraitIds];
    self.uiItemDisplayStyle = [aDecoder decodeObjectForKey:kResponseUiItemDisplayStyle];
    self.displaySource = [aDecoder decodeObjectForKey:kResponseDisplaySource];
    self.doesPostmasterPullHaveSideEffects = [aDecoder decodeBoolForKey:kResponseDoesPostmasterPullHaveSideEffects];
    self.backgroundColor = [aDecoder decodeObjectForKey:kResponseBackgroundColor];
    self.breakerType = [aDecoder decodeDoubleForKey:kResponseBreakerType];
    self.redacted = [aDecoder decodeBoolForKey:kResponseRedacted];
    self.collectibleHash = [aDecoder decodeDoubleForKey:kResponseCollectibleHash];
    self.index = [aDecoder decodeDoubleForKey:kResponseIndex];
    self.hash = [aDecoder decodeDoubleForKey:kResponseHash];
    self.flavorText = [aDecoder decodeObjectForKey:kResponseFlavorText];
    self.equippable = [aDecoder decodeBoolForKey:kResponseEquippable];
    self.inventory = [aDecoder decodeObjectForKey:kResponseInventory];
    self.damageTypeHashes = [aDecoder decodeObjectForKey:kResponseDamageTypeHashes];
    self.itemTypeAndTierDisplayName = [aDecoder decodeObjectForKey:kResponseItemTypeAndTierDisplayName];
    self.stats = [aDecoder decodeObjectForKey:kResponseStats];
    self.blacklisted = [aDecoder decodeBoolForKey:kResponseBlacklisted];
    self.nonTransferrable = [aDecoder decodeBoolForKey:kResponseNonTransferrable];
    self.defaultDamageTypeHash = [aDecoder decodeDoubleForKey:kResponseDefaultDamageTypeHash];
    self.summaryItemHash = [aDecoder decodeDoubleForKey:kResponseSummaryItemHash];
    self.itemSubType = [aDecoder decodeDoubleForKey:kResponseItemSubType];
    self.isWrapper = [aDecoder decodeBoolForKey:kResponseIsWrapper];
    self.itemType = [aDecoder decodeDoubleForKey:kResponseItemType];
    self.translationBlock = [aDecoder decodeObjectForKey:kResponseTranslationBlock];
    self.action = [aDecoder decodeObjectForKey:kResponseAction];
    self.acquireRewardSiteHash = [aDecoder decodeDoubleForKey:kResponseAcquireRewardSiteHash];
    self.equippingBlock = [aDecoder decodeObjectForKey:kResponseEquippingBlock];
    self.perks = [aDecoder decodeObjectForKey:kResponsePerks];
    self.talentGrid = [aDecoder decodeObjectForKey:kResponseTalentGrid];
    self.iconWatermark = [aDecoder decodeObjectForKey:kResponseIconWatermark];
    self.specialItemType = [aDecoder decodeDoubleForKey:kResponseSpecialItemType];
    self.defaultDamageType = [aDecoder decodeDoubleForKey:kResponseDefaultDamageType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_damageTypes forKey:kResponseDamageTypes];
    [aCoder encodeBool:_allowActions forKey:kResponseAllowActions];
    [aCoder encodeObject:_displayProperties forKey:kResponseDisplayProperties];
    [aCoder encodeObject:_tooltipNotifications forKey:kResponseTooltipNotifications];
    [aCoder encodeDouble:_classType forKey:kResponseClassType];
    [aCoder encodeObject:_preview forKey:kResponsePreview];
    [aCoder encodeObject:_quality forKey:kResponseQuality];
    [aCoder encodeObject:_screenshot forKey:kResponseScreenshot];
    [aCoder encodeObject:_investmentStats forKey:kResponseInvestmentStats];
    [aCoder encodeDouble:_acquireUnlockHash forKey:kResponseAcquireUnlockHash];
    [aCoder encodeObject:_itemCategoryHashes forKey:kResponseItemCategoryHashes];
    [aCoder encodeObject:_iconWatermarkShelved forKey:kResponseIconWatermarkShelved];
    [aCoder encodeObject:_itemTypeDisplayName forKey:kResponseItemTypeDisplayName];
    [aCoder encodeObject:_sockets forKey:kResponseSockets];
    [aCoder encodeObject:_traitIds forKey:kResponseTraitIds];
    [aCoder encodeObject:_uiItemDisplayStyle forKey:kResponseUiItemDisplayStyle];
    [aCoder encodeObject:_displaySource forKey:kResponseDisplaySource];
    [aCoder encodeBool:_doesPostmasterPullHaveSideEffects forKey:kResponseDoesPostmasterPullHaveSideEffects];
    [aCoder encodeObject:_backgroundColor forKey:kResponseBackgroundColor];
    [aCoder encodeDouble:_breakerType forKey:kResponseBreakerType];
    [aCoder encodeBool:_redacted forKey:kResponseRedacted];
    [aCoder encodeDouble:_collectibleHash forKey:kResponseCollectibleHash];
    [aCoder encodeDouble:_index forKey:kResponseIndex];
    [aCoder encodeDouble:_hash forKey:kResponseHash];
    [aCoder encodeObject:_flavorText forKey:kResponseFlavorText];
    [aCoder encodeBool:_equippable forKey:kResponseEquippable];
    [aCoder encodeObject:_inventory forKey:kResponseInventory];
    [aCoder encodeObject:_damageTypeHashes forKey:kResponseDamageTypeHashes];
    [aCoder encodeObject:_itemTypeAndTierDisplayName forKey:kResponseItemTypeAndTierDisplayName];
    [aCoder encodeObject:_stats forKey:kResponseStats];
    [aCoder encodeBool:_blacklisted forKey:kResponseBlacklisted];
    [aCoder encodeBool:_nonTransferrable forKey:kResponseNonTransferrable];
    [aCoder encodeDouble:_defaultDamageTypeHash forKey:kResponseDefaultDamageTypeHash];
    [aCoder encodeDouble:_summaryItemHash forKey:kResponseSummaryItemHash];
    [aCoder encodeDouble:_itemSubType forKey:kResponseItemSubType];
    [aCoder encodeBool:_isWrapper forKey:kResponseIsWrapper];
    [aCoder encodeDouble:_itemType forKey:kResponseItemType];
    [aCoder encodeObject:_translationBlock forKey:kResponseTranslationBlock];
    [aCoder encodeObject:_action forKey:kResponseAction];
    [aCoder encodeDouble:_acquireRewardSiteHash forKey:kResponseAcquireRewardSiteHash];
    [aCoder encodeObject:_equippingBlock forKey:kResponseEquippingBlock];
    [aCoder encodeObject:_perks forKey:kResponsePerks];
    [aCoder encodeObject:_talentGrid forKey:kResponseTalentGrid];
    [aCoder encodeObject:_iconWatermark forKey:kResponseIconWatermark];
    [aCoder encodeDouble:_specialItemType forKey:kResponseSpecialItemType];
    [aCoder encodeDouble:_defaultDamageType forKey:kResponseDefaultDamageType];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVDResponse *copy = [[INVDResponse alloc] init];
    
    if (copy) {

        copy.damageTypes = [self.damageTypes copyWithZone:zone];
        copy.allowActions = self.allowActions;
        copy.displayProperties = [self.displayProperties copyWithZone:zone];
        copy.tooltipNotifications = [self.tooltipNotifications copyWithZone:zone];
        copy.classType = self.classType;
        copy.preview = [self.preview copyWithZone:zone];
        copy.quality = [self.quality copyWithZone:zone];
        copy.screenshot = [self.screenshot copyWithZone:zone];
        copy.investmentStats = [self.investmentStats copyWithZone:zone];
        copy.acquireUnlockHash = self.acquireUnlockHash;
        copy.itemCategoryHashes = [self.itemCategoryHashes copyWithZone:zone];
        copy.iconWatermarkShelved = [self.iconWatermarkShelved copyWithZone:zone];
        copy.itemTypeDisplayName = [self.itemTypeDisplayName copyWithZone:zone];
        copy.sockets = [self.sockets copyWithZone:zone];
        copy.traitIds = [self.traitIds copyWithZone:zone];
        copy.uiItemDisplayStyle = [self.uiItemDisplayStyle copyWithZone:zone];
        copy.displaySource = [self.displaySource copyWithZone:zone];
        copy.doesPostmasterPullHaveSideEffects = self.doesPostmasterPullHaveSideEffects;
        copy.backgroundColor = [self.backgroundColor copyWithZone:zone];
        copy.breakerType = self.breakerType;
        copy.redacted = self.redacted;
        copy.collectibleHash = self.collectibleHash;
        copy.index = self.index;
        copy.hash = self.hash;
        copy.flavorText = [self.flavorText copyWithZone:zone];
        copy.equippable = self.equippable;
        copy.inventory = [self.inventory copyWithZone:zone];
        copy.damageTypeHashes = [self.damageTypeHashes copyWithZone:zone];
        copy.itemTypeAndTierDisplayName = [self.itemTypeAndTierDisplayName copyWithZone:zone];
        copy.stats = [self.stats copyWithZone:zone];
        copy.blacklisted = self.blacklisted;
        copy.nonTransferrable = self.nonTransferrable;
        copy.defaultDamageTypeHash = self.defaultDamageTypeHash;
        copy.summaryItemHash = self.summaryItemHash;
        copy.itemSubType = self.itemSubType;
        copy.isWrapper = self.isWrapper;
        copy.itemType = self.itemType;
        copy.translationBlock = [self.translationBlock copyWithZone:zone];
        copy.action = [self.action copyWithZone:zone];
        copy.acquireRewardSiteHash = self.acquireRewardSiteHash;
        copy.equippingBlock = [self.equippingBlock copyWithZone:zone];
        copy.perks = [self.perks copyWithZone:zone];
        copy.talentGrid = [self.talentGrid copyWithZone:zone];
        copy.iconWatermark = [self.iconWatermark copyWithZone:zone];
        copy.specialItemType = self.specialItemType;
        copy.defaultDamageType = self.defaultDamageType;
    }
    
    return copy;
}


@end

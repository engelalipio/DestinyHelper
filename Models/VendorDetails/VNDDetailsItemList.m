//
//  ItemList.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsItemList.h"
#import "VNDDetailsCreationLevels.h"
#import "VNDDetailsAction.h"
#import "VNDDetailsCurrencies.h"


NSString *const kItemListCreationLevels = @"creationLevels";
NSString *const kItemListWeight = @"weight";
NSString *const kItemListPriceOverrideEnabled = @"priceOverrideEnabled";
NSString *const kItemListLicenseUnlockHash = @"licenseUnlockHash";
NSString *const kItemListVendorItemIndex = @"vendorItemIndex";
NSString *const kItemListRefundPolicy = @"refundPolicy";
NSString *const kItemListRewardAdjustorPointerHash = @"rewardAdjustorPointerHash";
NSString *const kItemListInventoryBucketHash = @"inventoryBucketHash";
NSString *const kItemListSocketOverrides = @"socketOverrides";
NSString *const kItemListVisibilityScope = @"visibilityScope";
NSString *const kItemListAction = @"action";
NSString *const kItemListCurrencies = @"currencies";
NSString *const kItemListDisplayCategoryIndex = @"displayCategoryIndex";
NSString *const kItemListItemHash = @"itemHash";
NSString *const kItemListUnpurchasable = @"unpurchasable";
NSString *const kItemListSeedOverride = @"seedOverride";
NSString *const kItemListExclusivity = @"exclusivity";
NSString *const kItemListSortValue = @"sortValue";
NSString *const kItemListFailureIndexes = @"failureIndexes";
NSString *const kItemListQuantity = @"quantity";
NSString *const kItemListPurchasableScope = @"purchasableScope";
NSString *const kItemListRedirectToSaleIndexes = @"redirectToSaleIndexes";
NSString *const kItemListMaximumLevel = @"maximumLevel";
NSString *const kItemListRefundTimeLimit = @"refundTimeLimit";
NSString *const kItemListExpirationTooltip = @"expirationTooltip";
NSString *const kItemListOriginalCategoryIndex = @"originalCategoryIndex";
NSString *const kItemListDisplayCategory = @"displayCategory";
NSString *const kItemListMinimumLevel = @"minimumLevel";
NSString *const kItemListCategoryIndex = @"categoryIndex";


@interface VNDDetailsItemList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsItemList

@synthesize creationLevels = _creationLevels;
@synthesize weight = _weight;
@synthesize priceOverrideEnabled = _priceOverrideEnabled;
@synthesize licenseUnlockHash = _licenseUnlockHash;
@synthesize vendorItemIndex = _vendorItemIndex;
@synthesize refundPolicy = _refundPolicy;
@synthesize rewardAdjustorPointerHash = _rewardAdjustorPointerHash;
@synthesize inventoryBucketHash = _inventoryBucketHash;
@synthesize socketOverrides = _socketOverrides;
@synthesize visibilityScope = _visibilityScope;
@synthesize action = _action;
@synthesize currencies = _currencies;
@synthesize displayCategoryIndex = _displayCategoryIndex;
@synthesize itemHash = _itemHash;
@synthesize unpurchasable = _unpurchasable;
@synthesize seedOverride = _seedOverride;
@synthesize exclusivity = _exclusivity;
@synthesize sortValue = _sortValue;
@synthesize failureIndexes = _failureIndexes;
@synthesize quantity = _quantity;
@synthesize purchasableScope = _purchasableScope;
@synthesize redirectToSaleIndexes = _redirectToSaleIndexes;
@synthesize maximumLevel = _maximumLevel;
@synthesize refundTimeLimit = _refundTimeLimit;
@synthesize expirationTooltip = _expirationTooltip;
@synthesize originalCategoryIndex = _originalCategoryIndex;
@synthesize displayCategory = _displayCategory;
@synthesize minimumLevel = _minimumLevel;
@synthesize categoryIndex = _categoryIndex;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kItemListItemHash,@"itemHash",
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
    NSObject *receivedCreationLevels = [dict objectForKey:kItemListCreationLevels];
    NSMutableArray *parsedCreationLevels = [NSMutableArray array];
    if ([receivedCreationLevels isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCreationLevels) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCreationLevels addObject:[VNDDetailsCreationLevels modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCreationLevels isKindOfClass:[NSDictionary class]]) {
       [parsedCreationLevels addObject:[VNDDetailsCreationLevels modelObjectWithDictionary:(NSDictionary *)receivedCreationLevels]];
    }

    self.creationLevels = [NSArray arrayWithArray:parsedCreationLevels];
            self.weight = [[self objectOrNilForKey:kItemListWeight fromDictionary:dict] doubleValue];
            self.priceOverrideEnabled = [[self objectOrNilForKey:kItemListPriceOverrideEnabled fromDictionary:dict] boolValue];
            self.licenseUnlockHash = [[self objectOrNilForKey:kItemListLicenseUnlockHash fromDictionary:dict] doubleValue];
            self.vendorItemIndex = [[self objectOrNilForKey:kItemListVendorItemIndex fromDictionary:dict] doubleValue];
            self.refundPolicy = [[self objectOrNilForKey:kItemListRefundPolicy fromDictionary:dict] doubleValue];
            self.rewardAdjustorPointerHash = [[self objectOrNilForKey:kItemListRewardAdjustorPointerHash fromDictionary:dict] doubleValue];
            self.inventoryBucketHash = [[self objectOrNilForKey:kItemListInventoryBucketHash fromDictionary:dict] doubleValue];
            self.socketOverrides = [self objectOrNilForKey:kItemListSocketOverrides fromDictionary:dict];
            self.visibilityScope = [[self objectOrNilForKey:kItemListVisibilityScope fromDictionary:dict] doubleValue];
            self.action = [VNDDetailsAction modelObjectWithDictionary:[dict objectForKey:kItemListAction]];
    
            self.currencies = [self objectOrNilForKey:kItemListCurrencies fromDictionary:dict];

       
            self.displayCategoryIndex = [[self objectOrNilForKey:kItemListDisplayCategoryIndex fromDictionary:dict] doubleValue];
            self.itemHash = [[self objectOrNilForKey:kItemListItemHash fromDictionary:dict] doubleValue];
            self.unpurchasable = [[self objectOrNilForKey:kItemListUnpurchasable fromDictionary:dict] boolValue];
            self.seedOverride = [[self objectOrNilForKey:kItemListSeedOverride fromDictionary:dict] doubleValue];
            self.exclusivity = [[self objectOrNilForKey:kItemListExclusivity fromDictionary:dict] doubleValue];
            self.sortValue = [[self objectOrNilForKey:kItemListSortValue fromDictionary:dict] doubleValue];
            self.failureIndexes = [self objectOrNilForKey:kItemListFailureIndexes fromDictionary:dict];
            self.quantity = [[self objectOrNilForKey:kItemListQuantity fromDictionary:dict] doubleValue];
            self.purchasableScope = [[self objectOrNilForKey:kItemListPurchasableScope fromDictionary:dict] doubleValue];
            self.redirectToSaleIndexes = [self objectOrNilForKey:kItemListRedirectToSaleIndexes fromDictionary:dict];
            self.maximumLevel = [[self objectOrNilForKey:kItemListMaximumLevel fromDictionary:dict] doubleValue];
            self.refundTimeLimit = [[self objectOrNilForKey:kItemListRefundTimeLimit fromDictionary:dict] doubleValue];
            self.expirationTooltip = [self objectOrNilForKey:kItemListExpirationTooltip fromDictionary:dict];
            self.originalCategoryIndex = [[self objectOrNilForKey:kItemListOriginalCategoryIndex fromDictionary:dict] doubleValue];
            self.displayCategory = [self objectOrNilForKey:kItemListDisplayCategory fromDictionary:dict];
            self.minimumLevel = [[self objectOrNilForKey:kItemListMinimumLevel fromDictionary:dict] doubleValue];
            self.categoryIndex = [[self objectOrNilForKey:kItemListCategoryIndex fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForCreationLevels = [NSMutableArray array];
    for (NSObject *subArrayObject in self.creationLevels) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCreationLevels addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCreationLevels addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCreationLevels] forKey:kItemListCreationLevels];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kItemListWeight];
    [mutableDict setValue:[NSNumber numberWithBool:self.priceOverrideEnabled] forKey:kItemListPriceOverrideEnabled];
    [mutableDict setValue:[NSNumber numberWithDouble:self.licenseUnlockHash] forKey:kItemListLicenseUnlockHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vendorItemIndex] forKey:kItemListVendorItemIndex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.refundPolicy] forKey:kItemListRefundPolicy];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rewardAdjustorPointerHash] forKey:kItemListRewardAdjustorPointerHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.inventoryBucketHash] forKey:kItemListInventoryBucketHash];
    NSMutableArray *tempArrayForSocketOverrides = [NSMutableArray array];
    for (NSObject *subArrayObject in self.socketOverrides) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSocketOverrides addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSocketOverrides addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSocketOverrides] forKey:kItemListSocketOverrides];
    [mutableDict setValue:[NSNumber numberWithDouble:self.visibilityScope] forKey:kItemListVisibilityScope];
    [mutableDict setValue:[self.action dictionaryRepresentation] forKey:kItemListAction];
    NSMutableArray *tempArrayForCurrencies = [NSMutableArray array];
    for (NSObject *subArrayObject in self.currencies) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCurrencies addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCurrencies addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCurrencies] forKey:kItemListCurrencies];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayCategoryIndex] forKey:kItemListDisplayCategoryIndex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemHash] forKey:kItemListItemHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.unpurchasable] forKey:kItemListUnpurchasable];
    [mutableDict setValue:[NSNumber numberWithDouble:self.seedOverride] forKey:kItemListSeedOverride];
    [mutableDict setValue:[NSNumber numberWithDouble:self.exclusivity] forKey:kItemListExclusivity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sortValue] forKey:kItemListSortValue];
    NSMutableArray *tempArrayForFailureIndexes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.failureIndexes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForFailureIndexes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForFailureIndexes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForFailureIndexes] forKey:kItemListFailureIndexes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.quantity] forKey:kItemListQuantity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.purchasableScope] forKey:kItemListPurchasableScope];
    NSMutableArray *tempArrayForRedirectToSaleIndexes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.redirectToSaleIndexes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRedirectToSaleIndexes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRedirectToSaleIndexes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRedirectToSaleIndexes] forKey:kItemListRedirectToSaleIndexes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maximumLevel] forKey:kItemListMaximumLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.refundTimeLimit] forKey:kItemListRefundTimeLimit];
    [mutableDict setValue:self.expirationTooltip forKey:kItemListExpirationTooltip];
    [mutableDict setValue:[NSNumber numberWithDouble:self.originalCategoryIndex] forKey:kItemListOriginalCategoryIndex];
    [mutableDict setValue:self.displayCategory forKey:kItemListDisplayCategory];
    [mutableDict setValue:[NSNumber numberWithDouble:self.minimumLevel] forKey:kItemListMinimumLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryIndex] forKey:kItemListCategoryIndex];

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

    self.creationLevels = [aDecoder decodeObjectForKey:kItemListCreationLevels];
    self.weight = [aDecoder decodeDoubleForKey:kItemListWeight];
    self.priceOverrideEnabled = [aDecoder decodeBoolForKey:kItemListPriceOverrideEnabled];
    self.licenseUnlockHash = [aDecoder decodeDoubleForKey:kItemListLicenseUnlockHash];
    self.vendorItemIndex = [aDecoder decodeDoubleForKey:kItemListVendorItemIndex];
    self.refundPolicy = [aDecoder decodeDoubleForKey:kItemListRefundPolicy];
    self.rewardAdjustorPointerHash = [aDecoder decodeDoubleForKey:kItemListRewardAdjustorPointerHash];
    self.inventoryBucketHash = [aDecoder decodeDoubleForKey:kItemListInventoryBucketHash];
    self.socketOverrides = [aDecoder decodeObjectForKey:kItemListSocketOverrides];
    self.visibilityScope = [aDecoder decodeDoubleForKey:kItemListVisibilityScope];
    self.action = [aDecoder decodeObjectForKey:kItemListAction];
    self.currencies = [aDecoder decodeObjectForKey:kItemListCurrencies];
    self.displayCategoryIndex = [aDecoder decodeDoubleForKey:kItemListDisplayCategoryIndex];
    self.itemHash = [aDecoder decodeDoubleForKey:kItemListItemHash];
    self.unpurchasable = [aDecoder decodeBoolForKey:kItemListUnpurchasable];
    self.seedOverride = [aDecoder decodeDoubleForKey:kItemListSeedOverride];
    self.exclusivity = [aDecoder decodeDoubleForKey:kItemListExclusivity];
    self.sortValue = [aDecoder decodeDoubleForKey:kItemListSortValue];
    self.failureIndexes = [aDecoder decodeObjectForKey:kItemListFailureIndexes];
    self.quantity = [aDecoder decodeDoubleForKey:kItemListQuantity];
    self.purchasableScope = [aDecoder decodeDoubleForKey:kItemListPurchasableScope];
    self.redirectToSaleIndexes = [aDecoder decodeObjectForKey:kItemListRedirectToSaleIndexes];
    self.maximumLevel = [aDecoder decodeDoubleForKey:kItemListMaximumLevel];
    self.refundTimeLimit = [aDecoder decodeDoubleForKey:kItemListRefundTimeLimit];
    self.expirationTooltip = [aDecoder decodeObjectForKey:kItemListExpirationTooltip];
    self.originalCategoryIndex = [aDecoder decodeDoubleForKey:kItemListOriginalCategoryIndex];
    self.displayCategory = [aDecoder decodeObjectForKey:kItemListDisplayCategory];
    self.minimumLevel = [aDecoder decodeDoubleForKey:kItemListMinimumLevel];
    self.categoryIndex = [aDecoder decodeDoubleForKey:kItemListCategoryIndex];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_creationLevels forKey:kItemListCreationLevels];
    [aCoder encodeDouble:_weight forKey:kItemListWeight];
    [aCoder encodeBool:_priceOverrideEnabled forKey:kItemListPriceOverrideEnabled];
    [aCoder encodeDouble:_licenseUnlockHash forKey:kItemListLicenseUnlockHash];
    [aCoder encodeDouble:_vendorItemIndex forKey:kItemListVendorItemIndex];
    [aCoder encodeDouble:_refundPolicy forKey:kItemListRefundPolicy];
    [aCoder encodeDouble:_rewardAdjustorPointerHash forKey:kItemListRewardAdjustorPointerHash];
    [aCoder encodeDouble:_inventoryBucketHash forKey:kItemListInventoryBucketHash];
    [aCoder encodeObject:_socketOverrides forKey:kItemListSocketOverrides];
    [aCoder encodeDouble:_visibilityScope forKey:kItemListVisibilityScope];
    [aCoder encodeObject:_action forKey:kItemListAction];
    [aCoder encodeObject:_currencies forKey:kItemListCurrencies];
    [aCoder encodeDouble:_displayCategoryIndex forKey:kItemListDisplayCategoryIndex];
    [aCoder encodeDouble:_itemHash forKey:kItemListItemHash];
    [aCoder encodeBool:_unpurchasable forKey:kItemListUnpurchasable];
    [aCoder encodeDouble:_seedOverride forKey:kItemListSeedOverride];
    [aCoder encodeDouble:_exclusivity forKey:kItemListExclusivity];
    [aCoder encodeDouble:_sortValue forKey:kItemListSortValue];
    [aCoder encodeObject:_failureIndexes forKey:kItemListFailureIndexes];
    [aCoder encodeDouble:_quantity forKey:kItemListQuantity];
    [aCoder encodeDouble:_purchasableScope forKey:kItemListPurchasableScope];
    [aCoder encodeObject:_redirectToSaleIndexes forKey:kItemListRedirectToSaleIndexes];
    [aCoder encodeDouble:_maximumLevel forKey:kItemListMaximumLevel];
    [aCoder encodeDouble:_refundTimeLimit forKey:kItemListRefundTimeLimit];
    [aCoder encodeObject:_expirationTooltip forKey:kItemListExpirationTooltip];
    [aCoder encodeDouble:_originalCategoryIndex forKey:kItemListOriginalCategoryIndex];
    [aCoder encodeObject:_displayCategory forKey:kItemListDisplayCategory];
    [aCoder encodeDouble:_minimumLevel forKey:kItemListMinimumLevel];
    [aCoder encodeDouble:_categoryIndex forKey:kItemListCategoryIndex];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsItemList *copy = [[VNDDetailsItemList alloc] init];
    
    if (copy) {

        copy.creationLevels = [self.creationLevels copyWithZone:zone];
        copy.weight = self.weight;
        copy.priceOverrideEnabled = self.priceOverrideEnabled;
        copy.licenseUnlockHash = self.licenseUnlockHash;
        copy.vendorItemIndex = self.vendorItemIndex;
        copy.refundPolicy = self.refundPolicy;
        copy.rewardAdjustorPointerHash = self.rewardAdjustorPointerHash;
        copy.inventoryBucketHash = self.inventoryBucketHash;
        copy.socketOverrides = [self.socketOverrides copyWithZone:zone];
        copy.visibilityScope = self.visibilityScope;
        copy.action = [self.action copyWithZone:zone];
        copy.currencies = [self.currencies copyWithZone:zone];
        copy.displayCategoryIndex = self.displayCategoryIndex;
        copy.itemHash = self.itemHash;
        copy.unpurchasable = self.unpurchasable;
        copy.seedOverride = self.seedOverride;
        copy.exclusivity = self.exclusivity;
        copy.sortValue = self.sortValue;
        copy.failureIndexes = [self.failureIndexes copyWithZone:zone];
        copy.quantity = self.quantity;
        copy.purchasableScope = self.purchasableScope;
        copy.redirectToSaleIndexes = [self.redirectToSaleIndexes copyWithZone:zone];
        copy.maximumLevel = self.maximumLevel;
        copy.refundTimeLimit = self.refundTimeLimit;
        copy.expirationTooltip = [self.expirationTooltip copyWithZone:zone];
        copy.originalCategoryIndex = self.originalCategoryIndex;
        copy.displayCategory = [self.displayCategory copyWithZone:zone];
        copy.minimumLevel = self.minimumLevel;
        copy.categoryIndex = self.categoryIndex;
    }
    
    return copy;
}


@end

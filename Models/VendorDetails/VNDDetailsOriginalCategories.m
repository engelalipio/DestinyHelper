//
//  OriginalCategories.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsOriginalCategories.h"


NSString *const kOriginalCategoriesQuantityAvailable = @"quantityAvailable";
NSString *const kOriginalCategoriesHideIfNoCurrency = @"hideIfNoCurrency";
NSString *const kOriginalCategoriesIsPreview = @"isPreview";
NSString *const kOriginalCategoriesBuyStringOverride = @"buyStringOverride";
NSString *const kOriginalCategoriesIsDisplayOnly = @"isDisplayOnly";
NSString *const kOriginalCategoriesCategoryHash = @"categoryHash";
NSString *const kOriginalCategoriesResetIntervalMinutesOverride = @"resetIntervalMinutesOverride";
NSString *const kOriginalCategoriesSortValue = @"sortValue";
NSString *const kOriginalCategoriesDisabledDescription = @"disabledDescription";
NSString *const kOriginalCategoriesShowUnavailableItems = @"showUnavailableItems";
NSString *const kOriginalCategoriesHideFromRegularPurchase = @"hideFromRegularPurchase";
NSString *const kOriginalCategoriesVendorItemIndexes = @"vendorItemIndexes";
NSString *const kOriginalCategoriesResetOffsetMinutesOverride = @"resetOffsetMinutesOverride";
NSString *const kOriginalCategoriesCategoryIndex = @"categoryIndex";


@interface VNDDetailsOriginalCategories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsOriginalCategories

@synthesize quantityAvailable = _quantityAvailable;
@synthesize hideIfNoCurrency = _hideIfNoCurrency;
@synthesize isPreview = _isPreview;
@synthesize buyStringOverride = _buyStringOverride;
@synthesize isDisplayOnly = _isDisplayOnly;
@synthesize categoryHash = _categoryHash;
@synthesize resetIntervalMinutesOverride = _resetIntervalMinutesOverride;
@synthesize sortValue = _sortValue;
@synthesize disabledDescription = _disabledDescription;
@synthesize showUnavailableItems = _showUnavailableItems;
@synthesize hideFromRegularPurchase = _hideFromRegularPurchase;
@synthesize vendorItemIndexes = _vendorItemIndexes;
@synthesize resetOffsetMinutesOverride = _resetOffsetMinutesOverride;
@synthesize categoryIndex = _categoryIndex;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kOriginalCategoriesCategoryHash,@"categoryHash",
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
            self.quantityAvailable = [[self objectOrNilForKey:kOriginalCategoriesQuantityAvailable fromDictionary:dict] doubleValue];
            self.hideIfNoCurrency = [[self objectOrNilForKey:kOriginalCategoriesHideIfNoCurrency fromDictionary:dict] boolValue];
            self.isPreview = [[self objectOrNilForKey:kOriginalCategoriesIsPreview fromDictionary:dict] boolValue];
            self.buyStringOverride = [self objectOrNilForKey:kOriginalCategoriesBuyStringOverride fromDictionary:dict];
            self.isDisplayOnly = [[self objectOrNilForKey:kOriginalCategoriesIsDisplayOnly fromDictionary:dict] boolValue];
            self.categoryHash = [[self objectOrNilForKey:kOriginalCategoriesCategoryHash fromDictionary:dict] doubleValue];
            self.resetIntervalMinutesOverride = [[self objectOrNilForKey:kOriginalCategoriesResetIntervalMinutesOverride fromDictionary:dict] doubleValue];
            self.sortValue = [[self objectOrNilForKey:kOriginalCategoriesSortValue fromDictionary:dict] doubleValue];
            self.disabledDescription = [self objectOrNilForKey:kOriginalCategoriesDisabledDescription fromDictionary:dict];
            self.showUnavailableItems = [[self objectOrNilForKey:kOriginalCategoriesShowUnavailableItems fromDictionary:dict] boolValue];
            self.hideFromRegularPurchase = [[self objectOrNilForKey:kOriginalCategoriesHideFromRegularPurchase fromDictionary:dict] boolValue];
            self.vendorItemIndexes = [self objectOrNilForKey:kOriginalCategoriesVendorItemIndexes fromDictionary:dict];
            self.resetOffsetMinutesOverride = [[self objectOrNilForKey:kOriginalCategoriesResetOffsetMinutesOverride fromDictionary:dict] doubleValue];
            self.categoryIndex = [[self objectOrNilForKey:kOriginalCategoriesCategoryIndex fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.quantityAvailable] forKey:kOriginalCategoriesQuantityAvailable];
    [mutableDict setValue:[NSNumber numberWithBool:self.hideIfNoCurrency] forKey:kOriginalCategoriesHideIfNoCurrency];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPreview] forKey:kOriginalCategoriesIsPreview];
    [mutableDict setValue:self.buyStringOverride forKey:kOriginalCategoriesBuyStringOverride];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDisplayOnly] forKey:kOriginalCategoriesIsDisplayOnly];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryHash] forKey:kOriginalCategoriesCategoryHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resetIntervalMinutesOverride] forKey:kOriginalCategoriesResetIntervalMinutesOverride];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sortValue] forKey:kOriginalCategoriesSortValue];
    [mutableDict setValue:self.disabledDescription forKey:kOriginalCategoriesDisabledDescription];
    [mutableDict setValue:[NSNumber numberWithBool:self.showUnavailableItems] forKey:kOriginalCategoriesShowUnavailableItems];
    [mutableDict setValue:[NSNumber numberWithBool:self.hideFromRegularPurchase] forKey:kOriginalCategoriesHideFromRegularPurchase];
    NSMutableArray *tempArrayForVendorItemIndexes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.vendorItemIndexes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVendorItemIndexes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVendorItemIndexes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVendorItemIndexes] forKey:kOriginalCategoriesVendorItemIndexes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resetOffsetMinutesOverride] forKey:kOriginalCategoriesResetOffsetMinutesOverride];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryIndex] forKey:kOriginalCategoriesCategoryIndex];

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

    self.quantityAvailable = [aDecoder decodeDoubleForKey:kOriginalCategoriesQuantityAvailable];
    self.hideIfNoCurrency = [aDecoder decodeBoolForKey:kOriginalCategoriesHideIfNoCurrency];
    self.isPreview = [aDecoder decodeBoolForKey:kOriginalCategoriesIsPreview];
    self.buyStringOverride = [aDecoder decodeObjectForKey:kOriginalCategoriesBuyStringOverride];
    self.isDisplayOnly = [aDecoder decodeBoolForKey:kOriginalCategoriesIsDisplayOnly];
    self.categoryHash = [aDecoder decodeDoubleForKey:kOriginalCategoriesCategoryHash];
    self.resetIntervalMinutesOverride = [aDecoder decodeDoubleForKey:kOriginalCategoriesResetIntervalMinutesOverride];
    self.sortValue = [aDecoder decodeDoubleForKey:kOriginalCategoriesSortValue];
    self.disabledDescription = [aDecoder decodeObjectForKey:kOriginalCategoriesDisabledDescription];
    self.showUnavailableItems = [aDecoder decodeBoolForKey:kOriginalCategoriesShowUnavailableItems];
    self.hideFromRegularPurchase = [aDecoder decodeBoolForKey:kOriginalCategoriesHideFromRegularPurchase];
    self.vendorItemIndexes = [aDecoder decodeObjectForKey:kOriginalCategoriesVendorItemIndexes];
    self.resetOffsetMinutesOverride = [aDecoder decodeDoubleForKey:kOriginalCategoriesResetOffsetMinutesOverride];
    self.categoryIndex = [aDecoder decodeDoubleForKey:kOriginalCategoriesCategoryIndex];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_quantityAvailable forKey:kOriginalCategoriesQuantityAvailable];
    [aCoder encodeBool:_hideIfNoCurrency forKey:kOriginalCategoriesHideIfNoCurrency];
    [aCoder encodeBool:_isPreview forKey:kOriginalCategoriesIsPreview];
    [aCoder encodeObject:_buyStringOverride forKey:kOriginalCategoriesBuyStringOverride];
    [aCoder encodeBool:_isDisplayOnly forKey:kOriginalCategoriesIsDisplayOnly];
    [aCoder encodeDouble:_categoryHash forKey:kOriginalCategoriesCategoryHash];
    [aCoder encodeDouble:_resetIntervalMinutesOverride forKey:kOriginalCategoriesResetIntervalMinutesOverride];
    [aCoder encodeDouble:_sortValue forKey:kOriginalCategoriesSortValue];
    [aCoder encodeObject:_disabledDescription forKey:kOriginalCategoriesDisabledDescription];
    [aCoder encodeBool:_showUnavailableItems forKey:kOriginalCategoriesShowUnavailableItems];
    [aCoder encodeBool:_hideFromRegularPurchase forKey:kOriginalCategoriesHideFromRegularPurchase];
    [aCoder encodeObject:_vendorItemIndexes forKey:kOriginalCategoriesVendorItemIndexes];
    [aCoder encodeDouble:_resetOffsetMinutesOverride forKey:kOriginalCategoriesResetOffsetMinutesOverride];
    [aCoder encodeDouble:_categoryIndex forKey:kOriginalCategoriesCategoryIndex];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsOriginalCategories *copy = [[VNDDetailsOriginalCategories alloc] init];
    
    if (copy) {

        copy.quantityAvailable = self.quantityAvailable;
        copy.hideIfNoCurrency = self.hideIfNoCurrency;
        copy.isPreview = self.isPreview;
        copy.buyStringOverride = [self.buyStringOverride copyWithZone:zone];
        copy.isDisplayOnly = self.isDisplayOnly;
        copy.categoryHash = self.categoryHash;
        copy.resetIntervalMinutesOverride = self.resetIntervalMinutesOverride;
        copy.sortValue = self.sortValue;
        copy.disabledDescription = [self.disabledDescription copyWithZone:zone];
        copy.showUnavailableItems = self.showUnavailableItems;
        copy.hideFromRegularPurchase = self.hideFromRegularPurchase;
        copy.vendorItemIndexes = [self.vendorItemIndexes copyWithZone:zone];
        copy.resetOffsetMinutesOverride = self.resetOffsetMinutesOverride;
        copy.categoryIndex = self.categoryIndex;
    }
    
    return copy;
}


@end

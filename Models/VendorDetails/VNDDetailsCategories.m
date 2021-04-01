//
//  Categories.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsCategories.h"


NSString *const kCategoriesQuantityAvailable = @"quantityAvailable";
NSString *const kCategoriesHideIfNoCurrency = @"hideIfNoCurrency";
NSString *const kCategoriesIsPreview = @"isPreview";
NSString *const kCategoriesBuyStringOverride = @"buyStringOverride";
NSString *const kCategoriesIsDisplayOnly = @"isDisplayOnly";
NSString *const kCategoriesCategoryHash = @"categoryHash";
NSString *const kCategoriesResetIntervalMinutesOverride = @"resetIntervalMinutesOverride";
NSString *const kCategoriesSortValue = @"sortValue";
NSString *const kCategoriesDisabledDescription = @"disabledDescription";
NSString *const kCategoriesShowUnavailableItems = @"showUnavailableItems";
NSString *const kCategoriesHideFromRegularPurchase = @"hideFromRegularPurchase";
NSString *const kCategoriesVendorItemIndexes = @"vendorItemIndexes";
NSString *const kCategoriesResetOffsetMinutesOverride = @"resetOffsetMinutesOverride";
NSString *const kCategoriesCategoryIndex = @"categoryIndex";
NSString *const kCategoriesDisplayTitle = @"displayTitle";


@interface VNDDetailsCategories ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsCategories

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
@synthesize displayTitle = _displayTitle;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kCategoriesCategoryHash,@"categoryHash",
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
            self.quantityAvailable = [[self objectOrNilForKey:kCategoriesQuantityAvailable fromDictionary:dict] doubleValue];
            self.hideIfNoCurrency = [[self objectOrNilForKey:kCategoriesHideIfNoCurrency fromDictionary:dict] boolValue];
            self.isPreview = [[self objectOrNilForKey:kCategoriesIsPreview fromDictionary:dict] boolValue];
            self.buyStringOverride = [self objectOrNilForKey:kCategoriesBuyStringOverride fromDictionary:dict];
            self.isDisplayOnly = [[self objectOrNilForKey:kCategoriesIsDisplayOnly fromDictionary:dict] boolValue];
            self.categoryHash = [[self objectOrNilForKey:kCategoriesCategoryHash fromDictionary:dict] doubleValue];
            self.resetIntervalMinutesOverride = [[self objectOrNilForKey:kCategoriesResetIntervalMinutesOverride fromDictionary:dict] doubleValue];
            self.sortValue = [[self objectOrNilForKey:kCategoriesSortValue fromDictionary:dict] doubleValue];
            self.disabledDescription = [self objectOrNilForKey:kCategoriesDisabledDescription fromDictionary:dict];
            self.showUnavailableItems = [[self objectOrNilForKey:kCategoriesShowUnavailableItems fromDictionary:dict] boolValue];
            self.hideFromRegularPurchase = [[self objectOrNilForKey:kCategoriesHideFromRegularPurchase fromDictionary:dict] boolValue];
            self.vendorItemIndexes = [self objectOrNilForKey:kCategoriesVendorItemIndexes fromDictionary:dict];
            self.resetOffsetMinutesOverride = [[self objectOrNilForKey:kCategoriesResetOffsetMinutesOverride fromDictionary:dict] doubleValue];
            self.categoryIndex = [[self objectOrNilForKey:kCategoriesCategoryIndex fromDictionary:dict] doubleValue];
            self.displayTitle = [self objectOrNilForKey:kCategoriesDisplayTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.quantityAvailable] forKey:kCategoriesQuantityAvailable];
    [mutableDict setValue:[NSNumber numberWithBool:self.hideIfNoCurrency] forKey:kCategoriesHideIfNoCurrency];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPreview] forKey:kCategoriesIsPreview];
    [mutableDict setValue:self.buyStringOverride forKey:kCategoriesBuyStringOverride];
    [mutableDict setValue:[NSNumber numberWithBool:self.isDisplayOnly] forKey:kCategoriesIsDisplayOnly];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryHash] forKey:kCategoriesCategoryHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resetIntervalMinutesOverride] forKey:kCategoriesResetIntervalMinutesOverride];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sortValue] forKey:kCategoriesSortValue];
    [mutableDict setValue:self.disabledDescription forKey:kCategoriesDisabledDescription];
    [mutableDict setValue:[NSNumber numberWithBool:self.showUnavailableItems] forKey:kCategoriesShowUnavailableItems];
    [mutableDict setValue:[NSNumber numberWithBool:self.hideFromRegularPurchase] forKey:kCategoriesHideFromRegularPurchase];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVendorItemIndexes] forKey:kCategoriesVendorItemIndexes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.resetOffsetMinutesOverride] forKey:kCategoriesResetOffsetMinutesOverride];
    [mutableDict setValue:[NSNumber numberWithDouble:self.categoryIndex] forKey:kCategoriesCategoryIndex];
    [mutableDict setValue:self.displayTitle forKey:kCategoriesDisplayTitle];

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

    self.quantityAvailable = [aDecoder decodeDoubleForKey:kCategoriesQuantityAvailable];
    self.hideIfNoCurrency = [aDecoder decodeBoolForKey:kCategoriesHideIfNoCurrency];
    self.isPreview = [aDecoder decodeBoolForKey:kCategoriesIsPreview];
    self.buyStringOverride = [aDecoder decodeObjectForKey:kCategoriesBuyStringOverride];
    self.isDisplayOnly = [aDecoder decodeBoolForKey:kCategoriesIsDisplayOnly];
    self.categoryHash = [aDecoder decodeDoubleForKey:kCategoriesCategoryHash];
    self.resetIntervalMinutesOverride = [aDecoder decodeDoubleForKey:kCategoriesResetIntervalMinutesOverride];
    self.sortValue = [aDecoder decodeDoubleForKey:kCategoriesSortValue];
    self.disabledDescription = [aDecoder decodeObjectForKey:kCategoriesDisabledDescription];
    self.showUnavailableItems = [aDecoder decodeBoolForKey:kCategoriesShowUnavailableItems];
    self.hideFromRegularPurchase = [aDecoder decodeBoolForKey:kCategoriesHideFromRegularPurchase];
    self.vendorItemIndexes = [aDecoder decodeObjectForKey:kCategoriesVendorItemIndexes];
    self.resetOffsetMinutesOverride = [aDecoder decodeDoubleForKey:kCategoriesResetOffsetMinutesOverride];
    self.categoryIndex = [aDecoder decodeDoubleForKey:kCategoriesCategoryIndex];
    self.displayTitle = [aDecoder decodeObjectForKey:kCategoriesDisplayTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_quantityAvailable forKey:kCategoriesQuantityAvailable];
    [aCoder encodeBool:_hideIfNoCurrency forKey:kCategoriesHideIfNoCurrency];
    [aCoder encodeBool:_isPreview forKey:kCategoriesIsPreview];
    [aCoder encodeObject:_buyStringOverride forKey:kCategoriesBuyStringOverride];
    [aCoder encodeBool:_isDisplayOnly forKey:kCategoriesIsDisplayOnly];
    [aCoder encodeDouble:_categoryHash forKey:kCategoriesCategoryHash];
    [aCoder encodeDouble:_resetIntervalMinutesOverride forKey:kCategoriesResetIntervalMinutesOverride];
    [aCoder encodeDouble:_sortValue forKey:kCategoriesSortValue];
    [aCoder encodeObject:_disabledDescription forKey:kCategoriesDisabledDescription];
    [aCoder encodeBool:_showUnavailableItems forKey:kCategoriesShowUnavailableItems];
    [aCoder encodeBool:_hideFromRegularPurchase forKey:kCategoriesHideFromRegularPurchase];
    [aCoder encodeObject:_vendorItemIndexes forKey:kCategoriesVendorItemIndexes];
    [aCoder encodeDouble:_resetOffsetMinutesOverride forKey:kCategoriesResetOffsetMinutesOverride];
    [aCoder encodeDouble:_categoryIndex forKey:kCategoriesCategoryIndex];
    [aCoder encodeObject:_displayTitle forKey:kCategoriesDisplayTitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsCategories *copy = [[VNDDetailsCategories alloc] init];
    
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
        copy.displayTitle = [self.displayTitle copyWithZone:zone];
    }
    
    return copy;
}


@end

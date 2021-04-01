//
//  INVDSocketEntries.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVDSocketEntries.h"


NSString *const kSocketEntriesPlugSources = @"plugSources";
NSString *const kSocketEntriesPreventInitializationWhenVersioning = @"preventInitializationWhenVersioning";
NSString *const kSocketEntriesPreventInitializationOnVendorPurchase = @"preventInitializationOnVendorPurchase";
NSString *const kSocketEntriesSocketTypeHash = @"socketTypeHash";
NSString *const kSocketEntriesReusablePlugItems = @"reusablePlugItems";
NSString *const kSocketEntriesReusablePlugSetHash = @"reusablePlugSetHash";
NSString *const kSocketEntriesRandomizedPlugSetHash = @"randomizedPlugSetHash";
NSString *const kSocketEntriesOverridesUiAppearance = @"overridesUiAppearance";
NSString *const kSocketEntriesSingleInitialItemHash = @"singleInitialItemHash";
NSString *const kSocketEntriesDefaultVisible = @"defaultVisible";
NSString *const kSocketEntriesHidePerksInItemTooltip = @"hidePerksInItemTooltip";


@interface INVDSocketEntries ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVDSocketEntries

@synthesize plugSources = _plugSources;
@synthesize preventInitializationWhenVersioning = _preventInitializationWhenVersioning;
@synthesize preventInitializationOnVendorPurchase = _preventInitializationOnVendorPurchase;
@synthesize socketTypeHash = _socketTypeHash;
@synthesize reusablePlugItems = _reusablePlugItems;
@synthesize reusablePlugSetHash = _reusablePlugSetHash;
@synthesize randomizedPlugSetHash = _randomizedPlugSetHash;
@synthesize overridesUiAppearance = _overridesUiAppearance;
@synthesize singleInitialItemHash = _singleInitialItemHash;
@synthesize defaultVisible = _defaultVisible;
@synthesize hidePerksInItemTooltip = _hidePerksInItemTooltip;


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
            self.plugSources = [[self objectOrNilForKey:kSocketEntriesPlugSources fromDictionary:dict] doubleValue];
            self.preventInitializationWhenVersioning = [[self objectOrNilForKey:kSocketEntriesPreventInitializationWhenVersioning fromDictionary:dict] boolValue];
            self.preventInitializationOnVendorPurchase = [[self objectOrNilForKey:kSocketEntriesPreventInitializationOnVendorPurchase fromDictionary:dict] boolValue];
            self.socketTypeHash = [[self objectOrNilForKey:kSocketEntriesSocketTypeHash fromDictionary:dict] doubleValue];
            self.reusablePlugItems = [self objectOrNilForKey:kSocketEntriesReusablePlugItems fromDictionary:dict];
            self.reusablePlugSetHash = [[self objectOrNilForKey:kSocketEntriesReusablePlugSetHash fromDictionary:dict] doubleValue];
            self.randomizedPlugSetHash = [[self objectOrNilForKey:kSocketEntriesRandomizedPlugSetHash fromDictionary:dict] doubleValue];
            self.overridesUiAppearance = [[self objectOrNilForKey:kSocketEntriesOverridesUiAppearance fromDictionary:dict] boolValue];
            self.singleInitialItemHash = [[self objectOrNilForKey:kSocketEntriesSingleInitialItemHash fromDictionary:dict] doubleValue];
            self.defaultVisible = [[self objectOrNilForKey:kSocketEntriesDefaultVisible fromDictionary:dict] boolValue];
            self.hidePerksInItemTooltip = [[self objectOrNilForKey:kSocketEntriesHidePerksInItemTooltip fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.plugSources] forKey:kSocketEntriesPlugSources];
    [mutableDict setValue:[NSNumber numberWithBool:self.preventInitializationWhenVersioning] forKey:kSocketEntriesPreventInitializationWhenVersioning];
    [mutableDict setValue:[NSNumber numberWithBool:self.preventInitializationOnVendorPurchase] forKey:kSocketEntriesPreventInitializationOnVendorPurchase];
    [mutableDict setValue:[NSNumber numberWithDouble:self.socketTypeHash] forKey:kSocketEntriesSocketTypeHash];
    NSMutableArray *tempArrayForReusablePlugItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.reusablePlugItems) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForReusablePlugItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForReusablePlugItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForReusablePlugItems] forKey:kSocketEntriesReusablePlugItems];
    [mutableDict setValue:[NSNumber numberWithDouble:self.reusablePlugSetHash] forKey:kSocketEntriesReusablePlugSetHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.randomizedPlugSetHash] forKey:kSocketEntriesRandomizedPlugSetHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.overridesUiAppearance] forKey:kSocketEntriesOverridesUiAppearance];
    [mutableDict setValue:[NSNumber numberWithDouble:self.singleInitialItemHash] forKey:kSocketEntriesSingleInitialItemHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.defaultVisible] forKey:kSocketEntriesDefaultVisible];
    [mutableDict setValue:[NSNumber numberWithBool:self.hidePerksInItemTooltip] forKey:kSocketEntriesHidePerksInItemTooltip];

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

    self.plugSources = [aDecoder decodeDoubleForKey:kSocketEntriesPlugSources];
    self.preventInitializationWhenVersioning = [aDecoder decodeBoolForKey:kSocketEntriesPreventInitializationWhenVersioning];
    self.preventInitializationOnVendorPurchase = [aDecoder decodeBoolForKey:kSocketEntriesPreventInitializationOnVendorPurchase];
    self.socketTypeHash = [aDecoder decodeDoubleForKey:kSocketEntriesSocketTypeHash];
    self.reusablePlugItems = [aDecoder decodeObjectForKey:kSocketEntriesReusablePlugItems];
    self.reusablePlugSetHash = [aDecoder decodeDoubleForKey:kSocketEntriesReusablePlugSetHash];
    self.randomizedPlugSetHash = [aDecoder decodeDoubleForKey:kSocketEntriesRandomizedPlugSetHash];
    self.overridesUiAppearance = [aDecoder decodeBoolForKey:kSocketEntriesOverridesUiAppearance];
    self.singleInitialItemHash = [aDecoder decodeDoubleForKey:kSocketEntriesSingleInitialItemHash];
    self.defaultVisible = [aDecoder decodeBoolForKey:kSocketEntriesDefaultVisible];
    self.hidePerksInItemTooltip = [aDecoder decodeBoolForKey:kSocketEntriesHidePerksInItemTooltip];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_plugSources forKey:kSocketEntriesPlugSources];
    [aCoder encodeBool:_preventInitializationWhenVersioning forKey:kSocketEntriesPreventInitializationWhenVersioning];
    [aCoder encodeBool:_preventInitializationOnVendorPurchase forKey:kSocketEntriesPreventInitializationOnVendorPurchase];
    [aCoder encodeDouble:_socketTypeHash forKey:kSocketEntriesSocketTypeHash];
    [aCoder encodeObject:_reusablePlugItems forKey:kSocketEntriesReusablePlugItems];
    [aCoder encodeDouble:_reusablePlugSetHash forKey:kSocketEntriesReusablePlugSetHash];
    [aCoder encodeDouble:_randomizedPlugSetHash forKey:kSocketEntriesRandomizedPlugSetHash];
    [aCoder encodeBool:_overridesUiAppearance forKey:kSocketEntriesOverridesUiAppearance];
    [aCoder encodeDouble:_singleInitialItemHash forKey:kSocketEntriesSingleInitialItemHash];
    [aCoder encodeBool:_defaultVisible forKey:kSocketEntriesDefaultVisible];
    [aCoder encodeBool:_hidePerksInItemTooltip forKey:kSocketEntriesHidePerksInItemTooltip];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVDSocketEntries *copy = [[INVDSocketEntries alloc] init];
    
    if (copy) {

        copy.plugSources = self.plugSources;
        copy.preventInitializationWhenVersioning = self.preventInitializationWhenVersioning;
        copy.preventInitializationOnVendorPurchase = self.preventInitializationOnVendorPurchase;
        copy.socketTypeHash = self.socketTypeHash;
        copy.reusablePlugItems = [self.reusablePlugItems copyWithZone:zone];
        copy.reusablePlugSetHash = self.reusablePlugSetHash;
        copy.randomizedPlugSetHash = self.randomizedPlugSetHash;
        copy.overridesUiAppearance = self.overridesUiAppearance;
        copy.singleInitialItemHash = self.singleInitialItemHash;
        copy.defaultVisible = self.defaultVisible;
        copy.hidePerksInItemTooltip = self.hidePerksInItemTooltip;
    }
    
    return copy;
}


@end

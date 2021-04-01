//
//  DestinyItemCategoryDefinition.m
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "DestinyItemCategoryDefinition.h"
#import "ITMCATDisplayProperties.h"


NSString *const kDestinyItemCategoryDefinitionGroupCategoryOnly = @"groupCategoryOnly";
NSString *const kDestinyItemCategoryDefinitionHash = @"hash";
NSString *const kDestinyItemCategoryDefinitionItemTypeRegex = @"itemTypeRegex";
NSString *const kDestinyItemCategoryDefinitionIndex = @"index";
NSString *const kDestinyItemCategoryDefinitionGrantDestinySubType = @"grantDestinySubType";
NSString *const kDestinyItemCategoryDefinitionShortTitle = @"shortTitle";
NSString *const kDestinyItemCategoryDefinitionGrantDestinyClass = @"grantDestinyClass";
NSString *const kDestinyItemCategoryDefinitionDeprecated = @"deprecated";
NSString *const kDestinyItemCategoryDefinitionBlacklisted = @"blacklisted";
NSString *const kDestinyItemCategoryDefinitionRedacted = @"redacted";
NSString *const kDestinyItemCategoryDefinitionGroupedCategoryHashes = @"groupedCategoryHashes";
NSString *const kDestinyItemCategoryDefinitionDisplayProperties = @"displayProperties";
NSString *const kDestinyItemCategoryDefinitionVisible = @"visible";
NSString *const kDestinyItemCategoryDefinitionGrantDestinyItemType = @"grantDestinyItemType";
NSString *const kDestinyItemCategoryDefinitionIsPlug = @"isPlug";
NSString *const kDestinyItemCategoryDefinitionParentCategoryHashes = @"parentCategoryHashes";
NSString *const kDestinyItemCategoryDefinitionGrantDestinyBreakerType = @"grantDestinyBreakerType";


@interface DestinyItemCategoryDefinition ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DestinyItemCategoryDefinition

@synthesize groupCategoryOnly = _groupCategoryOnly;
@synthesize hash = _hash;
@synthesize itemTypeRegex = _itemTypeRegex;
@synthesize index = _index;
@synthesize grantDestinySubType = _grantDestinySubType;
@synthesize shortTitle = _shortTitle;
@synthesize grantDestinyClass = _grantDestinyClass;
@synthesize deprecated = _deprecated;
@synthesize blacklisted = _blacklisted;
@synthesize redacted = _redacted;
@synthesize groupedCategoryHashes = _groupedCategoryHashes;
@synthesize displayProperties = _displayProperties;
@synthesize visible = _visible;
@synthesize grantDestinyItemType = _grantDestinyItemType;
@synthesize isPlug = _isPlug;
@synthesize parentCategoryHashes = _parentCategoryHashes;
@synthesize grantDestinyBreakerType = _grantDestinyBreakerType;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kDestinyItemCategoryDefinitionHash,@"hash",
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
            self.groupCategoryOnly = [[self objectOrNilForKey:kDestinyItemCategoryDefinitionGroupCategoryOnly fromDictionary:dict] boolValue];
            self.hash = [[self objectOrNilForKey:kDestinyItemCategoryDefinitionHash fromDictionary:dict] doubleValue];
            self.itemTypeRegex = [self objectOrNilForKey:kDestinyItemCategoryDefinitionItemTypeRegex fromDictionary:dict];
            self.index = [[self objectOrNilForKey:kDestinyItemCategoryDefinitionIndex fromDictionary:dict] doubleValue];
            self.grantDestinySubType = [[self objectOrNilForKey:kDestinyItemCategoryDefinitionGrantDestinySubType fromDictionary:dict] doubleValue];
            self.shortTitle = [self objectOrNilForKey:kDestinyItemCategoryDefinitionShortTitle fromDictionary:dict];
            self.grantDestinyClass = [[self objectOrNilForKey:kDestinyItemCategoryDefinitionGrantDestinyClass fromDictionary:dict] doubleValue];
            self.deprecated = [[self objectOrNilForKey:kDestinyItemCategoryDefinitionDeprecated fromDictionary:dict] boolValue];
            self.blacklisted = [[self objectOrNilForKey:kDestinyItemCategoryDefinitionBlacklisted fromDictionary:dict] boolValue];
            self.redacted = [[self objectOrNilForKey:kDestinyItemCategoryDefinitionRedacted fromDictionary:dict] boolValue];
            self.groupedCategoryHashes = [self objectOrNilForKey:kDestinyItemCategoryDefinitionGroupedCategoryHashes fromDictionary:dict];
            self.displayProperties = [ITMCATDisplayProperties modelObjectWithDictionary:[dict objectForKey:kDestinyItemCategoryDefinitionDisplayProperties]];
            self.visible = [[self objectOrNilForKey:kDestinyItemCategoryDefinitionVisible fromDictionary:dict] boolValue];
            self.grantDestinyItemType = [[self objectOrNilForKey:kDestinyItemCategoryDefinitionGrantDestinyItemType fromDictionary:dict] doubleValue];
            self.isPlug = [[self objectOrNilForKey:kDestinyItemCategoryDefinitionIsPlug fromDictionary:dict] boolValue];
            self.parentCategoryHashes = [self objectOrNilForKey:kDestinyItemCategoryDefinitionParentCategoryHashes fromDictionary:dict];
            self.grantDestinyBreakerType = [[self objectOrNilForKey:kDestinyItemCategoryDefinitionGrantDestinyBreakerType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.groupCategoryOnly] forKey:kDestinyItemCategoryDefinitionGroupCategoryOnly];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kDestinyItemCategoryDefinitionHash];
    [mutableDict setValue:self.itemTypeRegex forKey:kDestinyItemCategoryDefinitionItemTypeRegex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kDestinyItemCategoryDefinitionIndex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.grantDestinySubType] forKey:kDestinyItemCategoryDefinitionGrantDestinySubType];
    [mutableDict setValue:self.shortTitle forKey:kDestinyItemCategoryDefinitionShortTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.grantDestinyClass] forKey:kDestinyItemCategoryDefinitionGrantDestinyClass];
    [mutableDict setValue:[NSNumber numberWithBool:self.deprecated] forKey:kDestinyItemCategoryDefinitionDeprecated];
    [mutableDict setValue:[NSNumber numberWithBool:self.blacklisted] forKey:kDestinyItemCategoryDefinitionBlacklisted];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kDestinyItemCategoryDefinitionRedacted];
    NSMutableArray *tempArrayForGroupedCategoryHashes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.groupedCategoryHashes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForGroupedCategoryHashes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForGroupedCategoryHashes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForGroupedCategoryHashes] forKey:kDestinyItemCategoryDefinitionGroupedCategoryHashes];
    [mutableDict setValue:[self.displayProperties dictionaryRepresentation] forKey:kDestinyItemCategoryDefinitionDisplayProperties];
    [mutableDict setValue:[NSNumber numberWithBool:self.visible] forKey:kDestinyItemCategoryDefinitionVisible];
    [mutableDict setValue:[NSNumber numberWithDouble:self.grantDestinyItemType] forKey:kDestinyItemCategoryDefinitionGrantDestinyItemType];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPlug] forKey:kDestinyItemCategoryDefinitionIsPlug];
    NSMutableArray *tempArrayForParentCategoryHashes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.parentCategoryHashes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForParentCategoryHashes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForParentCategoryHashes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForParentCategoryHashes] forKey:kDestinyItemCategoryDefinitionParentCategoryHashes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.grantDestinyBreakerType] forKey:kDestinyItemCategoryDefinitionGrantDestinyBreakerType];

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

    self.groupCategoryOnly = [aDecoder decodeBoolForKey:kDestinyItemCategoryDefinitionGroupCategoryOnly];
    self.hash = [aDecoder decodeDoubleForKey:kDestinyItemCategoryDefinitionHash];
    self.itemTypeRegex = [aDecoder decodeObjectForKey:kDestinyItemCategoryDefinitionItemTypeRegex];
    self.index = [aDecoder decodeDoubleForKey:kDestinyItemCategoryDefinitionIndex];
    self.grantDestinySubType = [aDecoder decodeDoubleForKey:kDestinyItemCategoryDefinitionGrantDestinySubType];
    self.shortTitle = [aDecoder decodeObjectForKey:kDestinyItemCategoryDefinitionShortTitle];
    self.grantDestinyClass = [aDecoder decodeDoubleForKey:kDestinyItemCategoryDefinitionGrantDestinyClass];
    self.deprecated = [aDecoder decodeBoolForKey:kDestinyItemCategoryDefinitionDeprecated];
    self.blacklisted = [aDecoder decodeBoolForKey:kDestinyItemCategoryDefinitionBlacklisted];
    self.redacted = [aDecoder decodeBoolForKey:kDestinyItemCategoryDefinitionRedacted];
    self.groupedCategoryHashes = [aDecoder decodeObjectForKey:kDestinyItemCategoryDefinitionGroupedCategoryHashes];
    self.displayProperties = [aDecoder decodeObjectForKey:kDestinyItemCategoryDefinitionDisplayProperties];
    self.visible = [aDecoder decodeBoolForKey:kDestinyItemCategoryDefinitionVisible];
    self.grantDestinyItemType = [aDecoder decodeDoubleForKey:kDestinyItemCategoryDefinitionGrantDestinyItemType];
    self.isPlug = [aDecoder decodeBoolForKey:kDestinyItemCategoryDefinitionIsPlug];
    self.parentCategoryHashes = [aDecoder decodeObjectForKey:kDestinyItemCategoryDefinitionParentCategoryHashes];
    self.grantDestinyBreakerType = [aDecoder decodeDoubleForKey:kDestinyItemCategoryDefinitionGrantDestinyBreakerType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_groupCategoryOnly forKey:kDestinyItemCategoryDefinitionGroupCategoryOnly];
    [aCoder encodeDouble:_hash forKey:kDestinyItemCategoryDefinitionHash];
    [aCoder encodeObject:_itemTypeRegex forKey:kDestinyItemCategoryDefinitionItemTypeRegex];
    [aCoder encodeDouble:_index forKey:kDestinyItemCategoryDefinitionIndex];
    [aCoder encodeDouble:_grantDestinySubType forKey:kDestinyItemCategoryDefinitionGrantDestinySubType];
    [aCoder encodeObject:_shortTitle forKey:kDestinyItemCategoryDefinitionShortTitle];
    [aCoder encodeDouble:_grantDestinyClass forKey:kDestinyItemCategoryDefinitionGrantDestinyClass];
    [aCoder encodeBool:_deprecated forKey:kDestinyItemCategoryDefinitionDeprecated];
    [aCoder encodeBool:_blacklisted forKey:kDestinyItemCategoryDefinitionBlacklisted];
    [aCoder encodeBool:_redacted forKey:kDestinyItemCategoryDefinitionRedacted];
    [aCoder encodeObject:_groupedCategoryHashes forKey:kDestinyItemCategoryDefinitionGroupedCategoryHashes];
    [aCoder encodeObject:_displayProperties forKey:kDestinyItemCategoryDefinitionDisplayProperties];
    [aCoder encodeBool:_visible forKey:kDestinyItemCategoryDefinitionVisible];
    [aCoder encodeDouble:_grantDestinyItemType forKey:kDestinyItemCategoryDefinitionGrantDestinyItemType];
    [aCoder encodeBool:_isPlug forKey:kDestinyItemCategoryDefinitionIsPlug];
    [aCoder encodeObject:_parentCategoryHashes forKey:kDestinyItemCategoryDefinitionParentCategoryHashes];
    [aCoder encodeDouble:_grantDestinyBreakerType forKey:kDestinyItemCategoryDefinitionGrantDestinyBreakerType];
}

- (id)copyWithZone:(NSZone *)zone
{
    DestinyItemCategoryDefinition *copy = [[DestinyItemCategoryDefinition alloc] init];
    
    if (copy) {

        copy.groupCategoryOnly = self.groupCategoryOnly;
        copy.hash = self.hash;
        copy.itemTypeRegex = [self.itemTypeRegex copyWithZone:zone];
        copy.index = self.index;
        copy.grantDestinySubType = self.grantDestinySubType;
        copy.shortTitle = [self.shortTitle copyWithZone:zone];
        copy.grantDestinyClass = self.grantDestinyClass;
        copy.deprecated = self.deprecated;
        copy.blacklisted = self.blacklisted;
        copy.redacted = self.redacted;
        copy.groupedCategoryHashes = [self.groupedCategoryHashes copyWithZone:zone];
        copy.displayProperties = [self.displayProperties copyWithZone:zone];
        copy.visible = self.visible;
        copy.grantDestinyItemType = self.grantDestinyItemType;
        copy.isPlug = self.isPlug;
        copy.parentCategoryHashes = [self.parentCategoryHashes copyWithZone:zone];
        copy.grantDestinyBreakerType = self.grantDestinyBreakerType;
    }
    
    return copy;
}


@end

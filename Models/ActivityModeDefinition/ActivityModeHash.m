//
//  ActivityModeHash.m
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "ActivityModeHash.h"
#import "ACMDisplayProperties.h"


NSString *const kActivityModeHashHash = @"hash";
NSString *const kActivityModeHashIndex = @"index";
NSString *const kActivityModeHashParentHashes = @"parentHashes";
NSString *const kActivityModeHashDisplay = @"display";
NSString *const kActivityModeHashFriendlyName = @"friendlyName";
NSString *const kActivityModeHashTier = @"tier";
NSString *const kActivityModeHashModeType = @"modeType";
NSString *const kActivityModeHashActivityModeCategory = @"activityModeCategory";
NSString *const kActivityModeHashIsAggregateMode = @"isAggregateMode";
NSString *const kActivityModeHashRedacted = @"redacted";
NSString *const kActivityModeHashBlacklisted = @"blacklisted";
NSString *const kActivityModeHashOrder = @"order";
NSString *const kActivityModeHashDisplayProperties = @"displayProperties";
NSString *const kActivityModeHashIsTeamBased = @"isTeamBased";
NSString *const kActivityModeHashPgcrImage = @"pgcrImage";
NSString *const kActivityModeHashSupportsFeedFiltering = @"supportsFeedFiltering";


@interface ActivityModeHash ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ActivityModeHash

@synthesize hash = _hash;
@synthesize index = _index;
@synthesize parentHashes = _parentHashes;
@synthesize display = _display;
@synthesize friendlyName = _friendlyName;
@synthesize tier = _tier;
@synthesize modeType = _modeType;
@synthesize activityModeCategory = _activityModeCategory;
@synthesize isAggregateMode = _isAggregateMode;
@synthesize redacted = _redacted;
@synthesize blacklisted = _blacklisted;
@synthesize order = _order;
@synthesize displayProperties = _displayProperties;
@synthesize isTeamBased = _isTeamBased;
@synthesize pgcrImage = _pgcrImage;
@synthesize supportsFeedFiltering = _supportsFeedFiltering;


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
            self.hash = [[self objectOrNilForKey:kActivityModeHashHash fromDictionary:dict] doubleValue];
            self.index = [[self objectOrNilForKey:kActivityModeHashIndex fromDictionary:dict] doubleValue];
            self.parentHashes = [self objectOrNilForKey:kActivityModeHashParentHashes fromDictionary:dict];
            self.display = [[self objectOrNilForKey:kActivityModeHashDisplay fromDictionary:dict] boolValue];
            self.friendlyName = [self objectOrNilForKey:kActivityModeHashFriendlyName fromDictionary:dict];
            self.tier = [[self objectOrNilForKey:kActivityModeHashTier fromDictionary:dict] doubleValue];
            self.modeType = [[self objectOrNilForKey:kActivityModeHashModeType fromDictionary:dict] doubleValue];
            self.activityModeCategory = [[self objectOrNilForKey:kActivityModeHashActivityModeCategory fromDictionary:dict] doubleValue];
            self.isAggregateMode = [[self objectOrNilForKey:kActivityModeHashIsAggregateMode fromDictionary:dict] boolValue];
            self.redacted = [[self objectOrNilForKey:kActivityModeHashRedacted fromDictionary:dict] boolValue];
            self.blacklisted = [[self objectOrNilForKey:kActivityModeHashBlacklisted fromDictionary:dict] boolValue];
            self.order = [[self objectOrNilForKey:kActivityModeHashOrder fromDictionary:dict] doubleValue];
            self.displayProperties = [ACMDisplayProperties modelObjectWithDictionary:[dict objectForKey:kActivityModeHashDisplayProperties]];
            self.isTeamBased = [[self objectOrNilForKey:kActivityModeHashIsTeamBased fromDictionary:dict] boolValue];
            self.pgcrImage = [self objectOrNilForKey:kActivityModeHashPgcrImage fromDictionary:dict];
            self.supportsFeedFiltering = [[self objectOrNilForKey:kActivityModeHashSupportsFeedFiltering fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kActivityModeHashHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kActivityModeHashIndex];
    NSMutableArray *tempArrayForParentHashes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.parentHashes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForParentHashes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForParentHashes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForParentHashes] forKey:kActivityModeHashParentHashes];
    [mutableDict setValue:[NSNumber numberWithBool:self.display] forKey:kActivityModeHashDisplay];
    [mutableDict setValue:self.friendlyName forKey:kActivityModeHashFriendlyName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tier] forKey:kActivityModeHashTier];
    [mutableDict setValue:[NSNumber numberWithDouble:self.modeType] forKey:kActivityModeHashModeType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityModeCategory] forKey:kActivityModeHashActivityModeCategory];
    [mutableDict setValue:[NSNumber numberWithBool:self.isAggregateMode] forKey:kActivityModeHashIsAggregateMode];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kActivityModeHashRedacted];
    [mutableDict setValue:[NSNumber numberWithBool:self.blacklisted] forKey:kActivityModeHashBlacklisted];
    [mutableDict setValue:[NSNumber numberWithDouble:self.order] forKey:kActivityModeHashOrder];
    [mutableDict setValue:[self.displayProperties dictionaryRepresentation] forKey:kActivityModeHashDisplayProperties];
    [mutableDict setValue:[NSNumber numberWithBool:self.isTeamBased] forKey:kActivityModeHashIsTeamBased];
    [mutableDict setValue:self.pgcrImage forKey:kActivityModeHashPgcrImage];
    [mutableDict setValue:[NSNumber numberWithBool:self.supportsFeedFiltering] forKey:kActivityModeHashSupportsFeedFiltering];

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

    self.hash = [aDecoder decodeDoubleForKey:kActivityModeHashHash];
    self.index = [aDecoder decodeDoubleForKey:kActivityModeHashIndex];
    self.parentHashes = [aDecoder decodeObjectForKey:kActivityModeHashParentHashes];
    self.display = [aDecoder decodeBoolForKey:kActivityModeHashDisplay];
    self.friendlyName = [aDecoder decodeObjectForKey:kActivityModeHashFriendlyName];
    self.tier = [aDecoder decodeDoubleForKey:kActivityModeHashTier];
    self.modeType = [aDecoder decodeDoubleForKey:kActivityModeHashModeType];
    self.activityModeCategory = [aDecoder decodeDoubleForKey:kActivityModeHashActivityModeCategory];
    self.isAggregateMode = [aDecoder decodeBoolForKey:kActivityModeHashIsAggregateMode];
    self.redacted = [aDecoder decodeBoolForKey:kActivityModeHashRedacted];
    self.blacklisted = [aDecoder decodeBoolForKey:kActivityModeHashBlacklisted];
    self.order = [aDecoder decodeDoubleForKey:kActivityModeHashOrder];
    self.displayProperties = [aDecoder decodeObjectForKey:kActivityModeHashDisplayProperties];
    self.isTeamBased = [aDecoder decodeBoolForKey:kActivityModeHashIsTeamBased];
    self.pgcrImage = [aDecoder decodeObjectForKey:kActivityModeHashPgcrImage];
    self.supportsFeedFiltering = [aDecoder decodeBoolForKey:kActivityModeHashSupportsFeedFiltering];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_hash forKey:kActivityModeHashHash];
    [aCoder encodeDouble:_index forKey:kActivityModeHashIndex];
    [aCoder encodeObject:_parentHashes forKey:kActivityModeHashParentHashes];
    [aCoder encodeBool:_display forKey:kActivityModeHashDisplay];
    [aCoder encodeObject:_friendlyName forKey:kActivityModeHashFriendlyName];
    [aCoder encodeDouble:_tier forKey:kActivityModeHashTier];
    [aCoder encodeDouble:_modeType forKey:kActivityModeHashModeType];
    [aCoder encodeDouble:_activityModeCategory forKey:kActivityModeHashActivityModeCategory];
    [aCoder encodeBool:_isAggregateMode forKey:kActivityModeHashIsAggregateMode];
    [aCoder encodeBool:_redacted forKey:kActivityModeHashRedacted];
    [aCoder encodeBool:_blacklisted forKey:kActivityModeHashBlacklisted];
    [aCoder encodeDouble:_order forKey:kActivityModeHashOrder];
    [aCoder encodeObject:_displayProperties forKey:kActivityModeHashDisplayProperties];
    [aCoder encodeBool:_isTeamBased forKey:kActivityModeHashIsTeamBased];
    [aCoder encodeObject:_pgcrImage forKey:kActivityModeHashPgcrImage];
    [aCoder encodeBool:_supportsFeedFiltering forKey:kActivityModeHashSupportsFeedFiltering];
}

- (id)copyWithZone:(NSZone *)zone
{
    ActivityModeHash *copy = [[ActivityModeHash alloc] init];
    
    if (copy) {
        
        copy.hash = self.hash;
        copy.index = self.index;
        copy.parentHashes = [self.parentHashes copyWithZone:zone];
        copy.display = self.display;
        copy.friendlyName = [self.friendlyName copyWithZone:zone];
        copy.tier = self.tier;
        copy.modeType = self.modeType;
        copy.activityModeCategory = self.activityModeCategory;
        copy.isAggregateMode = self.isAggregateMode;
        copy.redacted = self.redacted;
        copy.blacklisted = self.blacklisted;
        copy.order = self.order;
        copy.displayProperties = [self.displayProperties copyWithZone:zone];
        copy.isTeamBased = self.isTeamBased;
        copy.pgcrImage = [self.pgcrImage copyWithZone:zone];
        copy.supportsFeedFiltering = self.supportsFeedFiltering;
    }
    
    return copy;
}


@end

//
//  BungieNetUserInfo.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "CLNMBungieNetUserInfo.h"


NSString *const kBungieNetUserInfoDisplayName = @"displayName";
NSString *const kBungieNetUserInfoCrossSaveOverride = @"crossSaveOverride";
NSString *const kBungieNetUserInfoMembershipType = @"membershipType";
NSString *const kBungieNetUserInfoSupplementalDisplayName = @"supplementalDisplayName";
NSString *const kBungieNetUserInfoMembershipId = @"membershipId";
NSString *const kBungieNetUserInfoIsPublic = @"isPublic";
NSString *const kBungieNetUserInfoIconPath = @"iconPath";


@interface CLNMBungieNetUserInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLNMBungieNetUserInfo

@synthesize displayName = _displayName;
@synthesize crossSaveOverride = _crossSaveOverride;
@synthesize membershipType = _membershipType;
@synthesize supplementalDisplayName = _supplementalDisplayName;
@synthesize membershipId = _membershipId;
@synthesize isPublic = _isPublic;
@synthesize iconPath = _iconPath;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kBungieNetUserInfoDisplayName,@"displayName",
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
            self.displayName = [self objectOrNilForKey:kBungieNetUserInfoDisplayName fromDictionary:dict];
            self.crossSaveOverride = [[self objectOrNilForKey:kBungieNetUserInfoCrossSaveOverride fromDictionary:dict] doubleValue];
            self.membershipType = [[self objectOrNilForKey:kBungieNetUserInfoMembershipType fromDictionary:dict] doubleValue];
            self.supplementalDisplayName = [self objectOrNilForKey:kBungieNetUserInfoSupplementalDisplayName fromDictionary:dict];
            self.membershipId = [self objectOrNilForKey:kBungieNetUserInfoMembershipId fromDictionary:dict];
            self.isPublic = [[self objectOrNilForKey:kBungieNetUserInfoIsPublic fromDictionary:dict] boolValue];
            self.iconPath = [self objectOrNilForKey:kBungieNetUserInfoIconPath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.displayName forKey:kBungieNetUserInfoDisplayName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.crossSaveOverride] forKey:kBungieNetUserInfoCrossSaveOverride];
    [mutableDict setValue:[NSNumber numberWithDouble:self.membershipType] forKey:kBungieNetUserInfoMembershipType];
    [mutableDict setValue:self.supplementalDisplayName forKey:kBungieNetUserInfoSupplementalDisplayName];
    [mutableDict setValue:self.membershipId forKey:kBungieNetUserInfoMembershipId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPublic] forKey:kBungieNetUserInfoIsPublic];
    [mutableDict setValue:self.iconPath forKey:kBungieNetUserInfoIconPath];

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

    self.displayName = [aDecoder decodeObjectForKey:kBungieNetUserInfoDisplayName];
    self.crossSaveOverride = [aDecoder decodeDoubleForKey:kBungieNetUserInfoCrossSaveOverride];
    self.membershipType = [aDecoder decodeDoubleForKey:kBungieNetUserInfoMembershipType];
    self.supplementalDisplayName = [aDecoder decodeObjectForKey:kBungieNetUserInfoSupplementalDisplayName];
    self.membershipId = [aDecoder decodeObjectForKey:kBungieNetUserInfoMembershipId];
    self.isPublic = [aDecoder decodeBoolForKey:kBungieNetUserInfoIsPublic];
    self.iconPath = [aDecoder decodeObjectForKey:kBungieNetUserInfoIconPath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_displayName forKey:kBungieNetUserInfoDisplayName];
    [aCoder encodeDouble:_crossSaveOverride forKey:kBungieNetUserInfoCrossSaveOverride];
    [aCoder encodeDouble:_membershipType forKey:kBungieNetUserInfoMembershipType];
    [aCoder encodeObject:_supplementalDisplayName forKey:kBungieNetUserInfoSupplementalDisplayName];
    [aCoder encodeObject:_membershipId forKey:kBungieNetUserInfoMembershipId];
    [aCoder encodeBool:_isPublic forKey:kBungieNetUserInfoIsPublic];
    [aCoder encodeObject:_iconPath forKey:kBungieNetUserInfoIconPath];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLNMBungieNetUserInfo *copy = [[CLNMBungieNetUserInfo alloc] init];
    
    if (copy) {

        copy.displayName = [self.displayName copyWithZone:zone];
        copy.crossSaveOverride = self.crossSaveOverride;
        copy.membershipType = self.membershipType;
        copy.supplementalDisplayName = [self.supplementalDisplayName copyWithZone:zone];
        copy.membershipId = [self.membershipId copyWithZone:zone];
        copy.isPublic = self.isPublic;
        copy.iconPath = [self.iconPath copyWithZone:zone];
    }
    
    return copy;
}


@end

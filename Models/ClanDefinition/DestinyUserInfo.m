//
//  DestinyUserInfo.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "DestinyUserInfo.h"


NSString *const kDestinyUserInfoDisplayName = @"displayName";
NSString *const kDestinyUserInfoCrossSaveOverride = @"crossSaveOverride";
NSString *const kDestinyUserInfoApplicableMembershipTypes = @"applicableMembershipTypes";
NSString *const kDestinyUserInfoMembershipType = @"membershipType";
NSString *const kDestinyUserInfoLastSeenDisplayNameType = @"LastSeenDisplayNameType";
NSString *const kDestinyUserInfoIsPublic = @"isPublic";
NSString *const kDestinyUserInfoLastSeenDisplayName = @"LastSeenDisplayName";
NSString *const kDestinyUserInfoMembershipId = @"membershipId";
NSString *const kDestinyUserInfoIconPath = @"iconPath";


@interface DestinyUserInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DestinyUserInfo

@synthesize displayName = _displayName;
@synthesize crossSaveOverride = _crossSaveOverride;
@synthesize applicableMembershipTypes = _applicableMembershipTypes;
@synthesize membershipType = _membershipType;
@synthesize lastSeenDisplayNameType = _lastSeenDisplayNameType;
@synthesize isPublic = _isPublic;
@synthesize lastSeenDisplayName = _lastSeenDisplayName;
@synthesize membershipId = _membershipId;
@synthesize iconPath = _iconPath;


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
            self.displayName = [self objectOrNilForKey:kDestinyUserInfoDisplayName fromDictionary:dict];
            self.crossSaveOverride = [[self objectOrNilForKey:kDestinyUserInfoCrossSaveOverride fromDictionary:dict] doubleValue];
            self.applicableMembershipTypes = [self objectOrNilForKey:kDestinyUserInfoApplicableMembershipTypes fromDictionary:dict];
            self.membershipType = [[self objectOrNilForKey:kDestinyUserInfoMembershipType fromDictionary:dict] doubleValue];
            self.lastSeenDisplayNameType = [[self objectOrNilForKey:kDestinyUserInfoLastSeenDisplayNameType fromDictionary:dict] doubleValue];
            self.isPublic = [[self objectOrNilForKey:kDestinyUserInfoIsPublic fromDictionary:dict] boolValue];
            self.lastSeenDisplayName = [self objectOrNilForKey:kDestinyUserInfoLastSeenDisplayName fromDictionary:dict];
            self.membershipId = [self objectOrNilForKey:kDestinyUserInfoMembershipId fromDictionary:dict];
            self.iconPath = [self objectOrNilForKey:kDestinyUserInfoIconPath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.displayName forKey:kDestinyUserInfoDisplayName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.crossSaveOverride] forKey:kDestinyUserInfoCrossSaveOverride];
    NSMutableArray *tempArrayForApplicableMembershipTypes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.applicableMembershipTypes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForApplicableMembershipTypes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForApplicableMembershipTypes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForApplicableMembershipTypes] forKey:kDestinyUserInfoApplicableMembershipTypes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.membershipType] forKey:kDestinyUserInfoMembershipType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastSeenDisplayNameType] forKey:kDestinyUserInfoLastSeenDisplayNameType];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPublic] forKey:kDestinyUserInfoIsPublic];
    [mutableDict setValue:self.lastSeenDisplayName forKey:kDestinyUserInfoLastSeenDisplayName];
    [mutableDict setValue:self.membershipId forKey:kDestinyUserInfoMembershipId];
    [mutableDict setValue:self.iconPath forKey:kDestinyUserInfoIconPath];

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

    self.displayName = [aDecoder decodeObjectForKey:kDestinyUserInfoDisplayName];
    self.crossSaveOverride = [aDecoder decodeDoubleForKey:kDestinyUserInfoCrossSaveOverride];
    self.applicableMembershipTypes = [aDecoder decodeObjectForKey:kDestinyUserInfoApplicableMembershipTypes];
    self.membershipType = [aDecoder decodeDoubleForKey:kDestinyUserInfoMembershipType];
    self.lastSeenDisplayNameType = [aDecoder decodeDoubleForKey:kDestinyUserInfoLastSeenDisplayNameType];
    self.isPublic = [aDecoder decodeBoolForKey:kDestinyUserInfoIsPublic];
    self.lastSeenDisplayName = [aDecoder decodeObjectForKey:kDestinyUserInfoLastSeenDisplayName];
    self.membershipId = [aDecoder decodeObjectForKey:kDestinyUserInfoMembershipId];
    self.iconPath = [aDecoder decodeObjectForKey:kDestinyUserInfoIconPath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_displayName forKey:kDestinyUserInfoDisplayName];
    [aCoder encodeDouble:_crossSaveOverride forKey:kDestinyUserInfoCrossSaveOverride];
    [aCoder encodeObject:_applicableMembershipTypes forKey:kDestinyUserInfoApplicableMembershipTypes];
    [aCoder encodeDouble:_membershipType forKey:kDestinyUserInfoMembershipType];
    [aCoder encodeDouble:_lastSeenDisplayNameType forKey:kDestinyUserInfoLastSeenDisplayNameType];
    [aCoder encodeBool:_isPublic forKey:kDestinyUserInfoIsPublic];
    [aCoder encodeObject:_lastSeenDisplayName forKey:kDestinyUserInfoLastSeenDisplayName];
    [aCoder encodeObject:_membershipId forKey:kDestinyUserInfoMembershipId];
    [aCoder encodeObject:_iconPath forKey:kDestinyUserInfoIconPath];
}

- (id)copyWithZone:(NSZone *)zone
{
    DestinyUserInfo *copy = [[DestinyUserInfo alloc] init];
    
    if (copy) {

        copy.displayName = [self.displayName copyWithZone:zone];
        copy.crossSaveOverride = self.crossSaveOverride;
        copy.applicableMembershipTypes = [self.applicableMembershipTypes copyWithZone:zone];
        copy.membershipType = self.membershipType;
        copy.lastSeenDisplayNameType = self.lastSeenDisplayNameType;
        copy.isPublic = self.isPublic;
        copy.lastSeenDisplayName = [self.lastSeenDisplayName copyWithZone:zone];
        copy.membershipId = [self.membershipId copyWithZone:zone];
        copy.iconPath = [self.iconPath copyWithZone:zone];
    }
    
    return copy;
}


@end

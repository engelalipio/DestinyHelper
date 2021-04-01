//
//  CLNMDestinyUserInfo.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "CLNMDestinyUserInfo.h"


NSString *const kCLNMDestinyUserInfoDisplayName = @"displayName";
NSString *const kCLNMDestinyUserInfoCrossSaveOverride = @"crossSaveOverride";
NSString *const kCLNMDestinyUserInfoApplicableMembershipTypes = @"applicableMembershipTypes";
NSString *const kCLNMDestinyUserInfoMembershipType = @"membershipType";
NSString *const kCLMNDestinyUserInfoLastSeenDisplayNameType = @"LastSeenDisplayNameType";
NSString *const kCLMNDestinyUserInfoIsPublic = @"isPublic";
NSString *const kCLNMDestinyUserInfoLastSeenDisplayName = @"LastSeenDisplayName";
NSString *const kCLNMDestinyUserInfoMembershipId = @"membershipId";
NSString *const kCLNMDestinyUserInfoIconPath = @"iconPath";


@interface CLNMDestinyUserInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLNMDestinyUserInfo

@synthesize displayName = _displayName;
@synthesize crossSaveOverride = _crossSaveOverride;
@synthesize applicableMembershipTypes = _applicableMembershipTypes;
@synthesize membershipType = _membershipType;
@synthesize lastSeenDisplayNameType = _lastSeenDisplayNameType;
@synthesize isPublic = _isPublic;
@synthesize lastSeenDisplayName = _lastSeenDisplayName;
@synthesize membershipId = _membershipId;
@synthesize iconPath = _iconPath;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kCLNMDestinyUserInfoDisplayName,@"displayName",
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
            self.displayName = [self objectOrNilForKey:kCLNMDestinyUserInfoDisplayName fromDictionary:dict];
            self.crossSaveOverride = [[self objectOrNilForKey:kCLNMDestinyUserInfoCrossSaveOverride fromDictionary:dict] doubleValue];
            self.applicableMembershipTypes = [self objectOrNilForKey:kCLNMDestinyUserInfoApplicableMembershipTypes fromDictionary:dict];
            self.membershipType = [[self objectOrNilForKey:kCLNMDestinyUserInfoMembershipType fromDictionary:dict] doubleValue];
            self.lastSeenDisplayNameType = [[self objectOrNilForKey:kCLMNDestinyUserInfoLastSeenDisplayNameType fromDictionary:dict] doubleValue];
            self.isPublic = [[self objectOrNilForKey:kCLMNDestinyUserInfoIsPublic fromDictionary:dict] boolValue];
            self.lastSeenDisplayName = [self objectOrNilForKey:kCLNMDestinyUserInfoLastSeenDisplayName fromDictionary:dict];
            self.membershipId = [self objectOrNilForKey:kCLNMDestinyUserInfoMembershipId fromDictionary:dict];
            self.iconPath = [self objectOrNilForKey:kCLNMDestinyUserInfoIconPath fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.displayName forKey:kCLNMDestinyUserInfoDisplayName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.crossSaveOverride] forKey:kCLNMDestinyUserInfoCrossSaveOverride];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForApplicableMembershipTypes] forKey:kCLNMDestinyUserInfoApplicableMembershipTypes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.membershipType] forKey:kCLNMDestinyUserInfoMembershipType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastSeenDisplayNameType] forKey:kCLMNDestinyUserInfoLastSeenDisplayNameType];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPublic] forKey:kCLMNDestinyUserInfoIsPublic];
    [mutableDict setValue:self.lastSeenDisplayName forKey:kCLNMDestinyUserInfoLastSeenDisplayName];
    [mutableDict setValue:self.membershipId forKey:kCLNMDestinyUserInfoMembershipId];
    [mutableDict setValue:self.iconPath forKey:kCLNMDestinyUserInfoIconPath];

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

    self.displayName = [aDecoder decodeObjectForKey:kCLNMDestinyUserInfoDisplayName];
    self.crossSaveOverride = [aDecoder decodeDoubleForKey:kCLNMDestinyUserInfoCrossSaveOverride];
    self.applicableMembershipTypes = [aDecoder decodeObjectForKey:kCLNMDestinyUserInfoApplicableMembershipTypes];
    self.membershipType = [aDecoder decodeDoubleForKey:kCLNMDestinyUserInfoMembershipType];
    self.lastSeenDisplayNameType = [aDecoder decodeDoubleForKey:kCLMNDestinyUserInfoLastSeenDisplayNameType];
    self.isPublic = [aDecoder decodeBoolForKey:kCLMNDestinyUserInfoIsPublic];
    self.lastSeenDisplayName = [aDecoder decodeObjectForKey:kCLNMDestinyUserInfoLastSeenDisplayName];
    self.membershipId = [aDecoder decodeObjectForKey:kCLNMDestinyUserInfoMembershipId];
    self.iconPath = [aDecoder decodeObjectForKey:kCLNMDestinyUserInfoIconPath];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_displayName forKey:kCLNMDestinyUserInfoDisplayName];
    [aCoder encodeDouble:_crossSaveOverride forKey:kCLNMDestinyUserInfoCrossSaveOverride];
    [aCoder encodeObject:_applicableMembershipTypes forKey:kCLNMDestinyUserInfoApplicableMembershipTypes];
    [aCoder encodeDouble:_membershipType forKey:kCLNMDestinyUserInfoMembershipType];
    [aCoder encodeDouble:_lastSeenDisplayNameType forKey:kCLMNDestinyUserInfoLastSeenDisplayNameType];
    [aCoder encodeBool:_isPublic forKey:kCLMNDestinyUserInfoIsPublic];
    [aCoder encodeObject:_lastSeenDisplayName forKey:kCLNMDestinyUserInfoLastSeenDisplayName];
    [aCoder encodeObject:_membershipId forKey:kCLNMDestinyUserInfoMembershipId];
    [aCoder encodeObject:_iconPath forKey:kCLNMDestinyUserInfoIconPath];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLNMDestinyUserInfo *copy = [[CLNMDestinyUserInfo alloc] init];
    
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

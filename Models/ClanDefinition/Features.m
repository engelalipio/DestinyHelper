//
//  Features.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "Features.h"


NSString *const kFeaturesMaximumMembers = @"maximumMembers";
NSString *const kFeaturesCapabilities = @"capabilities";
NSString *const kFeaturesJoinLevel = @"joinLevel";
NSString *const kFeaturesUpdateCulturePermissionOverride = @"updateCulturePermissionOverride";
NSString *const kFeaturesInvitePermissionOverride = @"invitePermissionOverride";
NSString *const kFeaturesMembershipTypes = @"membershipTypes";
NSString *const kFeaturesUpdateBannerPermissionOverride = @"updateBannerPermissionOverride";
NSString *const kFeaturesHostGuidedGamePermissionOverride = @"hostGuidedGamePermissionOverride";
NSString *const kFeaturesMaximumMembershipsOfGroupType = @"maximumMembershipsOfGroupType";


@interface Features ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Features

@synthesize maximumMembers = _maximumMembers;
@synthesize capabilities = _capabilities;
@synthesize joinLevel = _joinLevel;
@synthesize updateCulturePermissionOverride = _updateCulturePermissionOverride;
@synthesize invitePermissionOverride = _invitePermissionOverride;
@synthesize membershipTypes = _membershipTypes;
@synthesize updateBannerPermissionOverride = _updateBannerPermissionOverride;
@synthesize hostGuidedGamePermissionOverride = _hostGuidedGamePermissionOverride;
@synthesize maximumMembershipsOfGroupType = _maximumMembershipsOfGroupType;


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
            self.maximumMembers = [[self objectOrNilForKey:kFeaturesMaximumMembers fromDictionary:dict] doubleValue];
            self.capabilities = [[self objectOrNilForKey:kFeaturesCapabilities fromDictionary:dict] doubleValue];
            self.joinLevel = [[self objectOrNilForKey:kFeaturesJoinLevel fromDictionary:dict] doubleValue];
            self.updateCulturePermissionOverride = [[self objectOrNilForKey:kFeaturesUpdateCulturePermissionOverride fromDictionary:dict] boolValue];
            self.invitePermissionOverride = [[self objectOrNilForKey:kFeaturesInvitePermissionOverride fromDictionary:dict] boolValue];
            self.membershipTypes = [self objectOrNilForKey:kFeaturesMembershipTypes fromDictionary:dict];
            self.updateBannerPermissionOverride = [[self objectOrNilForKey:kFeaturesUpdateBannerPermissionOverride fromDictionary:dict] boolValue];
            self.hostGuidedGamePermissionOverride = [[self objectOrNilForKey:kFeaturesHostGuidedGamePermissionOverride fromDictionary:dict] doubleValue];
            self.maximumMembershipsOfGroupType = [[self objectOrNilForKey:kFeaturesMaximumMembershipsOfGroupType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maximumMembers] forKey:kFeaturesMaximumMembers];
    [mutableDict setValue:[NSNumber numberWithDouble:self.capabilities] forKey:kFeaturesCapabilities];
    [mutableDict setValue:[NSNumber numberWithDouble:self.joinLevel] forKey:kFeaturesJoinLevel];
    [mutableDict setValue:[NSNumber numberWithBool:self.updateCulturePermissionOverride] forKey:kFeaturesUpdateCulturePermissionOverride];
    [mutableDict setValue:[NSNumber numberWithBool:self.invitePermissionOverride] forKey:kFeaturesInvitePermissionOverride];
    NSMutableArray *tempArrayForMembershipTypes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.membershipTypes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMembershipTypes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMembershipTypes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMembershipTypes] forKey:kFeaturesMembershipTypes];
    [mutableDict setValue:[NSNumber numberWithBool:self.updateBannerPermissionOverride] forKey:kFeaturesUpdateBannerPermissionOverride];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hostGuidedGamePermissionOverride] forKey:kFeaturesHostGuidedGamePermissionOverride];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maximumMembershipsOfGroupType] forKey:kFeaturesMaximumMembershipsOfGroupType];

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

    self.maximumMembers = [aDecoder decodeDoubleForKey:kFeaturesMaximumMembers];
    self.capabilities = [aDecoder decodeDoubleForKey:kFeaturesCapabilities];
    self.joinLevel = [aDecoder decodeDoubleForKey:kFeaturesJoinLevel];
    self.updateCulturePermissionOverride = [aDecoder decodeBoolForKey:kFeaturesUpdateCulturePermissionOverride];
    self.invitePermissionOverride = [aDecoder decodeBoolForKey:kFeaturesInvitePermissionOverride];
    self.membershipTypes = [aDecoder decodeObjectForKey:kFeaturesMembershipTypes];
    self.updateBannerPermissionOverride = [aDecoder decodeBoolForKey:kFeaturesUpdateBannerPermissionOverride];
    self.hostGuidedGamePermissionOverride = [aDecoder decodeDoubleForKey:kFeaturesHostGuidedGamePermissionOverride];
    self.maximumMembershipsOfGroupType = [aDecoder decodeDoubleForKey:kFeaturesMaximumMembershipsOfGroupType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_maximumMembers forKey:kFeaturesMaximumMembers];
    [aCoder encodeDouble:_capabilities forKey:kFeaturesCapabilities];
    [aCoder encodeDouble:_joinLevel forKey:kFeaturesJoinLevel];
    [aCoder encodeBool:_updateCulturePermissionOverride forKey:kFeaturesUpdateCulturePermissionOverride];
    [aCoder encodeBool:_invitePermissionOverride forKey:kFeaturesInvitePermissionOverride];
    [aCoder encodeObject:_membershipTypes forKey:kFeaturesMembershipTypes];
    [aCoder encodeBool:_updateBannerPermissionOverride forKey:kFeaturesUpdateBannerPermissionOverride];
    [aCoder encodeDouble:_hostGuidedGamePermissionOverride forKey:kFeaturesHostGuidedGamePermissionOverride];
    [aCoder encodeDouble:_maximumMembershipsOfGroupType forKey:kFeaturesMaximumMembershipsOfGroupType];
}

- (id)copyWithZone:(NSZone *)zone
{
    Features *copy = [[Features alloc] init];
    
    if (copy) {

        copy.maximumMembers = self.maximumMembers;
        copy.capabilities = self.capabilities;
        copy.joinLevel = self.joinLevel;
        copy.updateCulturePermissionOverride = self.updateCulturePermissionOverride;
        copy.invitePermissionOverride = self.invitePermissionOverride;
        copy.membershipTypes = [self.membershipTypes copyWithZone:zone];
        copy.updateBannerPermissionOverride = self.updateBannerPermissionOverride;
        copy.hostGuidedGamePermissionOverride = self.hostGuidedGamePermissionOverride;
        copy.maximumMembershipsOfGroupType = self.maximumMembershipsOfGroupType;
    }
    
    return copy;
}


@end

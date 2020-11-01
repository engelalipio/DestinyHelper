//
//  MBRDestinyMemberships.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MBRDestinyMemberships.h"


NSString *const kMBRDestinyMembershipsMembershipId = @"membershipId";
NSString *const kMBRDestinyMembershipsIconPath = @"iconPath";
NSString *const kMBRDestinyMembershipsDisplayName = @"displayName";
NSString *const kMBRDestinyMembershipsMembershipType = @"membershipType";


@interface MBRDestinyMemberships ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MBRDestinyMemberships

@synthesize membershipId = _membershipId;
@synthesize iconPath = _iconPath;
@synthesize displayName = _displayName;
@synthesize membershipType = _membershipType;


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
            self.membershipId = [self objectOrNilForKey:kMBRDestinyMembershipsMembershipId fromDictionary:dict];
            self.iconPath = [self objectOrNilForKey:kMBRDestinyMembershipsIconPath fromDictionary:dict];
            self.displayName = [self objectOrNilForKey:kMBRDestinyMembershipsDisplayName fromDictionary:dict];
            self.membershipType = [[self objectOrNilForKey:kMBRDestinyMembershipsMembershipType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.membershipId forKey:kMBRDestinyMembershipsMembershipId];
    [mutableDict setValue:self.iconPath forKey:kMBRDestinyMembershipsIconPath];
    [mutableDict setValue:self.displayName forKey:kMBRDestinyMembershipsDisplayName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.membershipType] forKey:kMBRDestinyMembershipsMembershipType];

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

    self.membershipId = [aDecoder decodeObjectForKey:kMBRDestinyMembershipsMembershipId];
    self.iconPath = [aDecoder decodeObjectForKey:kMBRDestinyMembershipsIconPath];
    self.displayName = [aDecoder decodeObjectForKey:kMBRDestinyMembershipsDisplayName];
    self.membershipType = [aDecoder decodeDoubleForKey:kMBRDestinyMembershipsMembershipType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_membershipId forKey:kMBRDestinyMembershipsMembershipId];
    [aCoder encodeObject:_iconPath forKey:kMBRDestinyMembershipsIconPath];
    [aCoder encodeObject:_displayName forKey:kMBRDestinyMembershipsDisplayName];
    [aCoder encodeDouble:_membershipType forKey:kMBRDestinyMembershipsMembershipType];
}

- (id)copyWithZone:(NSZone *)zone
{
    MBRDestinyMemberships *copy = [[MBRDestinyMemberships alloc] init];
    
    if (copy) {

        copy.membershipId = [self.membershipId copyWithZone:zone];
        copy.iconPath = [self.iconPath copyWithZone:zone];
        copy.displayName = [self.displayName copyWithZone:zone];
        copy.membershipType = self.membershipType;
    }
    
    return copy;
}


@end

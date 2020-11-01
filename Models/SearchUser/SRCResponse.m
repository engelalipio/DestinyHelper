//
//  SRCResponse.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SRCResponse.h"


NSString *const kSRCResponseMembershipId = @"membershipId";
NSString *const kSRCResponseIconPath = @"iconPath";
NSString *const kSRCResponseDisplayName = @"displayName";
NSString *const kSRCResponseMembershipType = @"membershipType";


@interface SRCResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SRCResponse

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
            self.membershipId = [self objectOrNilForKey:kSRCResponseMembershipId fromDictionary:dict];
            self.iconPath = [self objectOrNilForKey:kSRCResponseIconPath fromDictionary:dict];
            self.displayName = [self objectOrNilForKey:kSRCResponseDisplayName fromDictionary:dict];
            self.membershipType = [[self objectOrNilForKey:kSRCResponseMembershipType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.membershipId forKey:kSRCResponseMembershipId];
    [mutableDict setValue:self.iconPath forKey:kSRCResponseIconPath];
    [mutableDict setValue:self.displayName forKey:kSRCResponseDisplayName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.membershipType] forKey:kSRCResponseMembershipType];

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

    self.membershipId = [aDecoder decodeObjectForKey:kSRCResponseMembershipId];
    self.iconPath = [aDecoder decodeObjectForKey:kSRCResponseIconPath];
    self.displayName = [aDecoder decodeObjectForKey:kSRCResponseDisplayName];
    self.membershipType = [aDecoder decodeDoubleForKey:kSRCResponseMembershipType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_membershipId forKey:kSRCResponseMembershipId];
    [aCoder encodeObject:_iconPath forKey:kSRCResponseIconPath];
    [aCoder encodeObject:_displayName forKey:kSRCResponseDisplayName];
    [aCoder encodeDouble:_membershipType forKey:kSRCResponseMembershipType];
}

- (id)copyWithZone:(NSZone *)zone
{
    SRCResponse *copy = [[SRCResponse alloc] init];
    
    if (copy) {

        copy.membershipId = [self.membershipId copyWithZone:zone];
        copy.iconPath = [self.iconPath copyWithZone:zone];
        copy.displayName = [self.displayName copyWithZone:zone];
        copy.membershipType = self.membershipType;
    }
    
    return copy;
}


@end

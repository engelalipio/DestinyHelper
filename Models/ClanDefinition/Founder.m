//
//  Founder.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "Founder.h"
#import "DestinyUserInfo.h"


NSString *const kFounderGroupId = @"groupId";
NSString *const kFounderJoinDate = @"joinDate";
NSString *const kFounderLastOnlineStatusChange = @"lastOnlineStatusChange";
NSString *const kFounderIsOnline = @"isOnline";
NSString *const kFounderMemberType = @"memberType";
NSString *const kFounderDestinyUserInfo = @"destinyUserInfo";


@interface Founder ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Founder

@synthesize groupId = _groupId;
@synthesize joinDate = _joinDate;
@synthesize lastOnlineStatusChange = _lastOnlineStatusChange;
@synthesize isOnline = _isOnline;
@synthesize memberType = _memberType;
@synthesize destinyUserInfo = _destinyUserInfo;


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
            self.groupId = [self objectOrNilForKey:kFounderGroupId fromDictionary:dict];
            self.joinDate = [self objectOrNilForKey:kFounderJoinDate fromDictionary:dict];
            self.lastOnlineStatusChange = [self objectOrNilForKey:kFounderLastOnlineStatusChange fromDictionary:dict];
            self.isOnline = [[self objectOrNilForKey:kFounderIsOnline fromDictionary:dict] boolValue];
            self.memberType = [[self objectOrNilForKey:kFounderMemberType fromDictionary:dict] doubleValue];
            self.destinyUserInfo = [DestinyUserInfo modelObjectWithDictionary:[dict objectForKey:kFounderDestinyUserInfo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.groupId forKey:kFounderGroupId];
    [mutableDict setValue:self.joinDate forKey:kFounderJoinDate];
    [mutableDict setValue:self.lastOnlineStatusChange forKey:kFounderLastOnlineStatusChange];
    [mutableDict setValue:[NSNumber numberWithBool:self.isOnline] forKey:kFounderIsOnline];
    [mutableDict setValue:[NSNumber numberWithDouble:self.memberType] forKey:kFounderMemberType];
    [mutableDict setValue:[self.destinyUserInfo dictionaryRepresentation] forKey:kFounderDestinyUserInfo];

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

    self.groupId = [aDecoder decodeObjectForKey:kFounderGroupId];
    self.joinDate = [aDecoder decodeObjectForKey:kFounderJoinDate];
    self.lastOnlineStatusChange = [aDecoder decodeObjectForKey:kFounderLastOnlineStatusChange];
    self.isOnline = [aDecoder decodeBoolForKey:kFounderIsOnline];
    self.memberType = [aDecoder decodeDoubleForKey:kFounderMemberType];
    self.destinyUserInfo = [aDecoder decodeObjectForKey:kFounderDestinyUserInfo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_groupId forKey:kFounderGroupId];
    [aCoder encodeObject:_joinDate forKey:kFounderJoinDate];
    [aCoder encodeObject:_lastOnlineStatusChange forKey:kFounderLastOnlineStatusChange];
    [aCoder encodeBool:_isOnline forKey:kFounderIsOnline];
    [aCoder encodeDouble:_memberType forKey:kFounderMemberType];
    [aCoder encodeObject:_destinyUserInfo forKey:kFounderDestinyUserInfo];
}

- (id)copyWithZone:(NSZone *)zone
{
    Founder *copy = [[Founder alloc] init];
    
    if (copy) {

        copy.groupId = [self.groupId copyWithZone:zone];
        copy.joinDate = [self.joinDate copyWithZone:zone];
        copy.lastOnlineStatusChange = [self.lastOnlineStatusChange copyWithZone:zone];
        copy.isOnline = self.isOnline;
        copy.memberType = self.memberType;
        copy.destinyUserInfo = [self.destinyUserInfo copyWithZone:zone];
    }
    
    return copy;
}


@end

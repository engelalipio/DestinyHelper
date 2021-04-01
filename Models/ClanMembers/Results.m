//
//  Results.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "Results.h"
#import "CLNMBungieNetUserInfo.h"
#import "CLNMDestinyUserInfo.h"


NSString *const kResultsBungieNetUserInfo = @"bungieNetUserInfo";
NSString *const kResultsDestinyUserInfo = @"destinyUserInfo";
NSString *const kResultsLastOnlineStatusChange = @"lastOnlineStatusChange";
NSString *const kResultsMemberType = @"memberType";
NSString *const kResultsIsOnline = @"isOnline";
NSString *const kResultsGroupId = @"groupId";
NSString *const kResultsJoinDate = @"joinDate";


@interface Results ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Results

@synthesize bungieNetUserInfo = _bungieNetUserInfo;
@synthesize destinyUserInfo = _destinyUserInfo;
@synthesize lastOnlineStatusChange = _lastOnlineStatusChange;
@synthesize memberType = _memberType;
@synthesize isOnline = _isOnline;
@synthesize groupId = _groupId;
@synthesize joinDate = _joinDate;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kResultsBungieNetUserInfo,@"bungieNetUserInfo",
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
            self.bungieNetUserInfo = [CLNMBungieNetUserInfo modelObjectWithDictionary:[dict objectForKey:kResultsBungieNetUserInfo]];
            self.destinyUserInfo = [CLNMDestinyUserInfo modelObjectWithDictionary:[dict objectForKey:kResultsDestinyUserInfo]];
            self.lastOnlineStatusChange = [self objectOrNilForKey:kResultsLastOnlineStatusChange fromDictionary:dict];
            self.memberType = [[self objectOrNilForKey:kResultsMemberType fromDictionary:dict] doubleValue];
            self.isOnline = [[self objectOrNilForKey:kResultsIsOnline fromDictionary:dict] boolValue];
            self.groupId = [self objectOrNilForKey:kResultsGroupId fromDictionary:dict];
            self.joinDate = [self objectOrNilForKey:kResultsJoinDate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.bungieNetUserInfo dictionaryRepresentation] forKey:kResultsBungieNetUserInfo];
    [mutableDict setValue:[self.destinyUserInfo dictionaryRepresentation] forKey:kResultsDestinyUserInfo];
    [mutableDict setValue:self.lastOnlineStatusChange forKey:kResultsLastOnlineStatusChange];
    [mutableDict setValue:[NSNumber numberWithDouble:self.memberType] forKey:kResultsMemberType];
    [mutableDict setValue:[NSNumber numberWithBool:self.isOnline] forKey:kResultsIsOnline];
    [mutableDict setValue:self.groupId forKey:kResultsGroupId];
    [mutableDict setValue:self.joinDate forKey:kResultsJoinDate];

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

    self.bungieNetUserInfo = [aDecoder decodeObjectForKey:kResultsBungieNetUserInfo];
    self.destinyUserInfo = [aDecoder decodeObjectForKey:kResultsDestinyUserInfo];
    self.lastOnlineStatusChange = [aDecoder decodeObjectForKey:kResultsLastOnlineStatusChange];
    self.memberType = [aDecoder decodeDoubleForKey:kResultsMemberType];
    self.isOnline = [aDecoder decodeBoolForKey:kResultsIsOnline];
    self.groupId = [aDecoder decodeObjectForKey:kResultsGroupId];
    self.joinDate = [aDecoder decodeObjectForKey:kResultsJoinDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_bungieNetUserInfo forKey:kResultsBungieNetUserInfo];
    [aCoder encodeObject:_destinyUserInfo forKey:kResultsDestinyUserInfo];
    [aCoder encodeObject:_lastOnlineStatusChange forKey:kResultsLastOnlineStatusChange];
    [aCoder encodeDouble:_memberType forKey:kResultsMemberType];
    [aCoder encodeBool:_isOnline forKey:kResultsIsOnline];
    [aCoder encodeObject:_groupId forKey:kResultsGroupId];
    [aCoder encodeObject:_joinDate forKey:kResultsJoinDate];
}

- (id)copyWithZone:(NSZone *)zone
{
    Results *copy = [[Results alloc] init];
    
    if (copy) {

        copy.bungieNetUserInfo = [self.bungieNetUserInfo copyWithZone:zone];
        copy.destinyUserInfo = [self.destinyUserInfo copyWithZone:zone];
        copy.lastOnlineStatusChange = [self.lastOnlineStatusChange copyWithZone:zone];
        copy.memberType = self.memberType;
        copy.isOnline = self.isOnline;
        copy.groupId = [self.groupId copyWithZone:zone];
        copy.joinDate = [self.joinDate copyWithZone:zone];
    }
    
    return copy;
}


@end

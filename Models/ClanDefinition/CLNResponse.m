//
//  Response.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "CLNResponse.h"
#import "CLNDetail.h"
#import "CurrentUserMemberMap.h"
#import "Founder.h"
#import "CurrentUserPotentialMemberMap.h"


NSString *const kResponseDetail = @"detail";
NSString *const kResponseAllianceStatus = @"allianceStatus";
NSString *const kResponseAlliedIds = @"alliedIds";
NSString *const kResponseCurrentUserMemberMap = @"currentUserMemberMap";
NSString *const kResponseCurrentUserMembershipsInactiveForDestiny = @"currentUserMembershipsInactiveForDestiny";
NSString *const kResponseFounder = @"founder";
NSString *const kResponseGroupJoinInviteCount = @"groupJoinInviteCount";
NSString *const kResponseCurrentUserPotentialMemberMap = @"currentUserPotentialMemberMap";


@interface CLNResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLNResponse

@synthesize detail = _detail;
@synthesize allianceStatus = _allianceStatus;
@synthesize alliedIds = _alliedIds;
@synthesize currentUserMemberMap = _currentUserMemberMap;
@synthesize currentUserMembershipsInactiveForDestiny = _currentUserMembershipsInactiveForDestiny;
@synthesize founder = _founder;
@synthesize groupJoinInviteCount = _groupJoinInviteCount;
@synthesize currentUserPotentialMemberMap = _currentUserPotentialMemberMap;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kResponseDetail,@"detail",
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
            self.detail = [CLNDetail modelObjectWithDictionary:[dict objectForKey:kResponseDetail]];
            self.allianceStatus = [[self objectOrNilForKey:kResponseAllianceStatus fromDictionary:dict] doubleValue];
            self.alliedIds = [self objectOrNilForKey:kResponseAlliedIds fromDictionary:dict];
            self.currentUserMemberMap = [CurrentUserMemberMap modelObjectWithDictionary:[dict objectForKey:kResponseCurrentUserMemberMap]];
            self.currentUserMembershipsInactiveForDestiny = [[self objectOrNilForKey:kResponseCurrentUserMembershipsInactiveForDestiny fromDictionary:dict] boolValue];
            self.founder = [Founder modelObjectWithDictionary:[dict objectForKey:kResponseFounder]];
            self.groupJoinInviteCount = [[self objectOrNilForKey:kResponseGroupJoinInviteCount fromDictionary:dict] doubleValue];
            self.currentUserPotentialMemberMap = [CurrentUserPotentialMemberMap modelObjectWithDictionary:[dict objectForKey:kResponseCurrentUserPotentialMemberMap]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.detail dictionaryRepresentation] forKey:kResponseDetail];
    [mutableDict setValue:[NSNumber numberWithDouble:self.allianceStatus] forKey:kResponseAllianceStatus];
    NSMutableArray *tempArrayForAlliedIds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.alliedIds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAlliedIds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAlliedIds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAlliedIds] forKey:kResponseAlliedIds];
    [mutableDict setValue:[self.currentUserMemberMap dictionaryRepresentation] forKey:kResponseCurrentUserMemberMap];
    [mutableDict setValue:[NSNumber numberWithBool:self.currentUserMembershipsInactiveForDestiny] forKey:kResponseCurrentUserMembershipsInactiveForDestiny];
    [mutableDict setValue:[self.founder dictionaryRepresentation] forKey:kResponseFounder];
    [mutableDict setValue:[NSNumber numberWithDouble:self.groupJoinInviteCount] forKey:kResponseGroupJoinInviteCount];
    [mutableDict setValue:[self.currentUserPotentialMemberMap dictionaryRepresentation] forKey:kResponseCurrentUserPotentialMemberMap];

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

    self.detail = [aDecoder decodeObjectForKey:kResponseDetail];
    self.allianceStatus = [aDecoder decodeDoubleForKey:kResponseAllianceStatus];
    self.alliedIds = [aDecoder decodeObjectForKey:kResponseAlliedIds];
    self.currentUserMemberMap = [aDecoder decodeObjectForKey:kResponseCurrentUserMemberMap];
    self.currentUserMembershipsInactiveForDestiny = [aDecoder decodeBoolForKey:kResponseCurrentUserMembershipsInactiveForDestiny];
    self.founder = [aDecoder decodeObjectForKey:kResponseFounder];
    self.groupJoinInviteCount = [aDecoder decodeDoubleForKey:kResponseGroupJoinInviteCount];
    self.currentUserPotentialMemberMap = [aDecoder decodeObjectForKey:kResponseCurrentUserPotentialMemberMap];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_detail forKey:kResponseDetail];
    [aCoder encodeDouble:_allianceStatus forKey:kResponseAllianceStatus];
    [aCoder encodeObject:_alliedIds forKey:kResponseAlliedIds];
    [aCoder encodeObject:_currentUserMemberMap forKey:kResponseCurrentUserMemberMap];
    [aCoder encodeBool:_currentUserMembershipsInactiveForDestiny forKey:kResponseCurrentUserMembershipsInactiveForDestiny];
    [aCoder encodeObject:_founder forKey:kResponseFounder];
    [aCoder encodeDouble:_groupJoinInviteCount forKey:kResponseGroupJoinInviteCount];
    [aCoder encodeObject:_currentUserPotentialMemberMap forKey:kResponseCurrentUserPotentialMemberMap];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLNResponse *copy = [[CLNResponse alloc] init];
    
    if (copy) {

        copy.detail = [self.detail copyWithZone:zone];
        copy.allianceStatus = self.allianceStatus;
        copy.alliedIds = [self.alliedIds copyWithZone:zone];
        copy.currentUserMemberMap = [self.currentUserMemberMap copyWithZone:zone];
        copy.currentUserMembershipsInactiveForDestiny = self.currentUserMembershipsInactiveForDestiny;
        copy.founder = [self.founder copyWithZone:zone];
        copy.groupJoinInviteCount = self.groupJoinInviteCount;
        copy.currentUserPotentialMemberMap = [self.currentUserPotentialMemberMap copyWithZone:zone];
    }
    
    return copy;
}


@end

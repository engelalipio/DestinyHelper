//
//  GRDCharacterBase.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDCharacterBase.h"
#import "GRDStats.h"
#import "GRDCustomization.h"
#import "GRDPeerView.h"


NSString *const kGRDCharacterBaseGenderHash = @"genderHash";
NSString *const kGRDCharacterBaseMinutesPlayedTotal = @"minutesPlayedTotal";
NSString *const kGRDCharacterBaseBuildStatGroupHash = @"buildStatGroupHash";
NSString *const kGRDCharacterBaseStats = @"stats";
NSString *const kGRDCharacterBaseCurrentActivityHash = @"currentActivityHash";
NSString *const kGRDCharacterBaseMinutesPlayedThisSession = @"minutesPlayedThisSession";
NSString *const kGRDCharacterBaseGrimoireScore = @"grimoireScore";
NSString *const kGRDCharacterBaseCustomization = @"customization";
NSString *const kGRDCharacterBaseGenderType = @"genderType";
NSString *const kGRDCharacterBaseMembershipType = @"membershipType";
NSString *const kGRDCharacterBaseClassHash = @"classHash";
NSString *const kGRDCharacterBaseClassType = @"classType";
NSString *const kGRDCharacterBaseRaceType = @"raceType";
NSString *const kGRDCharacterBaseDateLastPlayed = @"dateLastPlayed";
NSString *const kGRDCharacterBasePowerLevel = @"powerLevel";
NSString *const kGRDCharacterBaseRaceHash = @"raceHash";
NSString *const kGRDCharacterBaseCharacterId = @"characterId";
NSString *const kGRDCharacterBaseMembershipId = @"membershipId";
NSString *const kGRDCharacterBasePeerView = @"peerView";
NSString *const kGRDCharacterBaseLastCompletedStoryHash = @"lastCompletedStoryHash";


@interface GRDCharacterBase ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDCharacterBase

@synthesize genderHash = _genderHash;
@synthesize minutesPlayedTotal = _minutesPlayedTotal;
@synthesize buildStatGroupHash = _buildStatGroupHash;
@synthesize stats = _stats;
@synthesize currentActivityHash = _currentActivityHash;
@synthesize minutesPlayedThisSession = _minutesPlayedThisSession;
@synthesize grimoireScore = _grimoireScore;
@synthesize customization = _customization;
@synthesize genderType = _genderType;
@synthesize membershipType = _membershipType;
@synthesize classHash = _classHash;
@synthesize classType = _classType;
@synthesize dateLastPlayed = _dateLastPlayed;
@synthesize powerLevel = _powerLevel;
@synthesize raceHash = _raceHash;
@synthesize characterId = _characterId;
@synthesize membershipId = _membershipId;
@synthesize peerView = _peerView;
@synthesize lastCompletedStoryHash = _lastCompletedStoryHash;
@synthesize raceType = _raceType;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kGRDCharacterBaseCharacterId,@"characterId",
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
            self.genderHash = [[self objectOrNilForKey:kGRDCharacterBaseGenderHash fromDictionary:dict] doubleValue];
            self.minutesPlayedTotal = [self objectOrNilForKey:kGRDCharacterBaseMinutesPlayedTotal fromDictionary:dict];
            self.buildStatGroupHash = [[self objectOrNilForKey:kGRDCharacterBaseBuildStatGroupHash fromDictionary:dict] doubleValue];
            self.stats = [GRDStats modelObjectWithDictionary:[dict objectForKey:kGRDCharacterBaseStats]];
            self.currentActivityHash = [[self objectOrNilForKey:kGRDCharacterBaseCurrentActivityHash fromDictionary:dict] doubleValue];
            self.minutesPlayedThisSession = [self objectOrNilForKey:kGRDCharacterBaseMinutesPlayedThisSession fromDictionary:dict];
            self.grimoireScore = [[self objectOrNilForKey:kGRDCharacterBaseGrimoireScore fromDictionary:dict] doubleValue];
            self.customization = [GRDCustomization modelObjectWithDictionary:[dict objectForKey:kGRDCharacterBaseCustomization]];
            self.genderType = [[self objectOrNilForKey:kGRDCharacterBaseGenderType fromDictionary:dict] doubleValue];
            self.membershipType = [[self objectOrNilForKey:kGRDCharacterBaseMembershipType fromDictionary:dict] doubleValue];
            self.classHash = [[self objectOrNilForKey:kGRDCharacterBaseClassHash fromDictionary:dict] doubleValue];
            self.classType = [[self objectOrNilForKey:kGRDCharacterBaseClassType fromDictionary:dict] doubleValue];
            self.raceType = [[self objectOrNilForKey:kGRDCharacterBaseRaceType fromDictionary:dict] doubleValue];
            self.dateLastPlayed = [self objectOrNilForKey:kGRDCharacterBaseDateLastPlayed fromDictionary:dict];
            self.powerLevel = [[self objectOrNilForKey:kGRDCharacterBasePowerLevel fromDictionary:dict] doubleValue];
            self.raceHash = [[self objectOrNilForKey:kGRDCharacterBaseRaceHash fromDictionary:dict] doubleValue];
            self.characterId = [self objectOrNilForKey:kGRDCharacterBaseCharacterId fromDictionary:dict];
            self.membershipId = [self objectOrNilForKey:kGRDCharacterBaseMembershipId fromDictionary:dict];
            self.peerView = [GRDPeerView modelObjectWithDictionary:[dict objectForKey:kGRDCharacterBasePeerView]];
            self.lastCompletedStoryHash = [[self objectOrNilForKey:kGRDCharacterBaseLastCompletedStoryHash fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.genderHash] forKey:kGRDCharacterBaseGenderHash];
    [mutableDict setValue:self.minutesPlayedTotal forKey:kGRDCharacterBaseMinutesPlayedTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.buildStatGroupHash] forKey:kGRDCharacterBaseBuildStatGroupHash];
    [mutableDict setValue:[self.stats dictionaryRepresentation] forKey:kGRDCharacterBaseStats];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentActivityHash] forKey:kGRDCharacterBaseCurrentActivityHash];
    [mutableDict setValue:self.minutesPlayedThisSession forKey:kGRDCharacterBaseMinutesPlayedThisSession];
    [mutableDict setValue:[NSNumber numberWithDouble:self.grimoireScore] forKey:kGRDCharacterBaseGrimoireScore];
    [mutableDict setValue:[self.customization dictionaryRepresentation] forKey:kGRDCharacterBaseCustomization];
    [mutableDict setValue:[NSNumber numberWithDouble:self.genderType] forKey:kGRDCharacterBaseGenderType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.raceType] forKey:kGRDCharacterBaseRaceType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.membershipType] forKey:kGRDCharacterBaseMembershipType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.classHash] forKey:kGRDCharacterBaseClassHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.classType] forKey:kGRDCharacterBaseClassType];
    [mutableDict setValue:self.dateLastPlayed forKey:kGRDCharacterBaseDateLastPlayed];
    [mutableDict setValue:[NSNumber numberWithDouble:self.powerLevel] forKey:kGRDCharacterBasePowerLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.raceHash] forKey:kGRDCharacterBaseRaceHash];
    [mutableDict setValue:self.characterId forKey:kGRDCharacterBaseCharacterId];
    [mutableDict setValue:self.membershipId forKey:kGRDCharacterBaseMembershipId];
    [mutableDict setValue:[self.peerView dictionaryRepresentation] forKey:kGRDCharacterBasePeerView];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastCompletedStoryHash] forKey:kGRDCharacterBaseLastCompletedStoryHash];

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

    self.genderHash = [aDecoder decodeDoubleForKey:kGRDCharacterBaseGenderHash];
    self.minutesPlayedTotal = [aDecoder decodeObjectForKey:kGRDCharacterBaseMinutesPlayedTotal];
    self.buildStatGroupHash = [aDecoder decodeDoubleForKey:kGRDCharacterBaseBuildStatGroupHash];
    self.stats = [aDecoder decodeObjectForKey:kGRDCharacterBaseStats];
    self.currentActivityHash = [aDecoder decodeDoubleForKey:kGRDCharacterBaseCurrentActivityHash];
    self.minutesPlayedThisSession = [aDecoder decodeObjectForKey:kGRDCharacterBaseMinutesPlayedThisSession];
    self.grimoireScore = [aDecoder decodeDoubleForKey:kGRDCharacterBaseGrimoireScore];
    self.customization = [aDecoder decodeObjectForKey:kGRDCharacterBaseCustomization];
    self.genderType = [aDecoder decodeDoubleForKey:kGRDCharacterBaseGenderType];
    self.raceType = [aDecoder decodeDoubleForKey:kGRDCharacterBaseRaceType];
    self.membershipType = [aDecoder decodeDoubleForKey:kGRDCharacterBaseMembershipType];
    self.classHash = [aDecoder decodeDoubleForKey:kGRDCharacterBaseClassHash];
    self.classType = [aDecoder decodeDoubleForKey:kGRDCharacterBaseClassType];
    self.dateLastPlayed = [aDecoder decodeObjectForKey:kGRDCharacterBaseDateLastPlayed];
    self.powerLevel = [aDecoder decodeDoubleForKey:kGRDCharacterBasePowerLevel];
    self.raceHash = [aDecoder decodeDoubleForKey:kGRDCharacterBaseRaceHash];
    self.characterId = [aDecoder decodeObjectForKey:kGRDCharacterBaseCharacterId];
    self.membershipId = [aDecoder decodeObjectForKey:kGRDCharacterBaseMembershipId];
    self.peerView = [aDecoder decodeObjectForKey:kGRDCharacterBasePeerView];
    self.lastCompletedStoryHash = [aDecoder decodeDoubleForKey:kGRDCharacterBaseLastCompletedStoryHash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_genderHash forKey:kGRDCharacterBaseGenderHash];
    [aCoder encodeObject:_minutesPlayedTotal forKey:kGRDCharacterBaseMinutesPlayedTotal];
    [aCoder encodeDouble:_buildStatGroupHash forKey:kGRDCharacterBaseBuildStatGroupHash];
    [aCoder encodeObject:_stats forKey:kGRDCharacterBaseStats];
    [aCoder encodeDouble:_currentActivityHash forKey:kGRDCharacterBaseCurrentActivityHash];
    [aCoder encodeObject:_minutesPlayedThisSession forKey:kGRDCharacterBaseMinutesPlayedThisSession];
    [aCoder encodeDouble:_grimoireScore forKey:kGRDCharacterBaseGrimoireScore];
    [aCoder encodeObject:_customization forKey:kGRDCharacterBaseCustomization];
    [aCoder encodeDouble:_genderType forKey:kGRDCharacterBaseGenderType];
    [aCoder encodeDouble:_raceType forKey:kGRDCharacterBaseRaceType];
    [aCoder encodeDouble:_membershipType forKey:kGRDCharacterBaseMembershipType];
    [aCoder encodeDouble:_classHash forKey:kGRDCharacterBaseClassHash];
    [aCoder encodeDouble:_classType forKey:kGRDCharacterBaseClassType];
    [aCoder encodeObject:_dateLastPlayed forKey:kGRDCharacterBaseDateLastPlayed];
    [aCoder encodeDouble:_powerLevel forKey:kGRDCharacterBasePowerLevel];
    [aCoder encodeDouble:_raceHash forKey:kGRDCharacterBaseRaceHash];
    [aCoder encodeObject:_characterId forKey:kGRDCharacterBaseCharacterId];
    [aCoder encodeObject:_membershipId forKey:kGRDCharacterBaseMembershipId];
    [aCoder encodeObject:_peerView forKey:kGRDCharacterBasePeerView];
    [aCoder encodeDouble:_lastCompletedStoryHash forKey:kGRDCharacterBaseLastCompletedStoryHash];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDCharacterBase *copy = [[GRDCharacterBase alloc] init];
    
    if (copy) {

        copy.genderHash = self.genderHash;
        copy.minutesPlayedTotal = [self.minutesPlayedTotal copyWithZone:zone];
        copy.buildStatGroupHash = self.buildStatGroupHash;
        copy.stats = [self.stats copyWithZone:zone];
        copy.currentActivityHash = self.currentActivityHash;
        copy.minutesPlayedThisSession = [self.minutesPlayedThisSession copyWithZone:zone];
        copy.grimoireScore = self.grimoireScore;
        copy.customization = [self.customization copyWithZone:zone];
        copy.genderType = self.genderType;
        copy.membershipType = self.membershipType;
        copy.classHash = self.classHash;
        copy.classType = self.classType;
        copy.raceType = self.raceType;
        copy.dateLastPlayed = [self.dateLastPlayed copyWithZone:zone];
        copy.powerLevel = self.powerLevel;
        copy.raceHash = self.raceHash;
        copy.characterId = [self.characterId copyWithZone:zone];
        copy.membershipId = [self.membershipId copyWithZone:zone];
        copy.peerView = [self.peerView copyWithZone:zone];
        copy.lastCompletedStoryHash = self.lastCompletedStoryHash;
    }
    
    return copy;
}


@end

//
//  Values.m
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "Values.h"
#import "ActivityDurationSeconds.h"
#import "Deaths.h"
#import "StartSeconds.h"
#import "Kills.h"
#import "CompletionReason.h"
#import "TeamScore.h"
#import "KillsDeathsRatio.h"
#import "ACTHCompleted.h"
#import "Team.h"
#import "Efficiency.h"
#import "KillsDeathsAssists.h"
#import "FireteamId.h"
#import "PlayerCount.h"
#import "Assists.h"
#import "TimePlayedSeconds.h"
#import "Score.h"
#import "OpponentsDefeated.h"


NSString *const kValuesActivityDurationSeconds = @"activityDurationSeconds";
NSString *const kValuesDeaths = @"deaths";
NSString *const kValuesStartSeconds = @"startSeconds";
NSString *const kValuesKills = @"kills";
NSString *const kValuesCompletionReason = @"completionReason";
NSString *const kValuesTeamScore = @"teamScore";
NSString *const kValuesKillsDeathsRatio = @"killsDeathsRatio";
NSString *const kValuesCompleted = @"completed";
NSString *const kValuesTeam = @"team";
NSString *const kValuesEfficiency = @"efficiency";
NSString *const kValuesKillsDeathsAssists = @"killsDeathsAssists";
NSString *const kValuesFireteamId = @"fireteamId";
NSString *const kValuesPlayerCount = @"playerCount";
NSString *const kValuesAssists = @"assists";
NSString *const kValuesTimePlayedSeconds = @"timePlayedSeconds";
NSString *const kValuesScore = @"score";
NSString *const kValuesOpponentsDefeated = @"opponentsDefeated";


@interface Values ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Values

@synthesize activityDurationSeconds = _activityDurationSeconds;
@synthesize deaths = _deaths;
@synthesize startSeconds = _startSeconds;
@synthesize kills = _kills;
@synthesize completionReason = _completionReason;
@synthesize teamScore = _teamScore;
@synthesize killsDeathsRatio = _killsDeathsRatio;
@synthesize completed = _completed;
@synthesize team = _team;
@synthesize efficiency = _efficiency;
@synthesize killsDeathsAssists = _killsDeathsAssists;
@synthesize fireteamId = _fireteamId;
@synthesize playerCount = _playerCount;
@synthesize assists = _assists;
@synthesize timePlayedSeconds = _timePlayedSeconds;
@synthesize score = _score;
@synthesize opponentsDefeated = _opponentsDefeated;


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
            self.activityDurationSeconds = [ActivityDurationSeconds modelObjectWithDictionary:[dict objectForKey:kValuesActivityDurationSeconds]];
            self.deaths = [Deaths modelObjectWithDictionary:[dict objectForKey:kValuesDeaths]];
            self.startSeconds = [StartSeconds modelObjectWithDictionary:[dict objectForKey:kValuesStartSeconds]];
            self.kills = [Kills modelObjectWithDictionary:[dict objectForKey:kValuesKills]];
            self.completionReason = [CompletionReason modelObjectWithDictionary:[dict objectForKey:kValuesCompletionReason]];
            self.teamScore = [TeamScore modelObjectWithDictionary:[dict objectForKey:kValuesTeamScore]];
            self.killsDeathsRatio = [KillsDeathsRatio modelObjectWithDictionary:[dict objectForKey:kValuesKillsDeathsRatio]];
            self.completed = [ACTHCompleted modelObjectWithDictionary:[dict objectForKey:kValuesCompleted]];
            self.team = [Team modelObjectWithDictionary:[dict objectForKey:kValuesTeam]];
            self.efficiency = [Efficiency modelObjectWithDictionary:[dict objectForKey:kValuesEfficiency]];
            self.killsDeathsAssists = [KillsDeathsAssists modelObjectWithDictionary:[dict objectForKey:kValuesKillsDeathsAssists]];
            self.fireteamId = [FireteamId modelObjectWithDictionary:[dict objectForKey:kValuesFireteamId]];
            self.playerCount = [PlayerCount modelObjectWithDictionary:[dict objectForKey:kValuesPlayerCount]];
            self.assists = [Assists modelObjectWithDictionary:[dict objectForKey:kValuesAssists]];
            self.timePlayedSeconds = [TimePlayedSeconds modelObjectWithDictionary:[dict objectForKey:kValuesTimePlayedSeconds]];
            self.score = [Score modelObjectWithDictionary:[dict objectForKey:kValuesScore]];
            self.opponentsDefeated = [OpponentsDefeated modelObjectWithDictionary:[dict objectForKey:kValuesOpponentsDefeated]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.activityDurationSeconds dictionaryRepresentation] forKey:kValuesActivityDurationSeconds];
    [mutableDict setValue:[self.deaths dictionaryRepresentation] forKey:kValuesDeaths];
    [mutableDict setValue:[self.startSeconds dictionaryRepresentation] forKey:kValuesStartSeconds];
    [mutableDict setValue:[self.kills dictionaryRepresentation] forKey:kValuesKills];
    [mutableDict setValue:[self.completionReason dictionaryRepresentation] forKey:kValuesCompletionReason];
    [mutableDict setValue:[self.teamScore dictionaryRepresentation] forKey:kValuesTeamScore];
    [mutableDict setValue:[self.killsDeathsRatio dictionaryRepresentation] forKey:kValuesKillsDeathsRatio];
    [mutableDict setValue:[self.completed dictionaryRepresentation] forKey:kValuesCompleted];
    [mutableDict setValue:[self.team dictionaryRepresentation] forKey:kValuesTeam];
    [mutableDict setValue:[self.efficiency dictionaryRepresentation] forKey:kValuesEfficiency];
    [mutableDict setValue:[self.killsDeathsAssists dictionaryRepresentation] forKey:kValuesKillsDeathsAssists];
    [mutableDict setValue:[self.fireteamId dictionaryRepresentation] forKey:kValuesFireteamId];
    [mutableDict setValue:[self.playerCount dictionaryRepresentation] forKey:kValuesPlayerCount];
    [mutableDict setValue:[self.assists dictionaryRepresentation] forKey:kValuesAssists];
    [mutableDict setValue:[self.timePlayedSeconds dictionaryRepresentation] forKey:kValuesTimePlayedSeconds];
    [mutableDict setValue:[self.score dictionaryRepresentation] forKey:kValuesScore];
    [mutableDict setValue:[self.opponentsDefeated dictionaryRepresentation] forKey:kValuesOpponentsDefeated];

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

    self.activityDurationSeconds = [aDecoder decodeObjectForKey:kValuesActivityDurationSeconds];
    self.deaths = [aDecoder decodeObjectForKey:kValuesDeaths];
    self.startSeconds = [aDecoder decodeObjectForKey:kValuesStartSeconds];
    self.kills = [aDecoder decodeObjectForKey:kValuesKills];
    self.completionReason = [aDecoder decodeObjectForKey:kValuesCompletionReason];
    self.teamScore = [aDecoder decodeObjectForKey:kValuesTeamScore];
    self.killsDeathsRatio = [aDecoder decodeObjectForKey:kValuesKillsDeathsRatio];
    self.completed = [aDecoder decodeObjectForKey:kValuesCompleted];
    self.team = [aDecoder decodeObjectForKey:kValuesTeam];
    self.efficiency = [aDecoder decodeObjectForKey:kValuesEfficiency];
    self.killsDeathsAssists = [aDecoder decodeObjectForKey:kValuesKillsDeathsAssists];
    self.fireteamId = [aDecoder decodeObjectForKey:kValuesFireteamId];
    self.playerCount = [aDecoder decodeObjectForKey:kValuesPlayerCount];
    self.assists = [aDecoder decodeObjectForKey:kValuesAssists];
    self.timePlayedSeconds = [aDecoder decodeObjectForKey:kValuesTimePlayedSeconds];
    self.score = [aDecoder decodeObjectForKey:kValuesScore];
    self.opponentsDefeated = [aDecoder decodeObjectForKey:kValuesOpponentsDefeated];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_activityDurationSeconds forKey:kValuesActivityDurationSeconds];
    [aCoder encodeObject:_deaths forKey:kValuesDeaths];
    [aCoder encodeObject:_startSeconds forKey:kValuesStartSeconds];
    [aCoder encodeObject:_kills forKey:kValuesKills];
    [aCoder encodeObject:_completionReason forKey:kValuesCompletionReason];
    [aCoder encodeObject:_teamScore forKey:kValuesTeamScore];
    [aCoder encodeObject:_killsDeathsRatio forKey:kValuesKillsDeathsRatio];
    [aCoder encodeObject:_completed forKey:kValuesCompleted];
    [aCoder encodeObject:_team forKey:kValuesTeam];
    [aCoder encodeObject:_efficiency forKey:kValuesEfficiency];
    [aCoder encodeObject:_killsDeathsAssists forKey:kValuesKillsDeathsAssists];
    [aCoder encodeObject:_fireteamId forKey:kValuesFireteamId];
    [aCoder encodeObject:_playerCount forKey:kValuesPlayerCount];
    [aCoder encodeObject:_assists forKey:kValuesAssists];
    [aCoder encodeObject:_timePlayedSeconds forKey:kValuesTimePlayedSeconds];
    [aCoder encodeObject:_score forKey:kValuesScore];
    [aCoder encodeObject:_opponentsDefeated forKey:kValuesOpponentsDefeated];
}

- (id)copyWithZone:(NSZone *)zone
{
    Values *copy = [[Values alloc] init];
    
    if (copy) {

        copy.activityDurationSeconds = [self.activityDurationSeconds copyWithZone:zone];
        copy.deaths = [self.deaths copyWithZone:zone];
        copy.startSeconds = [self.startSeconds copyWithZone:zone];
        copy.kills = [self.kills copyWithZone:zone];
        copy.completionReason = [self.completionReason copyWithZone:zone];
        copy.teamScore = [self.teamScore copyWithZone:zone];
        copy.killsDeathsRatio = [self.killsDeathsRatio copyWithZone:zone];
        copy.completed = [self.completed copyWithZone:zone];
        copy.team = [self.team copyWithZone:zone];
        copy.efficiency = [self.efficiency copyWithZone:zone];
        copy.killsDeathsAssists = [self.killsDeathsAssists copyWithZone:zone];
        copy.fireteamId = [self.fireteamId copyWithZone:zone];
        copy.playerCount = [self.playerCount copyWithZone:zone];
        copy.assists = [self.assists copyWithZone:zone];
        copy.timePlayedSeconds = [self.timePlayedSeconds copyWithZone:zone];
        copy.score = [self.score copyWithZone:zone];
        copy.opponentsDefeated = [self.opponentsDefeated copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  Values.h
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ActivityDurationSeconds, Deaths, StartSeconds, Kills, CompletionReason, TeamScore, KillsDeathsRatio, ACTHCompleted, Team, Efficiency, KillsDeathsAssists, FireteamId, PlayerCount, Assists, TimePlayedSeconds, Score, OpponentsDefeated;

@interface Values : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ActivityDurationSeconds *activityDurationSeconds;
@property (nonatomic, strong) Deaths *deaths;
@property (nonatomic, strong) StartSeconds *startSeconds;
@property (nonatomic, strong) Kills *kills;
@property (nonatomic, strong) CompletionReason *completionReason;
@property (nonatomic, strong) TeamScore *teamScore;
@property (nonatomic, strong) KillsDeathsRatio *killsDeathsRatio;
@property (nonatomic, strong) ACTHCompleted *completed;
@property (nonatomic, strong) Team *team;
@property (nonatomic, strong) Efficiency *efficiency;
@property (nonatomic, strong) KillsDeathsAssists *killsDeathsAssists;
@property (nonatomic, strong) FireteamId *fireteamId;
@property (nonatomic, strong) PlayerCount *playerCount;
@property (nonatomic, strong) Assists *assists;
@property (nonatomic, strong) TimePlayedSeconds *timePlayedSeconds;
@property (nonatomic, strong) Score *score;
@property (nonatomic, strong) OpponentsDefeated *opponentsDefeated;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

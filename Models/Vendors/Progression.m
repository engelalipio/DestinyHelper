//
//  Progression.m
//
//  Created by Engel Alipio on 2/28/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "Progression.h"


NSString *const kProgressionProgressToNextLevel = @"progressToNextLevel";
NSString *const kProgressionDailyProgress = @"dailyProgress";
NSString *const kProgressionNextLevelAt = @"nextLevelAt";
NSString *const kProgressionStepIndex = @"stepIndex";
NSString *const kProgressionCurrentResetCount = @"currentResetCount";
NSString *const kProgressionLevel = @"level";
NSString *const kProgressionProgressionHash = @"progressionHash";
NSString *const kProgressionCurrentProgress = @"currentProgress";
NSString *const kProgressionLevelCap = @"levelCap";
NSString *const kProgressionDailyLimit = @"dailyLimit";
NSString *const kProgressionWeeklyLimit = @"weeklyLimit";
NSString *const kProgressionWeeklyProgress = @"weeklyProgress";


@interface Progression ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Progression

@synthesize progressToNextLevel = _progressToNextLevel;
@synthesize dailyProgress = _dailyProgress;
@synthesize nextLevelAt = _nextLevelAt;
@synthesize stepIndex = _stepIndex;
@synthesize currentResetCount = _currentResetCount;
@synthesize level = _level;
@synthesize progressionHash = _progressionHash;
@synthesize currentProgress = _currentProgress;
@synthesize levelCap = _levelCap;
@synthesize dailyLimit = _dailyLimit;
@synthesize weeklyLimit = _weeklyLimit;
@synthesize weeklyProgress = _weeklyProgress;


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
            self.progressToNextLevel = [[self objectOrNilForKey:kProgressionProgressToNextLevel fromDictionary:dict] doubleValue];
            self.dailyProgress = [[self objectOrNilForKey:kProgressionDailyProgress fromDictionary:dict] doubleValue];
            self.nextLevelAt = [[self objectOrNilForKey:kProgressionNextLevelAt fromDictionary:dict] doubleValue];
            self.stepIndex = [[self objectOrNilForKey:kProgressionStepIndex fromDictionary:dict] doubleValue];
            self.currentResetCount = [[self objectOrNilForKey:kProgressionCurrentResetCount fromDictionary:dict] doubleValue];
            self.level = [[self objectOrNilForKey:kProgressionLevel fromDictionary:dict] doubleValue];
            self.progressionHash = [[self objectOrNilForKey:kProgressionProgressionHash fromDictionary:dict] doubleValue];
            self.currentProgress = [[self objectOrNilForKey:kProgressionCurrentProgress fromDictionary:dict] doubleValue];
            self.levelCap = [[self objectOrNilForKey:kProgressionLevelCap fromDictionary:dict] doubleValue];
            self.dailyLimit = [[self objectOrNilForKey:kProgressionDailyLimit fromDictionary:dict] doubleValue];
            self.weeklyLimit = [[self objectOrNilForKey:kProgressionWeeklyLimit fromDictionary:dict] doubleValue];
            self.weeklyProgress = [[self objectOrNilForKey:kProgressionWeeklyProgress fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.progressToNextLevel] forKey:kProgressionProgressToNextLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dailyProgress] forKey:kProgressionDailyProgress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.nextLevelAt] forKey:kProgressionNextLevelAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stepIndex] forKey:kProgressionStepIndex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentResetCount] forKey:kProgressionCurrentResetCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kProgressionLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.progressionHash] forKey:kProgressionProgressionHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentProgress] forKey:kProgressionCurrentProgress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.levelCap] forKey:kProgressionLevelCap];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dailyLimit] forKey:kProgressionDailyLimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weeklyLimit] forKey:kProgressionWeeklyLimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weeklyProgress] forKey:kProgressionWeeklyProgress];

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

    self.progressToNextLevel = [aDecoder decodeDoubleForKey:kProgressionProgressToNextLevel];
    self.dailyProgress = [aDecoder decodeDoubleForKey:kProgressionDailyProgress];
    self.nextLevelAt = [aDecoder decodeDoubleForKey:kProgressionNextLevelAt];
    self.stepIndex = [aDecoder decodeDoubleForKey:kProgressionStepIndex];
    self.currentResetCount = [aDecoder decodeDoubleForKey:kProgressionCurrentResetCount];
    self.level = [aDecoder decodeDoubleForKey:kProgressionLevel];
    self.progressionHash = [aDecoder decodeDoubleForKey:kProgressionProgressionHash];
    self.currentProgress = [aDecoder decodeDoubleForKey:kProgressionCurrentProgress];
    self.levelCap = [aDecoder decodeDoubleForKey:kProgressionLevelCap];
    self.dailyLimit = [aDecoder decodeDoubleForKey:kProgressionDailyLimit];
    self.weeklyLimit = [aDecoder decodeDoubleForKey:kProgressionWeeklyLimit];
    self.weeklyProgress = [aDecoder decodeDoubleForKey:kProgressionWeeklyProgress];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_progressToNextLevel forKey:kProgressionProgressToNextLevel];
    [aCoder encodeDouble:_dailyProgress forKey:kProgressionDailyProgress];
    [aCoder encodeDouble:_nextLevelAt forKey:kProgressionNextLevelAt];
    [aCoder encodeDouble:_stepIndex forKey:kProgressionStepIndex];
    [aCoder encodeDouble:_currentResetCount forKey:kProgressionCurrentResetCount];
    [aCoder encodeDouble:_level forKey:kProgressionLevel];
    [aCoder encodeDouble:_progressionHash forKey:kProgressionProgressionHash];
    [aCoder encodeDouble:_currentProgress forKey:kProgressionCurrentProgress];
    [aCoder encodeDouble:_levelCap forKey:kProgressionLevelCap];
    [aCoder encodeDouble:_dailyLimit forKey:kProgressionDailyLimit];
    [aCoder encodeDouble:_weeklyLimit forKey:kProgressionWeeklyLimit];
    [aCoder encodeDouble:_weeklyProgress forKey:kProgressionWeeklyProgress];
}

- (id)copyWithZone:(NSZone *)zone
{
    Progression *copy = [[Progression alloc] init];
    
    if (copy) {

        copy.progressToNextLevel = self.progressToNextLevel;
        copy.dailyProgress = self.dailyProgress;
        copy.nextLevelAt = self.nextLevelAt;
        copy.stepIndex = self.stepIndex;
        copy.currentResetCount = self.currentResetCount;
        copy.level = self.level;
        copy.progressionHash = self.progressionHash;
        copy.currentProgress = self.currentProgress;
        copy.levelCap = self.levelCap;
        copy.dailyLimit = self.dailyLimit;
        copy.weeklyLimit = self.weeklyLimit;
        copy.weeklyProgress = self.weeklyProgress;
    }
    
    return copy;
}


@end

//
//  ProgressionHashKey.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "ProgressionHashKey.h"


NSString *const kProgressionHashKeyNextLevelAt = @"nextLevelAt";
NSString *const kProgressionHashKeyProgressToNextLevel = @"progressToNextLevel";
NSString *const kProgressionHashKeyProgressionHash = @"progressionHash";
NSString *const kProgressionHashKeyWeeklyLimit = @"weeklyLimit";
NSString *const kProgressionHashKeyStepIndex = @"stepIndex";
NSString *const kProgressionHashKeyLevel = @"level";
NSString *const kProgressionHashKeyWeeklyProgress = @"weeklyProgress";
NSString *const kProgressionHashKeyDailyLimit = @"dailyLimit";
NSString *const kProgressionHashKeyDailyProgress = @"dailyProgress";
NSString *const kProgressionHashKeyCurrentProgress = @"currentProgress";
NSString *const kProgressionHashKeyLevelCap = @"levelCap";


@interface ProgressionHashKey ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProgressionHashKey

@synthesize nextLevelAt = _nextLevelAt;
@synthesize progressToNextLevel = _progressToNextLevel;
@synthesize progressionHash = _progressionHash;
@synthesize weeklyLimit = _weeklyLimit;
@synthesize stepIndex = _stepIndex;
@synthesize level = _level;
@synthesize weeklyProgress = _weeklyProgress;
@synthesize dailyLimit = _dailyLimit;
@synthesize dailyProgress = _dailyProgress;
@synthesize currentProgress = _currentProgress;
@synthesize levelCap = _levelCap;


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
            self.nextLevelAt = [[self objectOrNilForKey:kProgressionHashKeyNextLevelAt fromDictionary:dict] doubleValue];
            self.progressToNextLevel = [[self objectOrNilForKey:kProgressionHashKeyProgressToNextLevel fromDictionary:dict] doubleValue];
            self.progressionHash = [[self objectOrNilForKey:kProgressionHashKeyProgressionHash fromDictionary:dict] doubleValue];
            self.weeklyLimit = [[self objectOrNilForKey:kProgressionHashKeyWeeklyLimit fromDictionary:dict] doubleValue];
            self.stepIndex = [[self objectOrNilForKey:kProgressionHashKeyStepIndex fromDictionary:dict] doubleValue];
            self.level = [[self objectOrNilForKey:kProgressionHashKeyLevel fromDictionary:dict] doubleValue];
            self.weeklyProgress = [[self objectOrNilForKey:kProgressionHashKeyWeeklyProgress fromDictionary:dict] doubleValue];
            self.dailyLimit = [[self objectOrNilForKey:kProgressionHashKeyDailyLimit fromDictionary:dict] doubleValue];
            self.dailyProgress = [[self objectOrNilForKey:kProgressionHashKeyDailyProgress fromDictionary:dict] doubleValue];
            self.currentProgress = [[self objectOrNilForKey:kProgressionHashKeyCurrentProgress fromDictionary:dict] doubleValue];
            self.levelCap = [[self objectOrNilForKey:kProgressionHashKeyLevelCap fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.nextLevelAt] forKey:kProgressionHashKeyNextLevelAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.progressToNextLevel] forKey:kProgressionHashKeyProgressToNextLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.progressionHash] forKey:kProgressionHashKeyProgressionHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weeklyLimit] forKey:kProgressionHashKeyWeeklyLimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.stepIndex] forKey:kProgressionHashKeyStepIndex];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kProgressionHashKeyLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weeklyProgress] forKey:kProgressionHashKeyWeeklyProgress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dailyLimit] forKey:kProgressionHashKeyDailyLimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dailyProgress] forKey:kProgressionHashKeyDailyProgress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentProgress] forKey:kProgressionHashKeyCurrentProgress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.levelCap] forKey:kProgressionHashKeyLevelCap];

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

    self.nextLevelAt = [aDecoder decodeDoubleForKey:kProgressionHashKeyNextLevelAt];
    self.progressToNextLevel = [aDecoder decodeDoubleForKey:kProgressionHashKeyProgressToNextLevel];
    self.progressionHash = [aDecoder decodeDoubleForKey:kProgressionHashKeyProgressionHash];
    self.weeklyLimit = [aDecoder decodeDoubleForKey:kProgressionHashKeyWeeklyLimit];
    self.stepIndex = [aDecoder decodeDoubleForKey:kProgressionHashKeyStepIndex];
    self.level = [aDecoder decodeDoubleForKey:kProgressionHashKeyLevel];
    self.weeklyProgress = [aDecoder decodeDoubleForKey:kProgressionHashKeyWeeklyProgress];
    self.dailyLimit = [aDecoder decodeDoubleForKey:kProgressionHashKeyDailyLimit];
    self.dailyProgress = [aDecoder decodeDoubleForKey:kProgressionHashKeyDailyProgress];
    self.currentProgress = [aDecoder decodeDoubleForKey:kProgressionHashKeyCurrentProgress];
    self.levelCap = [aDecoder decodeDoubleForKey:kProgressionHashKeyLevelCap];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_nextLevelAt forKey:kProgressionHashKeyNextLevelAt];
    [aCoder encodeDouble:_progressToNextLevel forKey:kProgressionHashKeyProgressToNextLevel];
    [aCoder encodeDouble:_progressionHash forKey:kProgressionHashKeyProgressionHash];
    [aCoder encodeDouble:_weeklyLimit forKey:kProgressionHashKeyWeeklyLimit];
    [aCoder encodeDouble:_stepIndex forKey:kProgressionHashKeyStepIndex];
    [aCoder encodeDouble:_level forKey:kProgressionHashKeyLevel];
    [aCoder encodeDouble:_weeklyProgress forKey:kProgressionHashKeyWeeklyProgress];
    [aCoder encodeDouble:_dailyLimit forKey:kProgressionHashKeyDailyLimit];
    [aCoder encodeDouble:_dailyProgress forKey:kProgressionHashKeyDailyProgress];
    [aCoder encodeDouble:_currentProgress forKey:kProgressionHashKeyCurrentProgress];
    [aCoder encodeDouble:_levelCap forKey:kProgressionHashKeyLevelCap];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProgressionHashKey *copy = [[ProgressionHashKey alloc] init];
    
    if (copy) {

        copy.nextLevelAt = self.nextLevelAt;
        copy.progressToNextLevel = self.progressToNextLevel;
        copy.progressionHash = self.progressionHash;
        copy.weeklyLimit = self.weeklyLimit;
        copy.stepIndex = self.stepIndex;
        copy.level = self.level;
        copy.weeklyProgress = self.weeklyProgress;
        copy.dailyLimit = self.dailyLimit;
        copy.dailyProgress = self.dailyProgress;
        copy.currentProgress = self.currentProgress;
        copy.levelCap = self.levelCap;
    }
    
    return copy;
}


@end

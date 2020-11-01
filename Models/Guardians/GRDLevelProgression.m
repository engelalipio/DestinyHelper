//
//  GRDLevelProgression.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDLevelProgression.h"


NSString *const kGRDLevelProgressionNextLevelAt = @"nextLevelAt";
NSString *const kGRDLevelProgressionProgressToNextLevel = @"progressToNextLevel";
NSString *const kGRDLevelProgressionProgressionHash = @"progressionHash";
NSString *const kGRDLevelProgressionWeeklyProgress = @"weeklyProgress";
NSString *const kGRDLevelProgressionLevel = @"level";
NSString *const kGRDLevelProgressionCurrentProgress = @"currentProgress";
NSString *const kGRDLevelProgressionStep = @"step";
NSString *const kGRDLevelProgressionDailyProgress = @"dailyProgress";


@interface GRDLevelProgression ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDLevelProgression

@synthesize nextLevelAt = _nextLevelAt;
@synthesize progressToNextLevel = _progressToNextLevel;
@synthesize progressionHash = _progressionHash;
@synthesize weeklyProgress = _weeklyProgress;
@synthesize level = _level;
@synthesize currentProgress = _currentProgress;
@synthesize step = _step;
@synthesize dailyProgress = _dailyProgress;


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
            self.nextLevelAt = [[self objectOrNilForKey:kGRDLevelProgressionNextLevelAt fromDictionary:dict] doubleValue];
            self.progressToNextLevel = [[self objectOrNilForKey:kGRDLevelProgressionProgressToNextLevel fromDictionary:dict] doubleValue];
            self.progressionHash = [[self objectOrNilForKey:kGRDLevelProgressionProgressionHash fromDictionary:dict] doubleValue];
            self.weeklyProgress = [[self objectOrNilForKey:kGRDLevelProgressionWeeklyProgress fromDictionary:dict] doubleValue];
            self.level = [[self objectOrNilForKey:kGRDLevelProgressionLevel fromDictionary:dict] doubleValue];
            self.currentProgress = [[self objectOrNilForKey:kGRDLevelProgressionCurrentProgress fromDictionary:dict] doubleValue];
            self.step = [[self objectOrNilForKey:kGRDLevelProgressionStep fromDictionary:dict] doubleValue];
            self.dailyProgress = [[self objectOrNilForKey:kGRDLevelProgressionDailyProgress fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.nextLevelAt] forKey:kGRDLevelProgressionNextLevelAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.progressToNextLevel] forKey:kGRDLevelProgressionProgressToNextLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.progressionHash] forKey:kGRDLevelProgressionProgressionHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weeklyProgress] forKey:kGRDLevelProgressionWeeklyProgress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kGRDLevelProgressionLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.currentProgress] forKey:kGRDLevelProgressionCurrentProgress];
    [mutableDict setValue:[NSNumber numberWithDouble:self.step] forKey:kGRDLevelProgressionStep];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dailyProgress] forKey:kGRDLevelProgressionDailyProgress];

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

    self.nextLevelAt = [aDecoder decodeDoubleForKey:kGRDLevelProgressionNextLevelAt];
    self.progressToNextLevel = [aDecoder decodeDoubleForKey:kGRDLevelProgressionProgressToNextLevel];
    self.progressionHash = [aDecoder decodeDoubleForKey:kGRDLevelProgressionProgressionHash];
    self.weeklyProgress = [aDecoder decodeDoubleForKey:kGRDLevelProgressionWeeklyProgress];
    self.level = [aDecoder decodeDoubleForKey:kGRDLevelProgressionLevel];
    self.currentProgress = [aDecoder decodeDoubleForKey:kGRDLevelProgressionCurrentProgress];
    self.step = [aDecoder decodeDoubleForKey:kGRDLevelProgressionStep];
    self.dailyProgress = [aDecoder decodeDoubleForKey:kGRDLevelProgressionDailyProgress];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_nextLevelAt forKey:kGRDLevelProgressionNextLevelAt];
    [aCoder encodeDouble:_progressToNextLevel forKey:kGRDLevelProgressionProgressToNextLevel];
    [aCoder encodeDouble:_progressionHash forKey:kGRDLevelProgressionProgressionHash];
    [aCoder encodeDouble:_weeklyProgress forKey:kGRDLevelProgressionWeeklyProgress];
    [aCoder encodeDouble:_level forKey:kGRDLevelProgressionLevel];
    [aCoder encodeDouble:_currentProgress forKey:kGRDLevelProgressionCurrentProgress];
    [aCoder encodeDouble:_step forKey:kGRDLevelProgressionStep];
    [aCoder encodeDouble:_dailyProgress forKey:kGRDLevelProgressionDailyProgress];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDLevelProgression *copy = [[GRDLevelProgression alloc] init];
    
    if (copy) {

        copy.nextLevelAt = self.nextLevelAt;
        copy.progressToNextLevel = self.progressToNextLevel;
        copy.progressionHash = self.progressionHash;
        copy.weeklyProgress = self.weeklyProgress;
        copy.level = self.level;
        copy.currentProgress = self.currentProgress;
        copy.step = self.step;
        copy.dailyProgress = self.dailyProgress;
    }
    
    return copy;
}


@end

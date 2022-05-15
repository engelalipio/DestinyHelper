//
//  PlayerCount.m
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "PlayerCount.h"
#import "ACTHBasic.h"


NSString *const kPlayerCountBasic = @"basic";
NSString *const kPlayerCountStatId = @"statId";


@interface PlayerCount ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PlayerCount

@synthesize basic = _basic;
@synthesize statId = _statId;


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
            self.basic = [ACTHBasic modelObjectWithDictionary:[dict objectForKey:kPlayerCountBasic]];
            self.statId = [self objectOrNilForKey:kPlayerCountStatId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kPlayerCountBasic];
    [mutableDict setValue:self.statId forKey:kPlayerCountStatId];

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

    self.basic = [aDecoder decodeObjectForKey:kPlayerCountBasic];
    self.statId = [aDecoder decodeObjectForKey:kPlayerCountStatId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_basic forKey:kPlayerCountBasic];
    [aCoder encodeObject:_statId forKey:kPlayerCountStatId];
}

- (id)copyWithZone:(NSZone *)zone
{
    PlayerCount *copy = [[PlayerCount alloc] init];
    
    if (copy) {

        copy.basic = [self.basic copyWithZone:zone];
        copy.statId = [self.statId copyWithZone:zone];
    }
    
    return copy;
}


@end

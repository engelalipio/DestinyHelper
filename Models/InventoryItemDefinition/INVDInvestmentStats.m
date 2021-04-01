//
//  INVDInvestmentStats.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVDInvestmentStats.h"


NSString *const kInvestmentStatsStatTypeHash = @"statTypeHash";
NSString *const kInvestmentStatsIsConditionallyActive = @"isConditionallyActive";
NSString *const kInvestmentStatsValue = @"value";


@interface INVDInvestmentStats ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVDInvestmentStats

@synthesize statTypeHash = _statTypeHash;
@synthesize isConditionallyActive = _isConditionallyActive;
@synthesize value = _value;


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
            self.statTypeHash = [[self objectOrNilForKey:kInvestmentStatsStatTypeHash fromDictionary:dict] doubleValue];
            self.isConditionallyActive = [[self objectOrNilForKey:kInvestmentStatsIsConditionallyActive fromDictionary:dict] boolValue];
            self.value = [[self objectOrNilForKey:kInvestmentStatsValue fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statTypeHash] forKey:kInvestmentStatsStatTypeHash];
    [mutableDict setValue:[NSNumber numberWithBool:self.isConditionallyActive] forKey:kInvestmentStatsIsConditionallyActive];
    [mutableDict setValue:[NSNumber numberWithDouble:self.value] forKey:kInvestmentStatsValue];

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

    self.statTypeHash = [aDecoder decodeDoubleForKey:kInvestmentStatsStatTypeHash];
    self.isConditionallyActive = [aDecoder decodeBoolForKey:kInvestmentStatsIsConditionallyActive];
    self.value = [aDecoder decodeDoubleForKey:kInvestmentStatsValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_statTypeHash forKey:kInvestmentStatsStatTypeHash];
    [aCoder encodeBool:_isConditionallyActive forKey:kInvestmentStatsIsConditionallyActive];
    [aCoder encodeDouble:_value forKey:kInvestmentStatsValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVDInvestmentStats *copy = [[INVDInvestmentStats alloc] init];
    
    if (copy) {

        copy.statTypeHash = self.statTypeHash;
        copy.isConditionallyActive = self.isConditionallyActive;
        copy.value = self.value;
    }
    
    return copy;
}


@end

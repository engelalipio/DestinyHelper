//
//  Assists.m
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "Assists.h"
#import "ACTHBasic.h"


NSString *const kAssistsBasic = @"basic";
NSString *const kAssistsStatId = @"statId";


@interface Assists ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Assists

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
            self.basic = [ACTHBasic modelObjectWithDictionary:[dict objectForKey:kAssistsBasic]];
            self.statId = [self objectOrNilForKey:kAssistsStatId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kAssistsBasic];
    [mutableDict setValue:self.statId forKey:kAssistsStatId];

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

    self.basic = [aDecoder decodeObjectForKey:kAssistsBasic];
    self.statId = [aDecoder decodeObjectForKey:kAssistsStatId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_basic forKey:kAssistsBasic];
    [aCoder encodeObject:_statId forKey:kAssistsStatId];
}

- (id)copyWithZone:(NSZone *)zone
{
    Assists *copy = [[Assists alloc] init];
    
    if (copy) {

        copy.basic = [self.basic copyWithZone:zone];
        copy.statId = [self.statId copyWithZone:zone];
    }
    
    return copy;
}


@end

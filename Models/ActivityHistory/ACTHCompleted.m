//
//  Completed.m
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "ACTHCompleted.h"
#import "ACTHBasic.h"


NSString *const kCompletedBasic = @"basic";
NSString *const kCompletedStatId = @"statId";


@interface ACTHCompleted ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ACTHCompleted

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
            self.basic = [ACTHBasic modelObjectWithDictionary:[dict objectForKey:kCompletedBasic]];
            self.statId = [self objectOrNilForKey:kCompletedStatId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kCompletedBasic];
    [mutableDict setValue:self.statId forKey:kCompletedStatId];

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

    self.basic = [aDecoder decodeObjectForKey:kCompletedBasic];
    self.statId = [aDecoder decodeObjectForKey:kCompletedStatId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_basic forKey:kCompletedBasic];
    [aCoder encodeObject:_statId forKey:kCompletedStatId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ACTHCompleted *copy = [[ACTHCompleted alloc] init];
    
    if (copy) {

        copy.basic = [self.basic copyWithZone:zone];
        copy.statId = [self.statId copyWithZone:zone];
    }
    
    return copy;
}


@end

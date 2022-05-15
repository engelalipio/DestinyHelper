//
//  Activities.m
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "Activities.h"
#import "ActivityDetails.h"
#import "Values.h"


NSString *const kActivitiesPeriod = @"period";
NSString *const kActivitiesActivityDetails = @"activityDetails";
NSString *const kActivitiesValues = @"values";


@interface Activities ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Activities

@synthesize period = _period;
@synthesize activityDetails = _activityDetails;
@synthesize values = _values;


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
            self.period = [self objectOrNilForKey:kActivitiesPeriod fromDictionary:dict];
            self.activityDetails = [ActivityDetails modelObjectWithDictionary:[dict objectForKey:kActivitiesActivityDetails]];
            self.values = [Values modelObjectWithDictionary:[dict objectForKey:kActivitiesValues]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.period forKey:kActivitiesPeriod];
    [mutableDict setValue:[self.activityDetails dictionaryRepresentation] forKey:kActivitiesActivityDetails];
    [mutableDict setValue:[self.values dictionaryRepresentation] forKey:kActivitiesValues];

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

    self.period = [aDecoder decodeObjectForKey:kActivitiesPeriod];
    self.activityDetails = [aDecoder decodeObjectForKey:kActivitiesActivityDetails];
    self.values = [aDecoder decodeObjectForKey:kActivitiesValues];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_period forKey:kActivitiesPeriod];
    [aCoder encodeObject:_activityDetails forKey:kActivitiesActivityDetails];
    [aCoder encodeObject:_values forKey:kActivitiesValues];
}

- (id)copyWithZone:(NSZone *)zone
{
    Activities *copy = [[Activities alloc] init];
    
    if (copy) {

        copy.period = [self.period copyWithZone:zone];
        copy.activityDetails = [self.activityDetails copyWithZone:zone];
        copy.values = [self.values copyWithZone:zone];
    }
    
    return copy;
}


@end

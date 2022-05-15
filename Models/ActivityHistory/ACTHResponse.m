//
//  ACTHResponse.m
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "ACTHResponse.h"
#import "Activities.h"


NSString *const kResponseActivities = @"activities";


@interface ACTHResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ACTHResponse

@synthesize activities = _activities;


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
    NSObject *receivedActivities = [dict objectForKey:kResponseActivities];
    NSMutableArray *parsedActivities = [NSMutableArray array];
    if ([receivedActivities isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedActivities) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedActivities addObject:[Activities modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedActivities isKindOfClass:[NSDictionary class]]) {
       [parsedActivities addObject:[Activities modelObjectWithDictionary:(NSDictionary *)receivedActivities]];
    }

    self.activities = [NSArray arrayWithArray:parsedActivities];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForActivities = [NSMutableArray array];
    for (NSObject *subArrayObject in self.activities) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForActivities addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForActivities addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForActivities] forKey:kResponseActivities];

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

    self.activities = [aDecoder decodeObjectForKey:kResponseActivities];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_activities forKey:kResponseActivities];
}

- (id)copyWithZone:(NSZone *)zone
{
    ACTHResponse *copy = [[ACTHResponse alloc] init];
    
    if (copy) {

        copy.activities = [self.activities copyWithZone:zone];
    }
    
    return copy;
}


@end

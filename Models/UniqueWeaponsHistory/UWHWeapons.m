//
//  UWHWeapons.m
//
//  Created by Engel Alipio on 5/15/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "UWHWeapons.h"
#import "UWHValues.h"


NSString *const kWeaponsValues = @"values";
NSString *const kWeaponsReferenceId = @"referenceId";


@interface UWHWeapons ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UWHWeapons

@synthesize values = _values;
@synthesize referenceId = _referenceId;


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
            self.values = [UWHValues modelObjectWithDictionary:[dict objectForKey:kWeaponsValues]];
            self.referenceId = [[self objectOrNilForKey:kWeaponsReferenceId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.values dictionaryRepresentation] forKey:kWeaponsValues];
    [mutableDict setValue:[NSNumber numberWithDouble:self.referenceId] forKey:kWeaponsReferenceId];

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

    self.values = [aDecoder decodeObjectForKey:kWeaponsValues];
    self.referenceId = [aDecoder decodeDoubleForKey:kWeaponsReferenceId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_values forKey:kWeaponsValues];
    [aCoder encodeDouble:_referenceId forKey:kWeaponsReferenceId];
}

- (id)copyWithZone:(NSZone *)zone
{
    UWHWeapons *copy = [[UWHWeapons alloc] init];
    
    if (copy) {

        copy.values = [self.values copyWithZone:zone];
        copy.referenceId = self.referenceId;
    }
    
    return copy;
}


@end

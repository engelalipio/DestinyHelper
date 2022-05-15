//
//  UWHValues.m
//
//  Created by Engel Alipio on 5/15/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "UWHValues.h"
#import "UniqueWeaponKills.h"
#import "UniqueWeaponPrecisionKills.h"
#import "UniqueWeaponAssists.h"
#import "UniqueWeaponAssistDamage.h"
#import "UniqueWeaponKillsPrecisionKills.h"


NSString *const kValuesUniqueWeaponKills = @"uniqueWeaponKills";
NSString *const kValuesUniqueWeaponPrecisionKills = @"uniqueWeaponPrecisionKills";
NSString *const kValuesUniqueWeaponAssists = @"uniqueWeaponAssists";
NSString *const kValuesUniqueWeaponAssistDamage = @"uniqueWeaponAssistDamage";
NSString *const kValuesUniqueWeaponKillsPrecisionKills = @"uniqueWeaponKillsPrecisionKills";


@interface UWHValues ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UWHValues

@synthesize uniqueWeaponKills = _uniqueWeaponKills;
@synthesize uniqueWeaponPrecisionKills = _uniqueWeaponPrecisionKills;
@synthesize uniqueWeaponAssists = _uniqueWeaponAssists;
@synthesize uniqueWeaponAssistDamage = _uniqueWeaponAssistDamage;
@synthesize uniqueWeaponKillsPrecisionKills = _uniqueWeaponKillsPrecisionKills;


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
            self.uniqueWeaponKills = [UniqueWeaponKills modelObjectWithDictionary:[dict objectForKey:kValuesUniqueWeaponKills]];
            self.uniqueWeaponPrecisionKills = [UniqueWeaponPrecisionKills modelObjectWithDictionary:[dict objectForKey:kValuesUniqueWeaponPrecisionKills]];
            self.uniqueWeaponAssists = [UniqueWeaponAssists modelObjectWithDictionary:[dict objectForKey:kValuesUniqueWeaponAssists]];
            self.uniqueWeaponAssistDamage = [UniqueWeaponAssistDamage modelObjectWithDictionary:[dict objectForKey:kValuesUniqueWeaponAssistDamage]];
            self.uniqueWeaponKillsPrecisionKills = [UniqueWeaponKillsPrecisionKills modelObjectWithDictionary:[dict objectForKey:kValuesUniqueWeaponKillsPrecisionKills]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.uniqueWeaponKills dictionaryRepresentation] forKey:kValuesUniqueWeaponKills];
    [mutableDict setValue:[self.uniqueWeaponPrecisionKills dictionaryRepresentation] forKey:kValuesUniqueWeaponPrecisionKills];
    [mutableDict setValue:[self.uniqueWeaponAssists dictionaryRepresentation] forKey:kValuesUniqueWeaponAssists];
    [mutableDict setValue:[self.uniqueWeaponAssistDamage dictionaryRepresentation] forKey:kValuesUniqueWeaponAssistDamage];
    [mutableDict setValue:[self.uniqueWeaponKillsPrecisionKills dictionaryRepresentation] forKey:kValuesUniqueWeaponKillsPrecisionKills];

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

    self.uniqueWeaponKills = [aDecoder decodeObjectForKey:kValuesUniqueWeaponKills];
    self.uniqueWeaponPrecisionKills = [aDecoder decodeObjectForKey:kValuesUniqueWeaponPrecisionKills];
    self.uniqueWeaponAssists = [aDecoder decodeObjectForKey:kValuesUniqueWeaponAssists];
    self.uniqueWeaponAssistDamage = [aDecoder decodeObjectForKey:kValuesUniqueWeaponAssistDamage];
    self.uniqueWeaponKillsPrecisionKills = [aDecoder decodeObjectForKey:kValuesUniqueWeaponKillsPrecisionKills];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_uniqueWeaponKills forKey:kValuesUniqueWeaponKills];
    [aCoder encodeObject:_uniqueWeaponPrecisionKills forKey:kValuesUniqueWeaponPrecisionKills];
    [aCoder encodeObject:_uniqueWeaponAssists forKey:kValuesUniqueWeaponAssists];
    [aCoder encodeObject:_uniqueWeaponAssistDamage forKey:kValuesUniqueWeaponAssistDamage];
    [aCoder encodeObject:_uniqueWeaponKillsPrecisionKills forKey:kValuesUniqueWeaponKillsPrecisionKills];
}

- (id)copyWithZone:(NSZone *)zone
{
    UWHValues *copy = [[UWHValues alloc] init];
    
    if (copy) {

        copy.uniqueWeaponKills = [self.uniqueWeaponKills copyWithZone:zone];
        copy.uniqueWeaponPrecisionKills = [self.uniqueWeaponPrecisionKills copyWithZone:zone];
        copy.uniqueWeaponAssists = [self.uniqueWeaponAssists copyWithZone:zone];
        copy.uniqueWeaponAssistDamage = [self.uniqueWeaponAssistDamage copyWithZone:zone];
        copy.uniqueWeaponKillsPrecisionKills = [self.uniqueWeaponKillsPrecisionKills copyWithZone:zone];
    }
    
    return copy;
}


@end

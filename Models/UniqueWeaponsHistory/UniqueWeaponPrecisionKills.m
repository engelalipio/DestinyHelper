//
//  UniqueWeaponPrecisionKills.m
//
//  Created by Engel Alipio on 5/15/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "UniqueWeaponPrecisionKills.h"
#import "UWHBasic.h"


NSString *const kUniqueWeaponPrecisionKillsBasic = @"basic";
NSString *const kUniqueWeaponPrecisionKillsStatId = @"statId";


@interface UniqueWeaponPrecisionKills ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UniqueWeaponPrecisionKills

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
            self.basic = [UWHBasic modelObjectWithDictionary:[dict objectForKey:kUniqueWeaponPrecisionKillsBasic]];
            self.statId = [self objectOrNilForKey:kUniqueWeaponPrecisionKillsStatId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kUniqueWeaponPrecisionKillsBasic];
    [mutableDict setValue:self.statId forKey:kUniqueWeaponPrecisionKillsStatId];

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

    self.basic = [aDecoder decodeObjectForKey:kUniqueWeaponPrecisionKillsBasic];
    self.statId = [aDecoder decodeObjectForKey:kUniqueWeaponPrecisionKillsStatId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_basic forKey:kUniqueWeaponPrecisionKillsBasic];
    [aCoder encodeObject:_statId forKey:kUniqueWeaponPrecisionKillsStatId];
}

- (id)copyWithZone:(NSZone *)zone
{
    UniqueWeaponPrecisionKills *copy = [[UniqueWeaponPrecisionKills alloc] init];
    
    if (copy) {

        copy.basic = [self.basic copyWithZone:zone];
        copy.statId = [self.statId copyWithZone:zone];
    }
    
    return copy;
}


@end

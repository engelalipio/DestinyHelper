//
//  UniqueWeaponKills.m
//
//  Created by Engel Alipio on 5/15/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "UniqueWeaponKills.h"
#import "UWHBasic.h"


NSString *const kUniqueWeaponKillsBasic = @"basic";
NSString *const kUniqueWeaponKillsStatId = @"statId";


@interface UniqueWeaponKills ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UniqueWeaponKills

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
            self.basic = [UWHBasic modelObjectWithDictionary:[dict objectForKey:kUniqueWeaponKillsBasic]];
            self.statId = [self objectOrNilForKey:kUniqueWeaponKillsStatId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kUniqueWeaponKillsBasic];
    [mutableDict setValue:self.statId forKey:kUniqueWeaponKillsStatId];

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

    self.basic = [aDecoder decodeObjectForKey:kUniqueWeaponKillsBasic];
    self.statId = [aDecoder decodeObjectForKey:kUniqueWeaponKillsStatId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_basic forKey:kUniqueWeaponKillsBasic];
    [aCoder encodeObject:_statId forKey:kUniqueWeaponKillsStatId];
}

- (id)copyWithZone:(NSZone *)zone
{
    UniqueWeaponKills *copy = [[UniqueWeaponKills alloc] init];
    
    if (copy) {

        copy.basic = [self.basic copyWithZone:zone];
        copy.statId = [self.statId copyWithZone:zone];
    }
    
    return copy;
}


@end

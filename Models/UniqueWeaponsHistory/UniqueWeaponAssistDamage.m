//
//  UniqueWeaponAssistDamage.m
//
//  Created by Engel Alipio on 5/15/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "UniqueWeaponAssistDamage.h"
#import "UWHBasic.h"


NSString *const kUniqueWeaponAssistDamageBasic = @"basic";
NSString *const kUniqueWeaponAssistDamageStatId = @"statId";


@interface UniqueWeaponAssistDamage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UniqueWeaponAssistDamage

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
            self.basic = [UWHBasic modelObjectWithDictionary:[dict objectForKey:kUniqueWeaponAssistDamageBasic]];
            self.statId = [self objectOrNilForKey:kUniqueWeaponAssistDamageStatId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.basic dictionaryRepresentation] forKey:kUniqueWeaponAssistDamageBasic];
    [mutableDict setValue:self.statId forKey:kUniqueWeaponAssistDamageStatId];

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

    self.basic = [aDecoder decodeObjectForKey:kUniqueWeaponAssistDamageBasic];
    self.statId = [aDecoder decodeObjectForKey:kUniqueWeaponAssistDamageStatId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_basic forKey:kUniqueWeaponAssistDamageBasic];
    [aCoder encodeObject:_statId forKey:kUniqueWeaponAssistDamageStatId];
}

- (id)copyWithZone:(NSZone *)zone
{
    UniqueWeaponAssistDamage *copy = [[UniqueWeaponAssistDamage alloc] init];
    
    if (copy) {

        copy.basic = [self.basic copyWithZone:zone];
        copy.statId = [self.statId copyWithZone:zone];
    }
    
    return copy;
}


@end

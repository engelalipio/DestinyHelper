//
//  INSTData.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INSTData.h"
#import "INSTPrimaryStat.h"


NSString *const kDataDamageType = @"damageType";
NSString *const kDataDamageTypeHash = @"damageTypeHash";
NSString *const kDataEquipRequiredLevel = @"equipRequiredLevel";
NSString *const kDataUnlockHashesRequiredToEquip = @"unlockHashesRequiredToEquip";
NSString *const kDataCanEquip = @"canEquip";
NSString *const kDataItemLevel = @"itemLevel";
NSString *const kDataCannotEquipReason = @"cannotEquipReason";
NSString *const kDataQuality = @"quality";
NSString *const kDataIsEquipped = @"isEquipped";
NSString *const kDataPrimaryStat = @"primaryStat";


@interface INSTData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INSTData

@synthesize damageType = _damageType;
@synthesize damageTypeHash = _damageTypeHash;
@synthesize equipRequiredLevel = _equipRequiredLevel;
@synthesize unlockHashesRequiredToEquip = _unlockHashesRequiredToEquip;
@synthesize canEquip = _canEquip;
@synthesize itemLevel = _itemLevel;
@synthesize cannotEquipReason = _cannotEquipReason;
@synthesize quality = _quality;
@synthesize isEquipped = _isEquipped;
@synthesize primaryStat = _primaryStat;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kDataItemLevel,@"itemLevel",
                         nil];
    
    return map;
}


+ (NSString *)key{
    return nil;
}


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
            self.damageType = [[self objectOrNilForKey:kDataDamageType fromDictionary:dict] doubleValue];
            self.damageTypeHash = [[self objectOrNilForKey:kDataDamageTypeHash fromDictionary:dict] doubleValue];
            self.equipRequiredLevel = [[self objectOrNilForKey:kDataEquipRequiredLevel fromDictionary:dict] doubleValue];
            self.unlockHashesRequiredToEquip = [self objectOrNilForKey:kDataUnlockHashesRequiredToEquip fromDictionary:dict];
            self.canEquip = [[self objectOrNilForKey:kDataCanEquip fromDictionary:dict] boolValue];
            self.itemLevel = [[self objectOrNilForKey:kDataItemLevel fromDictionary:dict] doubleValue];
            self.cannotEquipReason = [[self objectOrNilForKey:kDataCannotEquipReason fromDictionary:dict] doubleValue];
            self.quality = [[self objectOrNilForKey:kDataQuality fromDictionary:dict] doubleValue];
            self.isEquipped = [[self objectOrNilForKey:kDataIsEquipped fromDictionary:dict] boolValue];
            self.primaryStat = [INSTPrimaryStat modelObjectWithDictionary:[dict objectForKey:kDataPrimaryStat]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.damageType] forKey:kDataDamageType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.damageTypeHash] forKey:kDataDamageTypeHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.equipRequiredLevel] forKey:kDataEquipRequiredLevel];
    NSMutableArray *tempArrayForUnlockHashesRequiredToEquip = [NSMutableArray array];
    for (NSObject *subArrayObject in self.unlockHashesRequiredToEquip) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUnlockHashesRequiredToEquip addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUnlockHashesRequiredToEquip addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUnlockHashesRequiredToEquip] forKey:kDataUnlockHashesRequiredToEquip];
    [mutableDict setValue:[NSNumber numberWithBool:self.canEquip] forKey:kDataCanEquip];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemLevel] forKey:kDataItemLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cannotEquipReason] forKey:kDataCannotEquipReason];
    [mutableDict setValue:[NSNumber numberWithDouble:self.quality] forKey:kDataQuality];
    [mutableDict setValue:[NSNumber numberWithBool:self.isEquipped] forKey:kDataIsEquipped];
    [mutableDict setValue:[self.primaryStat dictionaryRepresentation] forKey:kDataPrimaryStat];

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

    self.damageType = [aDecoder decodeDoubleForKey:kDataDamageType];
    self.damageTypeHash = [aDecoder decodeDoubleForKey:kDataDamageTypeHash];
    self.equipRequiredLevel = [aDecoder decodeDoubleForKey:kDataEquipRequiredLevel];
    self.unlockHashesRequiredToEquip = [aDecoder decodeObjectForKey:kDataUnlockHashesRequiredToEquip];
    self.canEquip = [aDecoder decodeBoolForKey:kDataCanEquip];
    self.itemLevel = [aDecoder decodeDoubleForKey:kDataItemLevel];
    self.cannotEquipReason = [aDecoder decodeDoubleForKey:kDataCannotEquipReason];
    self.quality = [aDecoder decodeDoubleForKey:kDataQuality];
    self.isEquipped = [aDecoder decodeBoolForKey:kDataIsEquipped];
    self.primaryStat = [aDecoder decodeObjectForKey:kDataPrimaryStat];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_damageType forKey:kDataDamageType];
    [aCoder encodeDouble:_damageTypeHash forKey:kDataDamageTypeHash];
    [aCoder encodeDouble:_equipRequiredLevel forKey:kDataEquipRequiredLevel];
    [aCoder encodeObject:_unlockHashesRequiredToEquip forKey:kDataUnlockHashesRequiredToEquip];
    [aCoder encodeBool:_canEquip forKey:kDataCanEquip];
    [aCoder encodeDouble:_itemLevel forKey:kDataItemLevel];
    [aCoder encodeDouble:_cannotEquipReason forKey:kDataCannotEquipReason];
    [aCoder encodeDouble:_quality forKey:kDataQuality];
    [aCoder encodeBool:_isEquipped forKey:kDataIsEquipped];
    [aCoder encodeObject:_primaryStat forKey:kDataPrimaryStat];
}

- (id)copyWithZone:(NSZone *)zone
{
    INSTData *copy = [[INSTData alloc] init];
    
    if (copy) {

        copy.damageType = self.damageType;
        copy.damageTypeHash = self.damageTypeHash;
        copy.equipRequiredLevel = self.equipRequiredLevel;
        copy.unlockHashesRequiredToEquip = [self.unlockHashesRequiredToEquip copyWithZone:zone];
        copy.canEquip = self.canEquip;
        copy.itemLevel = self.itemLevel;
        copy.cannotEquipReason = self.cannotEquipReason;
        copy.quality = self.quality;
        copy.isEquipped = self.isEquipped;
        copy.primaryStat = [self.primaryStat copyWithZone:zone];
    }
    
    return copy;
}


@end

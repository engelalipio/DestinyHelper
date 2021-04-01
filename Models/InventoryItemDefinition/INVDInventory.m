//
//  INVDInventory.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVDInventory.h"


NSString *const kInventoryMaxStackSize = @"maxStackSize";
NSString *const kInventoryBucketTypeHash = @"bucketTypeHash";
NSString *const kInventoryTierTypeName = @"tierTypeName";
NSString *const kInventoryNonTransferrableOriginal = @"nonTransferrableOriginal";
NSString *const kInventoryIsInstanceItem = @"isInstanceItem";
NSString *const kInventoryExpirationTooltip = @"expirationTooltip";
NSString *const kInventorySuppressExpirationWhenObjectivesComplete = @"suppressExpirationWhenObjectivesComplete";
NSString *const kInventoryExpiredInActivityMessage = @"expiredInActivityMessage";
NSString *const kInventoryTierTypeHash = @"tierTypeHash";
NSString *const kInventoryTierType = @"tierType";
NSString *const kInventoryExpiredInOrbitMessage = @"expiredInOrbitMessage";
NSString *const kInventoryRecoveryBucketTypeHash = @"recoveryBucketTypeHash";


@interface INVDInventory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVDInventory

@synthesize maxStackSize = _maxStackSize;
@synthesize bucketTypeHash = _bucketTypeHash;
@synthesize tierTypeName = _tierTypeName;
@synthesize nonTransferrableOriginal = _nonTransferrableOriginal;
@synthesize isInstanceItem = _isInstanceItem;
@synthesize expirationTooltip = _expirationTooltip;
@synthesize suppressExpirationWhenObjectivesComplete = _suppressExpirationWhenObjectivesComplete;
@synthesize expiredInActivityMessage = _expiredInActivityMessage;
@synthesize tierTypeHash = _tierTypeHash;
@synthesize tierType = _tierType;
@synthesize expiredInOrbitMessage = _expiredInOrbitMessage;
@synthesize recoveryBucketTypeHash = _recoveryBucketTypeHash;


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
            self.maxStackSize = [[self objectOrNilForKey:kInventoryMaxStackSize fromDictionary:dict] doubleValue];
            self.bucketTypeHash = [[self objectOrNilForKey:kInventoryBucketTypeHash fromDictionary:dict] doubleValue];
            self.tierTypeName = [self objectOrNilForKey:kInventoryTierTypeName fromDictionary:dict];
            self.nonTransferrableOriginal = [[self objectOrNilForKey:kInventoryNonTransferrableOriginal fromDictionary:dict] boolValue];
            self.isInstanceItem = [[self objectOrNilForKey:kInventoryIsInstanceItem fromDictionary:dict] boolValue];
            self.expirationTooltip = [self objectOrNilForKey:kInventoryExpirationTooltip fromDictionary:dict];
            self.suppressExpirationWhenObjectivesComplete = [[self objectOrNilForKey:kInventorySuppressExpirationWhenObjectivesComplete fromDictionary:dict] boolValue];
            self.expiredInActivityMessage = [self objectOrNilForKey:kInventoryExpiredInActivityMessage fromDictionary:dict];
            self.tierTypeHash = [[self objectOrNilForKey:kInventoryTierTypeHash fromDictionary:dict] doubleValue];
            self.tierType = [[self objectOrNilForKey:kInventoryTierType fromDictionary:dict] doubleValue];
            self.expiredInOrbitMessage = [self objectOrNilForKey:kInventoryExpiredInOrbitMessage fromDictionary:dict];
            self.recoveryBucketTypeHash = [[self objectOrNilForKey:kInventoryRecoveryBucketTypeHash fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maxStackSize] forKey:kInventoryMaxStackSize];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bucketTypeHash] forKey:kInventoryBucketTypeHash];
    [mutableDict setValue:self.tierTypeName forKey:kInventoryTierTypeName];
    [mutableDict setValue:[NSNumber numberWithBool:self.nonTransferrableOriginal] forKey:kInventoryNonTransferrableOriginal];
    [mutableDict setValue:[NSNumber numberWithBool:self.isInstanceItem] forKey:kInventoryIsInstanceItem];
    [mutableDict setValue:self.expirationTooltip forKey:kInventoryExpirationTooltip];
    [mutableDict setValue:[NSNumber numberWithBool:self.suppressExpirationWhenObjectivesComplete] forKey:kInventorySuppressExpirationWhenObjectivesComplete];
    [mutableDict setValue:self.expiredInActivityMessage forKey:kInventoryExpiredInActivityMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tierTypeHash] forKey:kInventoryTierTypeHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tierType] forKey:kInventoryTierType];
    [mutableDict setValue:self.expiredInOrbitMessage forKey:kInventoryExpiredInOrbitMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recoveryBucketTypeHash] forKey:kInventoryRecoveryBucketTypeHash];

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

    self.maxStackSize = [aDecoder decodeDoubleForKey:kInventoryMaxStackSize];
    self.bucketTypeHash = [aDecoder decodeDoubleForKey:kInventoryBucketTypeHash];
    self.tierTypeName = [aDecoder decodeObjectForKey:kInventoryTierTypeName];
    self.nonTransferrableOriginal = [aDecoder decodeBoolForKey:kInventoryNonTransferrableOriginal];
    self.isInstanceItem = [aDecoder decodeBoolForKey:kInventoryIsInstanceItem];
    self.expirationTooltip = [aDecoder decodeObjectForKey:kInventoryExpirationTooltip];
    self.suppressExpirationWhenObjectivesComplete = [aDecoder decodeBoolForKey:kInventorySuppressExpirationWhenObjectivesComplete];
    self.expiredInActivityMessage = [aDecoder decodeObjectForKey:kInventoryExpiredInActivityMessage];
    self.tierTypeHash = [aDecoder decodeDoubleForKey:kInventoryTierTypeHash];
    self.tierType = [aDecoder decodeDoubleForKey:kInventoryTierType];
    self.expiredInOrbitMessage = [aDecoder decodeObjectForKey:kInventoryExpiredInOrbitMessage];
    self.recoveryBucketTypeHash = [aDecoder decodeDoubleForKey:kInventoryRecoveryBucketTypeHash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_maxStackSize forKey:kInventoryMaxStackSize];
    [aCoder encodeDouble:_bucketTypeHash forKey:kInventoryBucketTypeHash];
    [aCoder encodeObject:_tierTypeName forKey:kInventoryTierTypeName];
    [aCoder encodeBool:_nonTransferrableOriginal forKey:kInventoryNonTransferrableOriginal];
    [aCoder encodeBool:_isInstanceItem forKey:kInventoryIsInstanceItem];
    [aCoder encodeObject:_expirationTooltip forKey:kInventoryExpirationTooltip];
    [aCoder encodeBool:_suppressExpirationWhenObjectivesComplete forKey:kInventorySuppressExpirationWhenObjectivesComplete];
    [aCoder encodeObject:_expiredInActivityMessage forKey:kInventoryExpiredInActivityMessage];
    [aCoder encodeDouble:_tierTypeHash forKey:kInventoryTierTypeHash];
    [aCoder encodeDouble:_tierType forKey:kInventoryTierType];
    [aCoder encodeObject:_expiredInOrbitMessage forKey:kInventoryExpiredInOrbitMessage];
    [aCoder encodeDouble:_recoveryBucketTypeHash forKey:kInventoryRecoveryBucketTypeHash];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVDInventory *copy = [[INVDInventory alloc] init];
    
    if (copy) {

        copy.maxStackSize = self.maxStackSize;
        copy.bucketTypeHash = self.bucketTypeHash;
        copy.tierTypeName = [self.tierTypeName copyWithZone:zone];
        copy.nonTransferrableOriginal = self.nonTransferrableOriginal;
        copy.isInstanceItem = self.isInstanceItem;
        copy.expirationTooltip = [self.expirationTooltip copyWithZone:zone];
        copy.suppressExpirationWhenObjectivesComplete = self.suppressExpirationWhenObjectivesComplete;
        copy.expiredInActivityMessage = [self.expiredInActivityMessage copyWithZone:zone];
        copy.tierTypeHash = self.tierTypeHash;
        copy.tierType = self.tierType;
        copy.expiredInOrbitMessage = [self.expiredInOrbitMessage copyWithZone:zone];
        copy.recoveryBucketTypeHash = self.recoveryBucketTypeHash;
    }
    
    return copy;
}


@end

//
//  VAULTItems.m
//
//  Created by Engel Alipio on 5/17/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "VAULTItems.h"


NSString *const kVItemsQuantity = @"quantity";
NSString *const kVItemsState = @"state";
NSString *const kVItemsTooltipNotificationIndexes = @"tooltipNotificationIndexes";
NSString *const kVItemsLockable = @"lockable";
NSString *const kVItemsIsWrapper = @"isWrapper";
NSString *const kVItemsItemHash = @"itemHash";
NSString *const kVItemsBindStatus = @"bindStatus";
NSString *const kVItemsDismantlePermission = @"dismantlePermission";
NSString *const kVItemsLocation = @"location";
NSString *const kVItemsItemInstanceId = @"itemInstanceId";
NSString *const kVItemsBucketHash = @"bucketHash";
NSString *const kVItemsTransferStatus = @"transferStatus";
NSString *const kVItemsVersionNumber = @"versionNumber";


@interface VAULTItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VAULTItems

@synthesize quantity = _quantity;
@synthesize state = _state;
@synthesize tooltipNotificationIndexes = _tooltipNotificationIndexes;
@synthesize lockable = _lockable;
@synthesize isWrapper = _isWrapper;
@synthesize itemHash = _itemHash;
@synthesize bindStatus = _bindStatus;
@synthesize dismantlePermission = _dismantlePermission;
@synthesize location = _location;
@synthesize itemInstanceId = _itemInstanceId;
@synthesize bucketHash = _bucketHash;
@synthesize transferStatus = _transferStatus;
@synthesize versionNumber = _versionNumber;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kVItemsItemHash,@"itemHash",
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
            self.quantity = [[self objectOrNilForKey:kVItemsQuantity fromDictionary:dict] doubleValue];
            self.state = [[self objectOrNilForKey:kVItemsState fromDictionary:dict] doubleValue];
            self.tooltipNotificationIndexes = [self objectOrNilForKey:kVItemsTooltipNotificationIndexes fromDictionary:dict];
            self.lockable = [[self objectOrNilForKey:kVItemsLockable fromDictionary:dict] boolValue];
            self.isWrapper = [[self objectOrNilForKey:kVItemsIsWrapper fromDictionary:dict] boolValue];
            self.itemHash = [[self objectOrNilForKey:kVItemsItemHash fromDictionary:dict] doubleValue];
            self.bindStatus = [[self objectOrNilForKey:kVItemsBindStatus fromDictionary:dict] doubleValue];
            self.dismantlePermission = [[self objectOrNilForKey:kVItemsDismantlePermission fromDictionary:dict] doubleValue];
            self.location = [[self objectOrNilForKey:kVItemsLocation fromDictionary:dict] doubleValue];
            self.itemInstanceId = [self objectOrNilForKey:kVItemsItemInstanceId fromDictionary:dict];
            self.bucketHash = [[self objectOrNilForKey:kVItemsBucketHash fromDictionary:dict] doubleValue];
            self.transferStatus = [[self objectOrNilForKey:kVItemsTransferStatus fromDictionary:dict] doubleValue];
            self.versionNumber = [[self objectOrNilForKey:kVItemsVersionNumber fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.quantity] forKey:kVItemsQuantity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.state] forKey:kVItemsState];
    NSMutableArray *tempArrayForTooltipNotificationIndexes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tooltipNotificationIndexes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTooltipNotificationIndexes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTooltipNotificationIndexes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTooltipNotificationIndexes] forKey:kVItemsTooltipNotificationIndexes];
    [mutableDict setValue:[NSNumber numberWithBool:self.lockable] forKey:kVItemsLockable];
    [mutableDict setValue:[NSNumber numberWithBool:self.isWrapper] forKey:kVItemsIsWrapper];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemHash] forKey:kVItemsItemHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bindStatus] forKey:kVItemsBindStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dismantlePermission] forKey:kVItemsDismantlePermission];
    [mutableDict setValue:[NSNumber numberWithDouble:self.location] forKey:kVItemsLocation];
    [mutableDict setValue:self.itemInstanceId forKey:kVItemsItemInstanceId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bucketHash] forKey:kVItemsBucketHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.transferStatus] forKey:kVItemsTransferStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.versionNumber] forKey:kVItemsVersionNumber];

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

    self.quantity = [aDecoder decodeDoubleForKey:kVItemsQuantity];
    self.state = [aDecoder decodeDoubleForKey:kVItemsState];
    self.tooltipNotificationIndexes = [aDecoder decodeObjectForKey:kVItemsTooltipNotificationIndexes];
    self.lockable = [aDecoder decodeBoolForKey:kVItemsLockable];
    self.isWrapper = [aDecoder decodeBoolForKey:kVItemsIsWrapper];
    self.itemHash = [aDecoder decodeDoubleForKey:kVItemsItemHash];
    self.bindStatus = [aDecoder decodeDoubleForKey:kVItemsBindStatus];
    self.dismantlePermission = [aDecoder decodeDoubleForKey:kVItemsDismantlePermission];
    self.location = [aDecoder decodeDoubleForKey:kVItemsLocation];
    self.itemInstanceId = [aDecoder decodeObjectForKey:kVItemsItemInstanceId];
    self.bucketHash = [aDecoder decodeDoubleForKey:kVItemsBucketHash];
    self.transferStatus = [aDecoder decodeDoubleForKey:kVItemsTransferStatus];
    self.versionNumber = [aDecoder decodeDoubleForKey:kVItemsVersionNumber];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_quantity forKey:kVItemsQuantity];
    [aCoder encodeDouble:_state forKey:kVItemsState];
    [aCoder encodeObject:_tooltipNotificationIndexes forKey:kVItemsTooltipNotificationIndexes];
    [aCoder encodeBool:_lockable forKey:kVItemsLockable];
    [aCoder encodeBool:_isWrapper forKey:kVItemsIsWrapper];
    [aCoder encodeDouble:_itemHash forKey:kVItemsItemHash];
    [aCoder encodeDouble:_bindStatus forKey:kVItemsBindStatus];
    [aCoder encodeDouble:_dismantlePermission forKey:kVItemsDismantlePermission];
    [aCoder encodeDouble:_location forKey:kVItemsLocation];
    [aCoder encodeObject:_itemInstanceId forKey:kVItemsItemInstanceId];
    [aCoder encodeDouble:_bucketHash forKey:kVItemsBucketHash];
    [aCoder encodeDouble:_transferStatus forKey:kVItemsTransferStatus];
    [aCoder encodeDouble:_versionNumber forKey:kVItemsVersionNumber];
}

- (id)copyWithZone:(NSZone *)zone
{
    VAULTItems *copy = [[VAULTItems alloc] init];
    
    if (copy) {

        copy.quantity = self.quantity;
        copy.state = self.state;
        copy.tooltipNotificationIndexes = [self.tooltipNotificationIndexes copyWithZone:zone];
        copy.lockable = self.lockable;
        copy.isWrapper = self.isWrapper;
        copy.itemHash = self.itemHash;
        copy.bindStatus = self.bindStatus;
        copy.dismantlePermission = self.dismantlePermission;
        copy.location = self.location;
        copy.itemInstanceId = [self.itemInstanceId copyWithZone:zone];
        copy.bucketHash = self.bucketHash;
        copy.transferStatus = self.transferStatus;
        copy.versionNumber = self.versionNumber;
    }
    
    return copy;
}


@end

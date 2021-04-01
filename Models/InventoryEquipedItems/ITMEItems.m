//
//  Items.m
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "ITMEItems.h"


NSString *const kItemsQuantity = @"quantity";
NSString *const kItemsState = @"state";
NSString *const kItemsTooltipNotificationIndexes = @"tooltipNotificationIndexes";
NSString *const kItemsLockable = @"lockable";
NSString *const kItemsIsWrapper = @"isWrapper";
NSString *const kItemsItemHash = @"itemHash";
NSString *const kItemsBindStatus = @"bindStatus";
NSString *const kItemsDismantlePermission = @"dismantlePermission";
NSString *const kItemsLocation = @"location";
NSString *const kItemsItemInstanceId = @"itemInstanceId";
NSString *const kItemsBucketHash = @"bucketHash";
NSString *const kItemsTransferStatus = @"transferStatus";
NSString *const kItemsVersionNumber = @"versionNumber";


@interface ITMEItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITMEItems

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
                         kItemsItemInstanceId,@"itemInstanceId",
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
            self.quantity = [[self objectOrNilForKey:kItemsQuantity fromDictionary:dict] doubleValue];
            self.state = [[self objectOrNilForKey:kItemsState fromDictionary:dict] doubleValue];
            self.tooltipNotificationIndexes = [self objectOrNilForKey:kItemsTooltipNotificationIndexes fromDictionary:dict];
            self.lockable = [[self objectOrNilForKey:kItemsLockable fromDictionary:dict] boolValue];
            self.isWrapper = [[self objectOrNilForKey:kItemsIsWrapper fromDictionary:dict] boolValue];
            self.itemHash = [[self objectOrNilForKey:kItemsItemHash fromDictionary:dict] doubleValue];
            self.bindStatus = [[self objectOrNilForKey:kItemsBindStatus fromDictionary:dict] doubleValue];
            self.dismantlePermission = [[self objectOrNilForKey:kItemsDismantlePermission fromDictionary:dict] doubleValue];
            self.location = [[self objectOrNilForKey:kItemsLocation fromDictionary:dict] doubleValue];
            self.itemInstanceId = [self objectOrNilForKey:kItemsItemInstanceId fromDictionary:dict];
            self.bucketHash = [[self objectOrNilForKey:kItemsBucketHash fromDictionary:dict] doubleValue];
            self.transferStatus = [[self objectOrNilForKey:kItemsTransferStatus fromDictionary:dict] doubleValue];
            self.versionNumber = [[self objectOrNilForKey:kItemsVersionNumber fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.quantity] forKey:kItemsQuantity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.state] forKey:kItemsState];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTooltipNotificationIndexes] forKey:kItemsTooltipNotificationIndexes];
    [mutableDict setValue:[NSNumber numberWithBool:self.lockable] forKey:kItemsLockable];
    [mutableDict setValue:[NSNumber numberWithBool:self.isWrapper] forKey:kItemsIsWrapper];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemHash] forKey:kItemsItemHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bindStatus] forKey:kItemsBindStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dismantlePermission] forKey:kItemsDismantlePermission];
    [mutableDict setValue:[NSNumber numberWithDouble:self.location] forKey:kItemsLocation];
    [mutableDict setValue:self.itemInstanceId forKey:kItemsItemInstanceId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bucketHash] forKey:kItemsBucketHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.transferStatus] forKey:kItemsTransferStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.versionNumber] forKey:kItemsVersionNumber];

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

    self.quantity = [aDecoder decodeDoubleForKey:kItemsQuantity];
    self.state = [aDecoder decodeDoubleForKey:kItemsState];
    self.tooltipNotificationIndexes = [aDecoder decodeObjectForKey:kItemsTooltipNotificationIndexes];
    self.lockable = [aDecoder decodeBoolForKey:kItemsLockable];
    self.isWrapper = [aDecoder decodeBoolForKey:kItemsIsWrapper];
    self.itemHash = [aDecoder decodeDoubleForKey:kItemsItemHash];
    self.bindStatus = [aDecoder decodeDoubleForKey:kItemsBindStatus];
    self.dismantlePermission = [aDecoder decodeDoubleForKey:kItemsDismantlePermission];
    self.location = [aDecoder decodeDoubleForKey:kItemsLocation];
    self.itemInstanceId = [aDecoder decodeObjectForKey:kItemsItemInstanceId];
    self.bucketHash = [aDecoder decodeDoubleForKey:kItemsBucketHash];
    self.transferStatus = [aDecoder decodeDoubleForKey:kItemsTransferStatus];
    self.versionNumber = [aDecoder decodeDoubleForKey:kItemsVersionNumber];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_quantity forKey:kItemsQuantity];
    [aCoder encodeDouble:_state forKey:kItemsState];
    [aCoder encodeObject:_tooltipNotificationIndexes forKey:kItemsTooltipNotificationIndexes];
    [aCoder encodeBool:_lockable forKey:kItemsLockable];
    [aCoder encodeBool:_isWrapper forKey:kItemsIsWrapper];
    [aCoder encodeDouble:_itemHash forKey:kItemsItemHash];
    [aCoder encodeDouble:_bindStatus forKey:kItemsBindStatus];
    [aCoder encodeDouble:_dismantlePermission forKey:kItemsDismantlePermission];
    [aCoder encodeDouble:_location forKey:kItemsLocation];
    [aCoder encodeObject:_itemInstanceId forKey:kItemsItemInstanceId];
    [aCoder encodeDouble:_bucketHash forKey:kItemsBucketHash];
    [aCoder encodeDouble:_transferStatus forKey:kItemsTransferStatus];
    [aCoder encodeDouble:_versionNumber forKey:kItemsVersionNumber];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITMEItems *copy = [[ITMEItems alloc] init];
    
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

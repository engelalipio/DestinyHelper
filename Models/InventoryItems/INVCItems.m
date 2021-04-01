//
//  Items.m
//
//  Created by Engel Alipio on 3/13/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVCItems.h"


NSString *const kINVCItemsQuantity = @"quantity";
NSString *const kINVCItemsState = @"state";
NSString *const kINVCItemsTooltipNotificationIndexes = @"tooltipNotificationIndexes";
NSString *const kINVCItemsLockable = @"lockable";
NSString *const kINVCItemsIsWrapper = @"isWrapper";
NSString *const kINVCItemsItemHash = @"itemHash";
NSString *const kINVCItemsBindStatus = @"bindStatus";
NSString *const kINVCItemsDismantlePermission = @"dismantlePermission";
NSString *const kINVCItemsLocation = @"location";
NSString *const kINVCItemsItemInstanceId = @"itemInstanceId";
NSString *const kINVCItemsBucketHash = @"bucketHash";
NSString *const kINVCItemsTransferStatus = @"transferStatus";
NSString *const kINVCItemsVersionNumber = @"versionNumber";


@interface INVCItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVCItems

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
                         kINVCItemsQuantity,@"quantity",
                         kINVCItemsState,@"state",
                         kINVCItemsTooltipNotificationIndexes,@"tooltipNotificationIndexes",
                         kINVCItemsLockable,@"lockable",
                         kINVCItemsIsWrapper,@"isWrapper",
                         kINVCItemsItemHash,@"itemHash",
                         kINVCItemsBindStatus,@"bindStatus",
                         kINVCItemsDismantlePermission,@"dismantlePermission",
                         kINVCItemsLocation,@"location",
                         kINVCItemsItemInstanceId,@"itemInstanceId",
                         kINVCItemsBucketHash,@"bucketHash",
                         kINVCItemsTransferStatus,@"transferStatus",
                         kINVCItemsVersionNumber,@"versionNumber",
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
            self.quantity = [[self objectOrNilForKey:kINVCItemsQuantity fromDictionary:dict] doubleValue];
            self.state = [[self objectOrNilForKey:kINVCItemsState fromDictionary:dict] doubleValue];
            self.tooltipNotificationIndexes = [self objectOrNilForKey:kINVCItemsTooltipNotificationIndexes fromDictionary:dict];
            self.lockable = [[self objectOrNilForKey:kINVCItemsLockable fromDictionary:dict] boolValue];
            self.isWrapper = [[self objectOrNilForKey:kINVCItemsIsWrapper fromDictionary:dict] boolValue];
            self.itemHash = [[self objectOrNilForKey:kINVCItemsItemHash fromDictionary:dict] doubleValue];
            self.bindStatus = [[self objectOrNilForKey:kINVCItemsBindStatus fromDictionary:dict] doubleValue];
            self.dismantlePermission = [[self objectOrNilForKey:kINVCItemsDismantlePermission fromDictionary:dict] doubleValue];
            self.location = [[self objectOrNilForKey:kINVCItemsLocation fromDictionary:dict] doubleValue];
            self.itemInstanceId = [self objectOrNilForKey:kINVCItemsItemInstanceId fromDictionary:dict];
            self.bucketHash = [[self objectOrNilForKey:kINVCItemsBucketHash fromDictionary:dict] doubleValue];
            self.transferStatus = [[self objectOrNilForKey:kINVCItemsTransferStatus fromDictionary:dict] doubleValue];
            self.versionNumber = [[self objectOrNilForKey:kINVCItemsVersionNumber fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.quantity] forKey:kINVCItemsQuantity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.state] forKey:kINVCItemsState];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTooltipNotificationIndexes] forKey:kINVCItemsTooltipNotificationIndexes];
    [mutableDict setValue:[NSNumber numberWithBool:self.lockable] forKey:kINVCItemsLockable];
    [mutableDict setValue:[NSNumber numberWithBool:self.isWrapper] forKey:kINVCItemsIsWrapper];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemHash] forKey:kINVCItemsItemHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bindStatus] forKey:kINVCItemsBindStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.dismantlePermission] forKey:kINVCItemsDismantlePermission];
    [mutableDict setValue:[NSNumber numberWithDouble:self.location] forKey:kINVCItemsLocation];
    [mutableDict setValue:self.itemInstanceId forKey:kINVCItemsItemInstanceId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bucketHash] forKey:kINVCItemsBucketHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.transferStatus] forKey:kINVCItemsTransferStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.versionNumber] forKey:kINVCItemsVersionNumber];

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

    self.quantity = [aDecoder decodeDoubleForKey:kINVCItemsQuantity];
    self.state = [aDecoder decodeDoubleForKey:kINVCItemsState];
    self.tooltipNotificationIndexes = [aDecoder decodeObjectForKey:kINVCItemsTooltipNotificationIndexes];
    self.lockable = [aDecoder decodeBoolForKey:kINVCItemsLockable];
    self.isWrapper = [aDecoder decodeBoolForKey:kINVCItemsIsWrapper];
    self.itemHash = [aDecoder decodeDoubleForKey:kINVCItemsItemHash];
    self.bindStatus = [aDecoder decodeDoubleForKey:kINVCItemsBindStatus];
    self.dismantlePermission = [aDecoder decodeDoubleForKey:kINVCItemsDismantlePermission];
    self.location = [aDecoder decodeDoubleForKey:kINVCItemsLocation];
    self.itemInstanceId = [aDecoder decodeObjectForKey:kINVCItemsItemInstanceId];
    self.bucketHash = [aDecoder decodeDoubleForKey:kINVCItemsBucketHash];
    self.transferStatus = [aDecoder decodeDoubleForKey:kINVCItemsTransferStatus];
    self.versionNumber = [aDecoder decodeDoubleForKey:kINVCItemsVersionNumber];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_quantity forKey:kINVCItemsQuantity];
    [aCoder encodeDouble:_state forKey:kINVCItemsState];
    [aCoder encodeObject:_tooltipNotificationIndexes forKey:kINVCItemsTooltipNotificationIndexes];
    [aCoder encodeBool:_lockable forKey:kINVCItemsLockable];
    [aCoder encodeBool:_isWrapper forKey:kINVCItemsIsWrapper];
    [aCoder encodeDouble:_itemHash forKey:kINVCItemsItemHash];
    [aCoder encodeDouble:_bindStatus forKey:kINVCItemsBindStatus];
    [aCoder encodeDouble:_dismantlePermission forKey:kINVCItemsDismantlePermission];
    [aCoder encodeDouble:_location forKey:kINVCItemsLocation];
    [aCoder encodeObject:_itemInstanceId forKey:kINVCItemsItemInstanceId];
    [aCoder encodeDouble:_bucketHash forKey:kINVCItemsBucketHash];
    [aCoder encodeDouble:_transferStatus forKey:kINVCItemsTransferStatus];
    [aCoder encodeDouble:_versionNumber forKey:kINVCItemsVersionNumber];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVCItems *copy = [[INVCItems alloc] init];
    
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

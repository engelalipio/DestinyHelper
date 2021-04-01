//
//  DestinyInventoryBucketDefinition.m
//
//  Created by Engel Alipio on 3/9/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "DestinyInventoryBucketDefinition.h"
#import "BCKDisplayProperties.h"


NSString *const kDestinyInventoryBucketDefinitionCategory = @"category";
NSString *const kDestinyInventoryBucketDefinitionHash = @"hash";
NSString *const kDestinyInventoryBucketDefinitionIndex = @"index";
NSString *const kDestinyInventoryBucketDefinitionHasTransferDestination = @"hasTransferDestination";
NSString *const kDestinyInventoryBucketDefinitionItemCount = @"itemCount";
NSString *const kDestinyInventoryBucketDefinitionScope = @"scope";
NSString *const kDestinyInventoryBucketDefinitionRedacted = @"redacted";
NSString *const kDestinyInventoryBucketDefinitionBucketOrder = @"bucketOrder";
NSString *const kDestinyInventoryBucketDefinitionBlacklisted = @"blacklisted";
NSString *const kDestinyInventoryBucketDefinitionLocation = @"location";
NSString *const kDestinyInventoryBucketDefinitionEnabled = @"enabled";
NSString *const kDestinyInventoryBucketDefinitionDisplayProperties = @"displayProperties";
NSString *const kDestinyInventoryBucketDefinitionFifo = @"fifo";


@interface DestinyInventoryBucketDefinition ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DestinyInventoryBucketDefinition

@synthesize category = _category;
@synthesize hash = _hash;
@synthesize index = _index;
@synthesize hasTransferDestination = _hasTransferDestination;
@synthesize itemCount = _itemCount;
@synthesize scope = _scope;
@synthesize redacted = _redacted;
@synthesize bucketOrder = _bucketOrder;
@synthesize blacklisted = _blacklisted;
@synthesize location = _location;
@synthesize enabled = _enabled;
@synthesize displayProperties = _displayProperties;
@synthesize fifo = _fifo;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kDestinyInventoryBucketDefinitionHash,@"hash",
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
            self.category = [[self objectOrNilForKey:kDestinyInventoryBucketDefinitionCategory fromDictionary:dict] doubleValue];
            self.hash = [[self objectOrNilForKey:kDestinyInventoryBucketDefinitionHash fromDictionary:dict] doubleValue];
            self.index = [[self objectOrNilForKey:kDestinyInventoryBucketDefinitionIndex fromDictionary:dict] doubleValue];
            self.hasTransferDestination = [[self objectOrNilForKey:kDestinyInventoryBucketDefinitionHasTransferDestination fromDictionary:dict] boolValue];
            self.itemCount = [[self objectOrNilForKey:kDestinyInventoryBucketDefinitionItemCount fromDictionary:dict] doubleValue];
            self.scope = [[self objectOrNilForKey:kDestinyInventoryBucketDefinitionScope fromDictionary:dict] doubleValue];
            self.redacted = [[self objectOrNilForKey:kDestinyInventoryBucketDefinitionRedacted fromDictionary:dict] boolValue];
            self.bucketOrder = [[self objectOrNilForKey:kDestinyInventoryBucketDefinitionBucketOrder fromDictionary:dict] doubleValue];
            self.blacklisted = [[self objectOrNilForKey:kDestinyInventoryBucketDefinitionBlacklisted fromDictionary:dict] boolValue];
            self.location = [[self objectOrNilForKey:kDestinyInventoryBucketDefinitionLocation fromDictionary:dict] doubleValue];
            self.enabled = [[self objectOrNilForKey:kDestinyInventoryBucketDefinitionEnabled fromDictionary:dict] boolValue];
            self.displayProperties = [BCKDisplayProperties modelObjectWithDictionary:[dict objectForKey:kDestinyInventoryBucketDefinitionDisplayProperties]];
            self.fifo = [[self objectOrNilForKey:kDestinyInventoryBucketDefinitionFifo fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.category] forKey:kDestinyInventoryBucketDefinitionCategory];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hash] forKey:kDestinyInventoryBucketDefinitionHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kDestinyInventoryBucketDefinitionIndex];
    [mutableDict setValue:[NSNumber numberWithBool:self.hasTransferDestination] forKey:kDestinyInventoryBucketDefinitionHasTransferDestination];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemCount] forKey:kDestinyInventoryBucketDefinitionItemCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.scope] forKey:kDestinyInventoryBucketDefinitionScope];
    [mutableDict setValue:[NSNumber numberWithBool:self.redacted] forKey:kDestinyInventoryBucketDefinitionRedacted];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bucketOrder] forKey:kDestinyInventoryBucketDefinitionBucketOrder];
    [mutableDict setValue:[NSNumber numberWithBool:self.blacklisted] forKey:kDestinyInventoryBucketDefinitionBlacklisted];
    [mutableDict setValue:[NSNumber numberWithDouble:self.location] forKey:kDestinyInventoryBucketDefinitionLocation];
    [mutableDict setValue:[NSNumber numberWithBool:self.enabled] forKey:kDestinyInventoryBucketDefinitionEnabled];
    [mutableDict setValue:[self.displayProperties dictionaryRepresentation] forKey:kDestinyInventoryBucketDefinitionDisplayProperties];
    [mutableDict setValue:[NSNumber numberWithBool:self.fifo] forKey:kDestinyInventoryBucketDefinitionFifo];

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

    self.category = [aDecoder decodeDoubleForKey:kDestinyInventoryBucketDefinitionCategory];
    self.hash = [aDecoder decodeDoubleForKey:kDestinyInventoryBucketDefinitionHash];
    self.index = [aDecoder decodeDoubleForKey:kDestinyInventoryBucketDefinitionIndex];
    self.hasTransferDestination = [aDecoder decodeBoolForKey:kDestinyInventoryBucketDefinitionHasTransferDestination];
    self.itemCount = [aDecoder decodeDoubleForKey:kDestinyInventoryBucketDefinitionItemCount];
    self.scope = [aDecoder decodeDoubleForKey:kDestinyInventoryBucketDefinitionScope];
    self.redacted = [aDecoder decodeBoolForKey:kDestinyInventoryBucketDefinitionRedacted];
    self.bucketOrder = [aDecoder decodeDoubleForKey:kDestinyInventoryBucketDefinitionBucketOrder];
    self.blacklisted = [aDecoder decodeBoolForKey:kDestinyInventoryBucketDefinitionBlacklisted];
    self.location = [aDecoder decodeDoubleForKey:kDestinyInventoryBucketDefinitionLocation];
    self.enabled = [aDecoder decodeBoolForKey:kDestinyInventoryBucketDefinitionEnabled];
    self.displayProperties = [aDecoder decodeObjectForKey:kDestinyInventoryBucketDefinitionDisplayProperties];
    self.fifo = [aDecoder decodeBoolForKey:kDestinyInventoryBucketDefinitionFifo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_category forKey:kDestinyInventoryBucketDefinitionCategory];
    [aCoder encodeDouble:_hash forKey:kDestinyInventoryBucketDefinitionHash];
    [aCoder encodeDouble:_index forKey:kDestinyInventoryBucketDefinitionIndex];
    [aCoder encodeBool:_hasTransferDestination forKey:kDestinyInventoryBucketDefinitionHasTransferDestination];
    [aCoder encodeDouble:_itemCount forKey:kDestinyInventoryBucketDefinitionItemCount];
    [aCoder encodeDouble:_scope forKey:kDestinyInventoryBucketDefinitionScope];
    [aCoder encodeBool:_redacted forKey:kDestinyInventoryBucketDefinitionRedacted];
    [aCoder encodeDouble:_bucketOrder forKey:kDestinyInventoryBucketDefinitionBucketOrder];
    [aCoder encodeBool:_blacklisted forKey:kDestinyInventoryBucketDefinitionBlacklisted];
    [aCoder encodeDouble:_location forKey:kDestinyInventoryBucketDefinitionLocation];
    [aCoder encodeBool:_enabled forKey:kDestinyInventoryBucketDefinitionEnabled];
    [aCoder encodeObject:_displayProperties forKey:kDestinyInventoryBucketDefinitionDisplayProperties];
    [aCoder encodeBool:_fifo forKey:kDestinyInventoryBucketDefinitionFifo];
}

- (id)copyWithZone:(NSZone *)zone
{
    DestinyInventoryBucketDefinition *copy = [[DestinyInventoryBucketDefinition alloc] init];
    
    if (copy) {

        copy.category = self.category;
        copy.hash = self.hash;
        copy.index = self.index;
        copy.hasTransferDestination = self.hasTransferDestination;
        copy.itemCount = self.itemCount;
        copy.scope = self.scope;
        copy.redacted = self.redacted;
        copy.bucketOrder = self.bucketOrder;
        copy.blacklisted = self.blacklisted;
        copy.location = self.location;
        copy.enabled = self.enabled;
        copy.displayProperties = [self.displayProperties copyWithZone:zone];
        copy.fifo = self.fifo;
    }
    
    return copy;
}


@end

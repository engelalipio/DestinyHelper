//
//  INVCInventory.m
//
//  Created by Engel Alipio on 3/13/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVCInventory.h"
#import "INVCData.h"


NSString *const kInventoryPrivacy = @"privacy";
NSString *const kInventoryData = @"data";


@interface INVCInventory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVCInventory

@synthesize privacy = _privacy;
@synthesize data = _data;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kInventoryData,@"data",
                         kInventoryPrivacy, @"privacy",
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
            self.privacy = [[self objectOrNilForKey:kInventoryPrivacy fromDictionary:dict] doubleValue];
            self.data = [INVCData modelObjectWithDictionary:[dict objectForKey:kInventoryData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.privacy] forKey:kInventoryPrivacy];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kInventoryData];

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

    self.privacy = [aDecoder decodeDoubleForKey:kInventoryPrivacy];
    self.data = [aDecoder decodeObjectForKey:kInventoryData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_privacy forKey:kInventoryPrivacy];
    [aCoder encodeObject:_data forKey:kInventoryData];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVCInventory *copy = [[INVCInventory alloc] init];
    
    if (copy) {

        copy.privacy = self.privacy;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end

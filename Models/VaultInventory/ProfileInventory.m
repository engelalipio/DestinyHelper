//
//  ProfileInventory.m
//
//  Created by Engel Alipio on 5/17/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "ProfileInventory.h"
#import "VAULTData.h"


NSString *const kProfileInventoryPrivacy = @"privacy";
NSString *const kProfileInventoryData = @"data";


@interface ProfileInventory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProfileInventory

@synthesize privacy = _privacy;
@synthesize data = _data;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kProfileInventoryData,@"data",
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
            self.privacy = [[self objectOrNilForKey:kProfileInventoryPrivacy fromDictionary:dict] doubleValue];
            self.data = [VAULTData modelObjectWithDictionary:[dict objectForKey:kProfileInventoryData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.privacy] forKey:kProfileInventoryPrivacy];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kProfileInventoryData];

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

    self.privacy = [aDecoder decodeDoubleForKey:kProfileInventoryPrivacy];
    self.data = [aDecoder decodeObjectForKey:kProfileInventoryData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_privacy forKey:kProfileInventoryPrivacy];
    [aCoder encodeObject:_data forKey:kProfileInventoryData];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProfileInventory *copy = [[ProfileInventory alloc] init];
    
    if (copy) {

        copy.privacy = self.privacy;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end

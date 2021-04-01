//
//  Response.m
//
//  Created by Engel Alipio on 3/13/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVCResponse.h"
#import "INVCInventory.h"


NSString *const kINVCResponseInventory = @"inventory";


@interface INVCResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVCResponse

@synthesize inventory = _inventory;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kINVCResponseInventory,@"inventory",
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
            self.inventory = [INVCInventory modelObjectWithDictionary:[dict objectForKey:kINVCResponseInventory]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.inventory dictionaryRepresentation] forKey:kINVCResponseInventory];

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

    self.inventory = [aDecoder decodeObjectForKey:kINVCResponseInventory];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_inventory forKey:kINVCResponseInventory];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVCResponse *copy = [[INVCResponse alloc] init];
    
    if (copy) {

        copy.inventory = [self.inventory copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  Groups.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsGroups.h"


NSString *const kVNDDetailsGroupsVendorGroupHash = @"vendorGroupHash";


@interface VNDDetailsGroups ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsGroups

@synthesize vendorGroupHash = _vendorGroupHash;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kVNDDetailsGroupsVendorGroupHash,@"vendorGroupHash",
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
            self.vendorGroupHash = [[self objectOrNilForKey:kVNDDetailsGroupsVendorGroupHash fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vendorGroupHash] forKey:kVNDDetailsGroupsVendorGroupHash];

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

    self.vendorGroupHash = [aDecoder decodeDoubleForKey:kVNDDetailsGroupsVendorGroupHash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_vendorGroupHash forKey:kVNDDetailsGroupsVendorGroupHash];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsGroups *copy = [[VNDDetailsGroups alloc] init];
    
    if (copy) {

        copy.vendorGroupHash = self.vendorGroupHash;
    }
    
    return copy;
}


@end

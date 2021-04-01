//
//  Groups.m
//
//  Created by Engel Alipio on 2/28/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDGroups.h"


NSString *const kGroupsVendorGroupHash = @"vendorGroupHash";
NSString *const kGroupsVendorHashes = @"vendorHashes";


@interface VNDGroups ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDGroups

@synthesize vendorGroupHash = _vendorGroupHash;
@synthesize vendorHashes = _vendorHashes;


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
            self.vendorGroupHash = [[self objectOrNilForKey:kGroupsVendorGroupHash fromDictionary:dict] doubleValue];
            self.vendorHashes = [self objectOrNilForKey:kGroupsVendorHashes fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.vendorGroupHash] forKey:kGroupsVendorGroupHash];
    NSMutableArray *tempArrayForVendorHashes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.vendorHashes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForVendorHashes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForVendorHashes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForVendorHashes] forKey:kGroupsVendorHashes];

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

    self.vendorGroupHash = [aDecoder decodeDoubleForKey:kGroupsVendorGroupHash];
    self.vendorHashes = [aDecoder decodeObjectForKey:kGroupsVendorHashes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_vendorGroupHash forKey:kGroupsVendorGroupHash];
    [aCoder encodeObject:_vendorHashes forKey:kGroupsVendorHashes];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDGroups *copy = [[VNDGroups alloc] init];
    
    if (copy) {

        copy.vendorGroupHash = self.vendorGroupHash;
        copy.vendorHashes = [self.vendorHashes copyWithZone:zone];
    }
    
    return copy;
}


@end

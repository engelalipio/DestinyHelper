//
//  Vendors.m
//
//  Created by Engel Alipio on 2/28/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDVendors.h"
#import "VNDData.h"


NSString *const kVendorsPrivacy = @"privacy";
NSString *const kVendorsData = @"data";


@interface VNDVendors ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDVendors

@synthesize privacy = _privacy;
@synthesize data = _data;


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
            self.privacy = [[self objectOrNilForKey:kVendorsPrivacy fromDictionary:dict] doubleValue];
            self.data = [VNDData modelObjectWithDictionary:[dict objectForKey:kVendorsData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.privacy] forKey:kVendorsPrivacy];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kVendorsData];

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

    self.privacy = [aDecoder decodeDoubleForKey:kVendorsPrivacy];
    self.data = [aDecoder decodeObjectForKey:kVendorsData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_privacy forKey:kVendorsPrivacy];
    [aCoder encodeObject:_data forKey:kVendorsData];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDVendors *copy = [[VNDVendors alloc] init];
    
    if (copy) {

        copy.privacy = self.privacy;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end

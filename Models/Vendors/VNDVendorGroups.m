//
//  VendorGroups.m
//
//  Created by Engel Alipio on 2/28/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDVendorGroups.h"
#import "VNDData.h"


NSString *const kVendorGroupsPrivacy = @"privacy";
NSString *const kVendorGroupsData = @"data";


@interface VNDVendorGroups ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDVendorGroups

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
            self.privacy = [[self objectOrNilForKey:kVendorGroupsPrivacy fromDictionary:dict] doubleValue];
            self.data = [VNDData modelObjectWithDictionary:[dict objectForKey:kVendorGroupsData]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.privacy] forKey:kVendorGroupsPrivacy];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kVendorGroupsData];

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

    self.privacy = [aDecoder decodeDoubleForKey:kVendorGroupsPrivacy];
    self.data = [aDecoder decodeObjectForKey:kVendorGroupsData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_privacy forKey:kVendorGroupsPrivacy];
    [aCoder encodeObject:_data forKey:kVendorGroupsData];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDVendorGroups *copy = [[VNDVendorGroups alloc] init];
    
    if (copy) {

        copy.privacy = self.privacy;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end

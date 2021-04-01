//
//  Response.m
//
//  Created by Engel Alipio on 2/28/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDResponse.h"
#import "VNDCurrencyLookups.h"
#import "VNDVendorGroups.h"
#import "VNDCategories.h"
#import "VNDVendors.h"
#import "VNDSales.h"


NSString *const kResponseCurrencyLookups = @"currencyLookups";
NSString *const kResponseVendorGroups = @"vendorGroups";
NSString *const kResponseCategories = @"categories";
NSString *const kResponseVendors = @"vendors";
NSString *const kResponseSales = @"sales";


@interface VNDResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDResponse

@synthesize currencyLookups = _currencyLookups;
@synthesize vendorGroups = _vendorGroups;
@synthesize categories = _categories;
@synthesize vendors = _vendors;
@synthesize sales = _sales;


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
            self.currencyLookups = [VNDCurrencyLookups modelObjectWithDictionary:[dict objectForKey:kResponseCurrencyLookups]];
            self.vendorGroups = [VNDVendorGroups modelObjectWithDictionary:[dict objectForKey:kResponseVendorGroups]];
            self.categories = [VNDCategories modelObjectWithDictionary:[dict objectForKey:kResponseCategories]];
            self.vendors = [VNDVendors modelObjectWithDictionary:[dict objectForKey:kResponseVendors]];
            self.sales = [VNDSales modelObjectWithDictionary:[dict objectForKey:kResponseSales]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.currencyLookups dictionaryRepresentation] forKey:kResponseCurrencyLookups];
    [mutableDict setValue:[self.vendorGroups dictionaryRepresentation] forKey:kResponseVendorGroups];
    [mutableDict setValue:[self.categories dictionaryRepresentation] forKey:kResponseCategories];
    [mutableDict setValue:[self.vendors dictionaryRepresentation] forKey:kResponseVendors];
    [mutableDict setValue:[self.sales dictionaryRepresentation] forKey:kResponseSales];

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

    self.currencyLookups = [aDecoder decodeObjectForKey:kResponseCurrencyLookups];
    self.vendorGroups = [aDecoder decodeObjectForKey:kResponseVendorGroups];
    self.categories = [aDecoder decodeObjectForKey:kResponseCategories];
    self.vendors = [aDecoder decodeObjectForKey:kResponseVendors];
    self.sales = [aDecoder decodeObjectForKey:kResponseSales];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_currencyLookups forKey:kResponseCurrencyLookups];
    [aCoder encodeObject:_vendorGroups forKey:kResponseVendorGroups];
    [aCoder encodeObject:_categories forKey:kResponseCategories];
    [aCoder encodeObject:_vendors forKey:kResponseVendors];
    [aCoder encodeObject:_sales forKey:kResponseSales];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDResponse *copy = [[VNDResponse alloc] init];
    
    if (copy) {

        copy.currencyLookups = [self.currencyLookups copyWithZone:zone];
        copy.vendorGroups = [self.vendorGroups copyWithZone:zone];
        copy.categories = [self.categories copyWithZone:zone];
        copy.vendors = [self.vendors copyWithZone:zone];
        copy.sales = [self.sales copyWithZone:zone];
    }
    
    return copy;
}


@end

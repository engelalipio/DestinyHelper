//
//  GRDInventory.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDInventory.h"
#import "GRDCurrencies.h"


NSString *const kGRDInventoryItems = @"items";
NSString *const kGRDInventoryCurrencies = @"currencies";


@interface GRDInventory ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDInventory

@synthesize items = _items;
@synthesize currencies = _currencies;


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
            self.items = [self objectOrNilForKey:kGRDInventoryItems fromDictionary:dict];
    NSObject *receivedGRDCurrencies = [dict objectForKey:kGRDInventoryCurrencies];
    NSMutableArray *parsedGRDCurrencies = [NSMutableArray array];
    if ([receivedGRDCurrencies isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGRDCurrencies) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGRDCurrencies addObject:[GRDCurrencies modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGRDCurrencies isKindOfClass:[NSDictionary class]]) {
       [parsedGRDCurrencies addObject:[GRDCurrencies modelObjectWithDictionary:(NSDictionary *)receivedGRDCurrencies]];
    }

    self.currencies = [NSArray arrayWithArray:parsedGRDCurrencies];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForItems = [NSMutableArray array];
    for (NSObject *subArrayObject in self.items) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForItems addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForItems addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kGRDInventoryItems];
    NSMutableArray *tempArrayForCurrencies = [NSMutableArray array];
    for (NSObject *subArrayObject in self.currencies) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCurrencies addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCurrencies addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCurrencies] forKey:kGRDInventoryCurrencies];

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

    self.items = [aDecoder decodeObjectForKey:kGRDInventoryItems];
    self.currencies = [aDecoder decodeObjectForKey:kGRDInventoryCurrencies];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kGRDInventoryItems];
    [aCoder encodeObject:_currencies forKey:kGRDInventoryCurrencies];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDInventory *copy = [[GRDInventory alloc] init];
    
    if (copy) {

        copy.items = [self.items copyWithZone:zone];
        copy.currencies = [self.currencies copyWithZone:zone];
    }
    
    return copy;
}


@end

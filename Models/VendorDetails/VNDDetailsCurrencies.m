//
//  Currencies.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsCurrencies.h"


NSString *const kCurrenciesQuantity = @"quantity";
NSString *const kCurrenciesScalarDenominator = @"scalarDenominator";
NSString *const kCurrenciesItemHash = @"itemHash";


@interface VNDDetailsCurrencies ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsCurrencies

@synthesize quantity = _quantity;
@synthesize scalarDenominator = _scalarDenominator;
@synthesize itemHash = _itemHash;




+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kCurrenciesItemHash,@"itemHash",
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
            self.quantity = [[self objectOrNilForKey:kCurrenciesQuantity fromDictionary:dict] doubleValue];
            self.scalarDenominator = [[self objectOrNilForKey:kCurrenciesScalarDenominator fromDictionary:dict] doubleValue];
            self.itemHash = [[self objectOrNilForKey:kCurrenciesItemHash fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.quantity] forKey:kCurrenciesQuantity];
    [mutableDict setValue:[NSNumber numberWithDouble:self.scalarDenominator] forKey:kCurrenciesScalarDenominator];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemHash] forKey:kCurrenciesItemHash];

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

    self.quantity = [aDecoder decodeDoubleForKey:kCurrenciesQuantity];
    self.scalarDenominator = [aDecoder decodeDoubleForKey:kCurrenciesScalarDenominator];
    self.itemHash = [aDecoder decodeDoubleForKey:kCurrenciesItemHash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_quantity forKey:kCurrenciesQuantity];
    [aCoder encodeDouble:_scalarDenominator forKey:kCurrenciesScalarDenominator];
    [aCoder encodeDouble:_itemHash forKey:kCurrenciesItemHash];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsCurrencies *copy = [[VNDDetailsCurrencies alloc] init];
    
    if (copy) {

        copy.quantity = self.quantity;
        copy.scalarDenominator = self.scalarDenominator;
        copy.itemHash = self.itemHash;
    }
    
    return copy;
}


@end

//
//  GRDCurrencies.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDCurrencies.h"


NSString *const kGRDCurrenciesValue = @"value";
NSString *const kGRDCurrenciesItemHash = @"itemHash";


@interface GRDCurrencies ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDCurrencies

@synthesize value = _value;
@synthesize itemHash = _itemHash;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kGRDCurrenciesItemHash,@"itemHash",
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
            self.value = [[self objectOrNilForKey:kGRDCurrenciesValue fromDictionary:dict] doubleValue];
            self.itemHash = [[self objectOrNilForKey:kGRDCurrenciesItemHash fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.value] forKey:kGRDCurrenciesValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemHash] forKey:kGRDCurrenciesItemHash];

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

    self.value = [aDecoder decodeDoubleForKey:kGRDCurrenciesValue];
    self.itemHash = [aDecoder decodeDoubleForKey:kGRDCurrenciesItemHash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_value forKey:kGRDCurrenciesValue];
    [aCoder encodeDouble:_itemHash forKey:kGRDCurrenciesItemHash];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDCurrencies *copy = [[GRDCurrencies alloc] init];
    
    if (copy) {

        copy.value = self.value;
        copy.itemHash = self.itemHash;
    }
    
    return copy;
}


@end

//
//  GRDEquipment.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDEquipment.h"


NSString *const kGRDEquipmentDyes = @"dyes";
NSString *const kGRDEquipmentItemHash = @"itemHash";


@interface GRDEquipment ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDEquipment

@synthesize dyes = _dyes;
@synthesize itemHash = _itemHash;


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
            self.dyes = [self objectOrNilForKey:kGRDEquipmentDyes fromDictionary:dict];
            self.itemHash = [[self objectOrNilForKey:kGRDEquipmentItemHash fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForDyes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.dyes) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDyes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDyes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDyes] forKey:kGRDEquipmentDyes];
    [mutableDict setValue:[NSNumber numberWithDouble:self.itemHash] forKey:kGRDEquipmentItemHash];

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

    self.dyes = [aDecoder decodeObjectForKey:kGRDEquipmentDyes];
    self.itemHash = [aDecoder decodeDoubleForKey:kGRDEquipmentItemHash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dyes forKey:kGRDEquipmentDyes];
    [aCoder encodeDouble:_itemHash forKey:kGRDEquipmentItemHash];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDEquipment *copy = [[GRDEquipment alloc] init];
    
    if (copy) {

        copy.dyes = [self.dyes copyWithZone:zone];
        copy.itemHash = self.itemHash;
    }
    
    return copy;
}


@end

//
//  INVCData.m
//
//  Created by Engel Alipio on 3/13/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVCData.h"
#import "INVCItems.h"


NSString *const kDataItems = @"items";


@interface INVCData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVCData

@synthesize items = _items;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kDataItems,@"items",
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
    NSObject *receivedItems = [dict objectForKey:kDataItems];
    NSMutableArray *parsedItems = [NSMutableArray array];
    if ([receivedItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedItems addObject:[INVCItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedItems isKindOfClass:[NSDictionary class]]) {
       [parsedItems addObject:[INVCItems modelObjectWithDictionary:(NSDictionary *)receivedItems]];
    }

    self.items = [NSArray arrayWithArray:parsedItems];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kDataItems];

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

    self.items = [aDecoder decodeObjectForKey:kDataItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kDataItems];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVCData *copy = [[INVCData alloc] init];
    
    if (copy) {

        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end

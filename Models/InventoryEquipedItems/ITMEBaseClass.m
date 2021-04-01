//
//  ITMEBaseClass.m
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "ITMEBaseClass.h"
#import "ITMEItems.h"


NSString *const kITMEBaseClassItems = @"items";


@interface ITMEBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITMEBaseClass

@synthesize items = _items;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kITMEBaseClassItems,@"items",
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
    NSObject *receivedItems = [dict objectForKey:kITMEBaseClassItems];
    NSMutableArray *parsedItems = [NSMutableArray array];
    if ([receivedItems isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedItems) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedItems addObject:[ITMEItems modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedItems isKindOfClass:[NSDictionary class]]) {
       [parsedItems addObject:[ITMEItems modelObjectWithDictionary:(NSDictionary *)receivedItems]];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForItems] forKey:kITMEBaseClassItems];

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

    self.items = [aDecoder decodeObjectForKey:kITMEBaseClassItems];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_items forKey:kITMEBaseClassItems];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITMEBaseClass *copy = [[ITMEBaseClass alloc] init];
    
    if (copy) {

        copy.items = [self.items copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  INVDSockets.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVDSockets.h"
#import "INVDSocketCategories.h"
//#import "IntrinsicSockets.h"
#import "INVDSocketEntries.h"


NSString *const kSocketsSocketCategories = @"socketCategories";
NSString *const kSocketsIntrinsicSockets = @"intrinsicSockets";
NSString *const kSocketsDetail = @"detail";
NSString *const kSocketsSocketEntries = @"socketEntries";


@interface INVDSockets ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVDSockets

@synthesize socketCategories = _socketCategories;
@synthesize intrinsicSockets = _intrinsicSockets;
@synthesize detail = _detail;
@synthesize socketEntries = _socketEntries;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kSocketsDetail,@"detail",
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
    NSObject *receivedSocketCategories = [dict objectForKey:kSocketsSocketCategories];
    NSMutableArray *parsedSocketCategories = [NSMutableArray array];
    if ([receivedSocketCategories isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSocketCategories) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSocketCategories addObject:[INVDSocketCategories modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSocketCategories isKindOfClass:[NSDictionary class]]) {
       [parsedSocketCategories addObject:[INVDSocketCategories modelObjectWithDictionary:(NSDictionary *)receivedSocketCategories]];
    }

    self.socketCategories = [NSArray arrayWithArray:parsedSocketCategories];
    NSObject *receivedIntrinsicSockets = [dict objectForKey:kSocketsIntrinsicSockets];
    NSMutableArray *parsedIntrinsicSockets = [NSMutableArray array];
    if ([receivedIntrinsicSockets isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedIntrinsicSockets) {
            if ([item isKindOfClass:[NSDictionary class]]) {
            //    [parsedIntrinsicSockets addObject:[IntrinsicSockets modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedIntrinsicSockets isKindOfClass:[NSDictionary class]]) {
     //  [parsedIntrinsicSockets addObject:[IntrinsicSockets modelObjectWithDictionary:(NSDictionary *)receivedIntrinsicSockets]];
    }

    self.intrinsicSockets = [NSArray arrayWithArray:parsedIntrinsicSockets];
            self.detail = [self objectOrNilForKey:kSocketsDetail fromDictionary:dict];
    NSObject *receivedSocketEntries = [dict objectForKey:kSocketsSocketEntries];
    NSMutableArray *parsedSocketEntries = [NSMutableArray array];
    if ([receivedSocketEntries isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSocketEntries) {
            if ([item isKindOfClass:[NSDictionary class]]) {
            //    [parsedSocketEntries addObject:[SocketEntries modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSocketEntries isKindOfClass:[NSDictionary class]]) {
     //  [parsedSocketEntries addObject:[SocketEntries modelObjectWithDictionary:(NSDictionary *)receivedSocketEntries]];
    }

    self.socketEntries = [NSArray arrayWithArray:parsedSocketEntries];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForSocketCategories = [NSMutableArray array];
    for (NSObject *subArrayObject in self.socketCategories) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSocketCategories addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSocketCategories addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSocketCategories] forKey:kSocketsSocketCategories];
    NSMutableArray *tempArrayForIntrinsicSockets = [NSMutableArray array];
    for (NSObject *subArrayObject in self.intrinsicSockets) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIntrinsicSockets addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIntrinsicSockets addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIntrinsicSockets] forKey:kSocketsIntrinsicSockets];
    [mutableDict setValue:self.detail forKey:kSocketsDetail];
    NSMutableArray *tempArrayForSocketEntries = [NSMutableArray array];
    for (NSObject *subArrayObject in self.socketEntries) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSocketEntries addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSocketEntries addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSocketEntries] forKey:kSocketsSocketEntries];

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

    self.socketCategories = [aDecoder decodeObjectForKey:kSocketsSocketCategories];
    self.intrinsicSockets = [aDecoder decodeObjectForKey:kSocketsIntrinsicSockets];
    self.detail = [aDecoder decodeObjectForKey:kSocketsDetail];
    self.socketEntries = [aDecoder decodeObjectForKey:kSocketsSocketEntries];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_socketCategories forKey:kSocketsSocketCategories];
    [aCoder encodeObject:_intrinsicSockets forKey:kSocketsIntrinsicSockets];
    [aCoder encodeObject:_detail forKey:kSocketsDetail];
    [aCoder encodeObject:_socketEntries forKey:kSocketsSocketEntries];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVDSockets *copy = [[INVDSockets alloc] init];
    
    if (copy) {

        copy.socketCategories = [self.socketCategories copyWithZone:zone];
        copy.intrinsicSockets = [self.intrinsicSockets copyWithZone:zone];
        copy.detail = [self.detail copyWithZone:zone];
        copy.socketEntries = [self.socketEntries copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  ITMTBaseClass.m
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "ITMTBaseClass.h"
#import "DestinyItemTierTypeDefinition.h"


NSString *const kITMTBaseClassDestinyItemTierDefinition = @"DestinyItemTierDefinition";


@interface ITMTBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITMTBaseClass

@synthesize destinyItemTierDefinition = _destinyItemTierDefinition;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kITMTBaseClassDestinyItemTierDefinition,@"DestinyItemTierDefinition",
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
            self.destinyItemTierDefinition = [DestinyItemTierTypeDefinition modelObjectWithDictionary:[dict objectForKey:kITMTBaseClassDestinyItemTierDefinition]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.destinyItemTierDefinition dictionaryRepresentation] forKey:kITMTBaseClassDestinyItemTierDefinition];

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

    self.destinyItemTierDefinition = [aDecoder decodeObjectForKey:kITMTBaseClassDestinyItemTierDefinition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_destinyItemTierDefinition forKey:kITMTBaseClassDestinyItemTierDefinition];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITMTBaseClass *copy = [[ITMTBaseClass alloc] init];
    
    if (copy) {

        copy.destinyItemTierDefinition = [self.destinyItemTierDefinition copyWithZone:zone];
    }
    
    return copy;
}


@end

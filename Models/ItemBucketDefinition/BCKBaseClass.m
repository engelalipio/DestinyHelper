//
//  BCKBaseClass.m
//
//  Created by Engel Alipio on 3/9/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "BCKBaseClass.h"
#import "DestinyInventoryBucketDefinition.h"


NSString *const kBCKBaseClassDestinyInventoryBucketDefinition = @"DestinyInventoryBucketDefinition";


@interface BCKBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BCKBaseClass

@synthesize destinyInventoryBucketDefinition = _destinyInventoryBucketDefinition;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kBCKBaseClassDestinyInventoryBucketDefinition,@"DestinyInventoryBucketDefinition",
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
            self.destinyInventoryBucketDefinition = [DestinyInventoryBucketDefinition modelObjectWithDictionary:[dict objectForKey:kBCKBaseClassDestinyInventoryBucketDefinition]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.destinyInventoryBucketDefinition dictionaryRepresentation] forKey:kBCKBaseClassDestinyInventoryBucketDefinition];

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

    self.destinyInventoryBucketDefinition = [aDecoder decodeObjectForKey:kBCKBaseClassDestinyInventoryBucketDefinition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_destinyInventoryBucketDefinition forKey:kBCKBaseClassDestinyInventoryBucketDefinition];
}

- (id)copyWithZone:(NSZone *)zone
{
    BCKBaseClass *copy = [[BCKBaseClass alloc] init];
    
    if (copy) {

        copy.destinyInventoryBucketDefinition = [self.destinyInventoryBucketDefinition copyWithZone:zone];
    }
    
    return copy;
}


@end

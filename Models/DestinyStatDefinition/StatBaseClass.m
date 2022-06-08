//
//  StatBaseClass.m
//
//  Created by Engel Alipio on 6/6/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "StatBaseClass.h"
#import "DestinyStatDefinition.h"


NSString *const kStatBaseClassDestinyStatDefinition = @"DestinyStatDefinition";


@interface StatBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation StatBaseClass

@synthesize destinyStatDefinition = _destinyStatDefinition;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kStatBaseClassDestinyStatDefinition,@"DestinyStatDefinition",
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
            self.destinyStatDefinition = [DestinyStatDefinition modelObjectWithDictionary:[dict objectForKey:kStatBaseClassDestinyStatDefinition]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.destinyStatDefinition dictionaryRepresentation] forKey:kStatBaseClassDestinyStatDefinition];

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

    self.destinyStatDefinition = [aDecoder decodeObjectForKey:kStatBaseClassDestinyStatDefinition];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_destinyStatDefinition forKey:kStatBaseClassDestinyStatDefinition];
}

- (id)copyWithZone:(NSZone *)zone
{
    StatBaseClass *copy = [[StatBaseClass alloc] init];
    
    if (copy) {

        copy.destinyStatDefinition = [self.destinyStatDefinition copyWithZone:zone];
    }
    
    return copy;
}


@end

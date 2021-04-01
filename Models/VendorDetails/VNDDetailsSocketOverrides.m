//
//  SocketOverrides.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsSocketOverrides.h"


NSString *const kSocketOverridesRandomizedOptionsCount = @"randomizedOptionsCount";
NSString *const kSocketOverridesSocketTypeHash = @"socketTypeHash";


@interface VNDDetailsSocketOverrides ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsSocketOverrides

@synthesize randomizedOptionsCount = _randomizedOptionsCount;
@synthesize socketTypeHash = _socketTypeHash;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kSocketOverridesSocketTypeHash,@"socketTypeHash",
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
            self.randomizedOptionsCount = [[self objectOrNilForKey:kSocketOverridesRandomizedOptionsCount fromDictionary:dict] doubleValue];
            self.socketTypeHash = [[self objectOrNilForKey:kSocketOverridesSocketTypeHash fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.randomizedOptionsCount] forKey:kSocketOverridesRandomizedOptionsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.socketTypeHash] forKey:kSocketOverridesSocketTypeHash];

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

    self.randomizedOptionsCount = [aDecoder decodeDoubleForKey:kSocketOverridesRandomizedOptionsCount];
    self.socketTypeHash = [aDecoder decodeDoubleForKey:kSocketOverridesSocketTypeHash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_randomizedOptionsCount forKey:kSocketOverridesRandomizedOptionsCount];
    [aCoder encodeDouble:_socketTypeHash forKey:kSocketOverridesSocketTypeHash];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsSocketOverrides *copy = [[VNDDetailsSocketOverrides alloc] init];
    
    if (copy) {

        copy.randomizedOptionsCount = self.randomizedOptionsCount;
        copy.socketTypeHash = self.socketTypeHash;
    }
    
    return copy;
}


@end

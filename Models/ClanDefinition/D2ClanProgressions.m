//
//  D2ClanProgressions.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "D2ClanProgressions.h"
#import "ProgressionHashKey.h"


NSString *const kD2ClanProgressionsProgressionHashKey = @"progressionHashKey";


@interface D2ClanProgressions ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation D2ClanProgressions

@synthesize progressionHashKey = _progressionHashKey;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kD2ClanProgressionsProgressionHashKey,@"progressionHashKey",
                         nil];
    
    return map;
}

+ (NSString *)key{
    return @"progressionHash";
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
            self.progressionHashKey = [ProgressionHashKey modelObjectWithDictionary:[dict objectForKey:kD2ClanProgressionsProgressionHashKey]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.progressionHashKey dictionaryRepresentation] forKey:kD2ClanProgressionsProgressionHashKey];

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

    self.progressionHashKey = [aDecoder decodeObjectForKey:kD2ClanProgressionsProgressionHashKey];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_progressionHashKey forKey:kD2ClanProgressionsProgressionHashKey];
}

- (id)copyWithZone:(NSZone *)zone
{
    D2ClanProgressions *copy = [[D2ClanProgressions alloc] init];
    
    if (copy) {

        copy.progressionHashKey = [self.progressionHashKey copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  CreationLevels.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsCreationLevels.h"


NSString *const kCreationLevelsLevel = @"level";


@interface VNDDetailsCreationLevels ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsCreationLevels

@synthesize level = _level;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kCreationLevelsLevel,@"level",
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
            self.level = [[self objectOrNilForKey:kCreationLevelsLevel fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kCreationLevelsLevel];

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

    self.level = [aDecoder decodeDoubleForKey:kCreationLevelsLevel];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_level forKey:kCreationLevelsLevel];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsCreationLevels *copy = [[VNDDetailsCreationLevels alloc] init];
    
    if (copy) {

        copy.level = self.level;
    }
    
    return copy;
}


@end

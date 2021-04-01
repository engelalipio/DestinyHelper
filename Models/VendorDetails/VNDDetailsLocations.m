//
//  Locations.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsLocations.h"


NSString *const kLocationsBackgroundImagePath = @"backgroundImagePath";
NSString *const kLocationsDestinationHash = @"destinationHash";


@interface VNDDetailsLocations ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsLocations

@synthesize backgroundImagePath = _backgroundImagePath;
@synthesize destinationHash = _destinationHash;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kLocationsDestinationHash,@"destinationHash",
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
            self.backgroundImagePath = [self objectOrNilForKey:kLocationsBackgroundImagePath fromDictionary:dict];
            self.destinationHash = [[self objectOrNilForKey:kLocationsDestinationHash fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.backgroundImagePath forKey:kLocationsBackgroundImagePath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.destinationHash] forKey:kLocationsDestinationHash];

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

    self.backgroundImagePath = [aDecoder decodeObjectForKey:kLocationsBackgroundImagePath];
    self.destinationHash = [aDecoder decodeDoubleForKey:kLocationsDestinationHash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_backgroundImagePath forKey:kLocationsBackgroundImagePath];
    [aCoder encodeDouble:_destinationHash forKey:kLocationsDestinationHash];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsLocations *copy = [[VNDDetailsLocations alloc] init];
    
    if (copy) {

        copy.backgroundImagePath = [self.backgroundImagePath copyWithZone:zone];
        copy.destinationHash = self.destinationHash;
    }
    
    return copy;
}


@end

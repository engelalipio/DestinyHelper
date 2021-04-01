//
//  InfusionProcess.m
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "ITMTInfusionProcess.h"


NSString *const kInfusionProcessBaseQualityTransferRatio = @"baseQualityTransferRatio";
NSString *const kInfusionProcessMinimumQualityIncrement = @"minimumQualityIncrement";


@interface ITMTInfusionProcess ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ITMTInfusionProcess

@synthesize baseQualityTransferRatio = _baseQualityTransferRatio;
@synthesize minimumQualityIncrement = _minimumQualityIncrement;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kInfusionProcessMinimumQualityIncrement,@"minimumQualityIncrement",
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
            self.baseQualityTransferRatio = [[self objectOrNilForKey:kInfusionProcessBaseQualityTransferRatio fromDictionary:dict] doubleValue];
            self.minimumQualityIncrement = [[self objectOrNilForKey:kInfusionProcessMinimumQualityIncrement fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.baseQualityTransferRatio] forKey:kInfusionProcessBaseQualityTransferRatio];
    [mutableDict setValue:[NSNumber numberWithDouble:self.minimumQualityIncrement] forKey:kInfusionProcessMinimumQualityIncrement];

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

    self.baseQualityTransferRatio = [aDecoder decodeDoubleForKey:kInfusionProcessBaseQualityTransferRatio];
    self.minimumQualityIncrement = [aDecoder decodeDoubleForKey:kInfusionProcessMinimumQualityIncrement];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_baseQualityTransferRatio forKey:kInfusionProcessBaseQualityTransferRatio];
    [aCoder encodeDouble:_minimumQualityIncrement forKey:kInfusionProcessMinimumQualityIncrement];
}

- (id)copyWithZone:(NSZone *)zone
{
    ITMTInfusionProcess *copy = [[ITMTInfusionProcess alloc] init];
    
    if (copy) {

        copy.baseQualityTransferRatio = self.baseQualityTransferRatio;
        copy.minimumQualityIncrement = self.minimumQualityIncrement;
    }
    
    return copy;
}


@end

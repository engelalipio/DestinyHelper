//
//  GRDSTATDEFENSE.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDSTATDEFENSE.h"


NSString *const kGRDSTATDEFENSEValue = @"value";
NSString *const kGRDSTATDEFENSEStatHash = @"statHash";
NSString *const kGRDSTATDEFENSEMaximumValue = @"maximumValue";


@interface GRDSTATDEFENSE ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDSTATDEFENSE

@synthesize value = _value;
@synthesize statHash = _statHash;
@synthesize maximumValue = _maximumValue;


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
            self.value = [[self objectOrNilForKey:kGRDSTATDEFENSEValue fromDictionary:dict] doubleValue];
            self.statHash = [[self objectOrNilForKey:kGRDSTATDEFENSEStatHash fromDictionary:dict] doubleValue];
            self.maximumValue = [[self objectOrNilForKey:kGRDSTATDEFENSEMaximumValue fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.value] forKey:kGRDSTATDEFENSEValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statHash] forKey:kGRDSTATDEFENSEStatHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maximumValue] forKey:kGRDSTATDEFENSEMaximumValue];

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

    self.value = [aDecoder decodeDoubleForKey:kGRDSTATDEFENSEValue];
    self.statHash = [aDecoder decodeDoubleForKey:kGRDSTATDEFENSEStatHash];
    self.maximumValue = [aDecoder decodeDoubleForKey:kGRDSTATDEFENSEMaximumValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_value forKey:kGRDSTATDEFENSEValue];
    [aCoder encodeDouble:_statHash forKey:kGRDSTATDEFENSEStatHash];
    [aCoder encodeDouble:_maximumValue forKey:kGRDSTATDEFENSEMaximumValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDSTATDEFENSE *copy = [[GRDSTATDEFENSE alloc] init];
    
    if (copy) {

        copy.value = self.value;
        copy.statHash = self.statHash;
        copy.maximumValue = self.maximumValue;
    }
    
    return copy;
}


@end

//
//  GRDSTATARMOR.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDSTATARMOR.h"


NSString *const kGRDSTATARMORValue = @"value";
NSString *const kGRDSTATARMORStatHash = @"statHash";
NSString *const kGRDSTATARMORMaximumValue = @"maximumValue";


@interface GRDSTATARMOR ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDSTATARMOR

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
            self.value = [[self objectOrNilForKey:kGRDSTATARMORValue fromDictionary:dict] doubleValue];
            self.statHash = [[self objectOrNilForKey:kGRDSTATARMORStatHash fromDictionary:dict] doubleValue];
            self.maximumValue = [[self objectOrNilForKey:kGRDSTATARMORMaximumValue fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.value] forKey:kGRDSTATARMORValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statHash] forKey:kGRDSTATARMORStatHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maximumValue] forKey:kGRDSTATARMORMaximumValue];

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

    self.value = [aDecoder decodeDoubleForKey:kGRDSTATARMORValue];
    self.statHash = [aDecoder decodeDoubleForKey:kGRDSTATARMORStatHash];
    self.maximumValue = [aDecoder decodeDoubleForKey:kGRDSTATARMORMaximumValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_value forKey:kGRDSTATARMORValue];
    [aCoder encodeDouble:_statHash forKey:kGRDSTATARMORStatHash];
    [aCoder encodeDouble:_maximumValue forKey:kGRDSTATARMORMaximumValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDSTATARMOR *copy = [[GRDSTATARMOR alloc] init];
    
    if (copy) {

        copy.value = self.value;
        copy.statHash = self.statHash;
        copy.maximumValue = self.maximumValue;
    }
    
    return copy;
}


@end

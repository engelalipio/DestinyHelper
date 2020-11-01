//
//  GRDSTATOPTICS.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDSTATOPTICS.h"


NSString *const kGRDSTATOPTICSValue = @"value";
NSString *const kGRDSTATOPTICSStatHash = @"statHash";
NSString *const kGRDSTATOPTICSMaximumValue = @"maximumValue";


@interface GRDSTATOPTICS ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDSTATOPTICS

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
            self.value = [[self objectOrNilForKey:kGRDSTATOPTICSValue fromDictionary:dict] doubleValue];
            self.statHash = [[self objectOrNilForKey:kGRDSTATOPTICSStatHash fromDictionary:dict] doubleValue];
            self.maximumValue = [[self objectOrNilForKey:kGRDSTATOPTICSMaximumValue fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.value] forKey:kGRDSTATOPTICSValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statHash] forKey:kGRDSTATOPTICSStatHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maximumValue] forKey:kGRDSTATOPTICSMaximumValue];

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

    self.value = [aDecoder decodeDoubleForKey:kGRDSTATOPTICSValue];
    self.statHash = [aDecoder decodeDoubleForKey:kGRDSTATOPTICSStatHash];
    self.maximumValue = [aDecoder decodeDoubleForKey:kGRDSTATOPTICSMaximumValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_value forKey:kGRDSTATOPTICSValue];
    [aCoder encodeDouble:_statHash forKey:kGRDSTATOPTICSStatHash];
    [aCoder encodeDouble:_maximumValue forKey:kGRDSTATOPTICSMaximumValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDSTATOPTICS *copy = [[GRDSTATOPTICS alloc] init];
    
    if (copy) {

        copy.value = self.value;
        copy.statHash = self.statHash;
        copy.maximumValue = self.maximumValue;
    }
    
    return copy;
}


@end

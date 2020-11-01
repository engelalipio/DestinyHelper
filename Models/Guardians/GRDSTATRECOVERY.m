//
//  GRDSTATRECOVERY.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDSTATRECOVERY.h"


NSString *const kGRDSTATRECOVERYValue = @"value";
NSString *const kGRDSTATRECOVERYStatHash = @"statHash";
NSString *const kGRDSTATRECOVERYMaximumValue = @"maximumValue";


@interface GRDSTATRECOVERY ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDSTATRECOVERY

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
            self.value = [[self objectOrNilForKey:kGRDSTATRECOVERYValue fromDictionary:dict] doubleValue];
            self.statHash = [[self objectOrNilForKey:kGRDSTATRECOVERYStatHash fromDictionary:dict] doubleValue];
            self.maximumValue = [[self objectOrNilForKey:kGRDSTATRECOVERYMaximumValue fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.value] forKey:kGRDSTATRECOVERYValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statHash] forKey:kGRDSTATRECOVERYStatHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maximumValue] forKey:kGRDSTATRECOVERYMaximumValue];

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

    self.value = [aDecoder decodeDoubleForKey:kGRDSTATRECOVERYValue];
    self.statHash = [aDecoder decodeDoubleForKey:kGRDSTATRECOVERYStatHash];
    self.maximumValue = [aDecoder decodeDoubleForKey:kGRDSTATRECOVERYMaximumValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_value forKey:kGRDSTATRECOVERYValue];
    [aCoder encodeDouble:_statHash forKey:kGRDSTATRECOVERYStatHash];
    [aCoder encodeDouble:_maximumValue forKey:kGRDSTATRECOVERYMaximumValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDSTATRECOVERY *copy = [[GRDSTATRECOVERY alloc] init];
    
    if (copy) {

        copy.value = self.value;
        copy.statHash = self.statHash;
        copy.maximumValue = self.maximumValue;
    }
    
    return copy;
}


@end

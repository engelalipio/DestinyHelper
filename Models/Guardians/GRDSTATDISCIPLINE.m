//
//  GRDSTATDISCIPLINE.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDSTATDISCIPLINE.h"


NSString *const kGRDSTATDISCIPLINEValue = @"value";
NSString *const kGRDSTATDISCIPLINEStatHash = @"statHash";
NSString *const kGRDSTATDISCIPLINEMaximumValue = @"maximumValue";


@interface GRDSTATDISCIPLINE ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDSTATDISCIPLINE

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
            self.value = [[self objectOrNilForKey:kGRDSTATDISCIPLINEValue fromDictionary:dict] doubleValue];
            self.statHash = [[self objectOrNilForKey:kGRDSTATDISCIPLINEStatHash fromDictionary:dict] doubleValue];
            self.maximumValue = [[self objectOrNilForKey:kGRDSTATDISCIPLINEMaximumValue fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.value] forKey:kGRDSTATDISCIPLINEValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statHash] forKey:kGRDSTATDISCIPLINEStatHash];
    [mutableDict setValue:[NSNumber numberWithDouble:self.maximumValue] forKey:kGRDSTATDISCIPLINEMaximumValue];

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

    self.value = [aDecoder decodeDoubleForKey:kGRDSTATDISCIPLINEValue];
    self.statHash = [aDecoder decodeDoubleForKey:kGRDSTATDISCIPLINEStatHash];
    self.maximumValue = [aDecoder decodeDoubleForKey:kGRDSTATDISCIPLINEMaximumValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_value forKey:kGRDSTATDISCIPLINEValue];
    [aCoder encodeDouble:_statHash forKey:kGRDSTATDISCIPLINEStatHash];
    [aCoder encodeDouble:_maximumValue forKey:kGRDSTATDISCIPLINEMaximumValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDSTATDISCIPLINE *copy = [[GRDSTATDISCIPLINE alloc] init];
    
    if (copy) {

        copy.value = self.value;
        copy.statHash = self.statHash;
        copy.maximumValue = self.maximumValue;
    }
    
    return copy;
}


@end

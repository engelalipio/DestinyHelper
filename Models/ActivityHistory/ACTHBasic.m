//
//  ACTHBasic.m
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "ACTHBasic.h"


NSString *const kBasicValue = @"value";
NSString *const kBasicDisplayValue = @"displayValue";


@interface ACTHBasic()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ACTHBasic

@synthesize value = _value;
@synthesize displayValue = _displayValue;


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
            self.value = [[self objectOrNilForKey:kBasicValue fromDictionary:dict] doubleValue];
            self.displayValue = [self objectOrNilForKey:kBasicDisplayValue fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.value] forKey:kBasicValue];
    [mutableDict setValue:self.displayValue forKey:kBasicDisplayValue];

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

    self.value = [aDecoder decodeDoubleForKey:kBasicValue];
    self.displayValue = [aDecoder decodeObjectForKey:kBasicDisplayValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_value forKey:kBasicValue];
    [aCoder encodeObject:_displayValue forKey:kBasicDisplayValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    ACTHBasic *copy = [[ACTHBasic alloc] init];
    
    if (copy) {

        copy.value = self.value;
        copy.displayValue = [self.displayValue copyWithZone:zone];
    }
    
    return copy;
}


@end

//
//  UWHBasic.m
//
//  Created by Engel Alipio on 5/15/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "UWHBasic.h"


NSString *const kUWHBasicValue = @"value";
NSString *const kUWHBasicDisplayValue = @"displayValue";


@interface UWHBasic ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UWHBasic

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
            self.value = [[self objectOrNilForKey:kUWHBasicValue fromDictionary:dict] doubleValue];
            self.displayValue = [self objectOrNilForKey:kUWHBasicDisplayValue fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.value] forKey:kUWHBasicValue];
    [mutableDict setValue:self.displayValue forKey:kUWHBasicDisplayValue];

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

    self.value = [aDecoder decodeDoubleForKey:kUWHBasicValue];
    self.displayValue = [aDecoder decodeObjectForKey:kUWHBasicDisplayValue];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_value forKey:kUWHBasicValue];
    [aCoder encodeObject:_displayValue forKey:kUWHBasicDisplayValue];
}

- (id)copyWithZone:(NSZone *)zone
{
    UWHBasic *copy = [[UWHBasic alloc] init];
    
    if (copy) {

        copy.value = self.value;
        copy.displayValue = [self.displayValue copyWithZone:zone];
    }
    
    return copy;
}


@end

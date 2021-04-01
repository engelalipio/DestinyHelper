//
//  INSTPrimaryStat.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INSTPrimaryStat.h"


NSString *const kPrimaryStatValue = @"value";
NSString *const kPrimaryStatStatHash = @"statHash";


@interface INSTPrimaryStat ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INSTPrimaryStat

@synthesize value = _value;
@synthesize statHash = _statHash;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kPrimaryStatStatHash,@"statHash",
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
            self.value = [[self objectOrNilForKey:kPrimaryStatValue fromDictionary:dict] doubleValue];
            self.statHash = [[self objectOrNilForKey:kPrimaryStatStatHash fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.value] forKey:kPrimaryStatValue];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statHash] forKey:kPrimaryStatStatHash];

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

    self.value = [aDecoder decodeDoubleForKey:kPrimaryStatValue];
    self.statHash = [aDecoder decodeDoubleForKey:kPrimaryStatStatHash];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_value forKey:kPrimaryStatValue];
    [aCoder encodeDouble:_statHash forKey:kPrimaryStatStatHash];
}

- (id)copyWithZone:(NSZone *)zone
{
    INSTPrimaryStat *copy = [[INSTPrimaryStat alloc] init];
    
    if (copy) {

        copy.value = self.value;
        copy.statHash = self.statHash;
    }
    
    return copy;
}


@end

//
//  Action.m
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDDetailsAction.h"


NSString *const kActionExecuteSeconds = @"executeSeconds";
NSString *const kActionIsPositive = @"isPositive";


@interface VNDDetailsAction ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDDetailsAction

@synthesize executeSeconds = _executeSeconds;
@synthesize isPositive = _isPositive;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kActionExecuteSeconds,@"executeSeconds",
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
            self.executeSeconds = [[self objectOrNilForKey:kActionExecuteSeconds fromDictionary:dict] doubleValue];
            self.isPositive = [[self objectOrNilForKey:kActionIsPositive fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.executeSeconds] forKey:kActionExecuteSeconds];
    [mutableDict setValue:[NSNumber numberWithBool:self.isPositive] forKey:kActionIsPositive];

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

    self.executeSeconds = [aDecoder decodeDoubleForKey:kActionExecuteSeconds];
    self.isPositive = [aDecoder decodeBoolForKey:kActionIsPositive];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_executeSeconds forKey:kActionExecuteSeconds];
    [aCoder encodeBool:_isPositive forKey:kActionIsPositive];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDDetailsAction *copy = [[VNDDetailsAction alloc] init];
    
    if (copy) {

        copy.executeSeconds = self.executeSeconds;
        copy.isPositive = self.isPositive;
    }
    
    return copy;
}


@end

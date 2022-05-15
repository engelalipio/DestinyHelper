//
//  UWHResponse.m
//
//  Created by Engel Alipio on 5/15/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "UWHResponse.h"
#import "UWHWeapons.h"
#import "UWHMessageData.h"


NSString *const kResponseMessage = @"Message";
NSString *const kResponseWeapons = @"weapons";
NSString *const kResponseMessageData = @"MessageData";
NSString *const kResponseErrorStatus = @"ErrorStatus";
NSString *const kResponseErrorCode = @"ErrorCode";
NSString *const kResponseThrottleSeconds = @"ThrottleSeconds";


@interface UWHResponse ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UWHResponse

@synthesize message = _message;
@synthesize weapons = _weapons;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize throttleSeconds = _throttleSeconds;


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
            self.message = [self objectOrNilForKey:kResponseMessage fromDictionary:dict];
    NSObject *receivedWeapons = [dict objectForKey:kResponseWeapons];
    NSMutableArray *parsedWeapons = [NSMutableArray array];
    if ([receivedWeapons isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedWeapons) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedWeapons addObject:[UWHWeapons modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedWeapons isKindOfClass:[NSDictionary class]]) {
       [parsedWeapons addObject:[UWHWeapons modelObjectWithDictionary:(NSDictionary *)receivedWeapons]];
    }

    self.weapons = [NSArray arrayWithArray:parsedWeapons];
            self.messageData = [UWHMessageData modelObjectWithDictionary:[dict objectForKey:kResponseMessageData]];
            self.errorStatus = [self objectOrNilForKey:kResponseErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kResponseErrorCode fromDictionary:dict] doubleValue];
            self.throttleSeconds = [[self objectOrNilForKey:kResponseThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kResponseMessage];
    NSMutableArray *tempArrayForWeapons = [NSMutableArray array];
    for (NSObject *subArrayObject in self.weapons) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForWeapons addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForWeapons addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForWeapons] forKey:kResponseWeapons];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kResponseMessageData];
    [mutableDict setValue:self.errorStatus forKey:kResponseErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kResponseErrorCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kResponseThrottleSeconds];

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

    self.message = [aDecoder decodeObjectForKey:kResponseMessage];
    self.weapons = [aDecoder decodeObjectForKey:kResponseWeapons];
    self.messageData = [aDecoder decodeObjectForKey:kResponseMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kResponseErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kResponseErrorCode];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kResponseThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kResponseMessage];
    [aCoder encodeObject:_weapons forKey:kResponseWeapons];
    [aCoder encodeObject:_messageData forKey:kResponseMessageData];
    [aCoder encodeObject:_errorStatus forKey:kResponseErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kResponseErrorCode];
    [aCoder encodeDouble:_throttleSeconds forKey:kResponseThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    UWHResponse *copy = [[UWHResponse alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.weapons = [self.weapons copyWithZone:zone];
        copy.messageData = [self.messageData copyWithZone:zone];
        copy.errorStatus = [self.errorStatus copyWithZone:zone];
        copy.errorCode = self.errorCode;
        copy.throttleSeconds = self.throttleSeconds;
    }
    
    return copy;
}


@end

//
//  CLNM.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "CLNMBaseClass.h"
#import "CLNMResponse.h"
#import "CLNMMessageData.h"


NSString *const kCLNMResponse = @"Response";
NSString *const kCLNMMessageData = @"MessageData";
NSString *const kCLNMErrorStatus = @"ErrorStatus";
NSString *const kCLNMErrorCode = @"ErrorCode";
NSString *const kCLNMMessage = @"Message";
NSString *const kCLNMThrottleSeconds = @"ThrottleSeconds";


@interface CLNMBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLNMBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kCLNMResponse,@"Response",
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
            self.response = [CLNMResponse modelObjectWithDictionary:[dict objectForKey:kCLNMResponse]];
            self.messageData = [CLNMMessageData modelObjectWithDictionary:[dict objectForKey:kCLNMMessageData]];
            self.errorStatus = [self objectOrNilForKey:kCLNMErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kCLNMErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kCLNMMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kCLNMThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kCLNMResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kCLNMMessageData];
    [mutableDict setValue:self.errorStatus forKey:kCLNMErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kCLNMErrorCode];
    [mutableDict setValue:self.message forKey:kCLNMMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kCLNMThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kCLNMResponse];
    self.messageData = [aDecoder decodeObjectForKey:kCLNMMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kCLNMErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kCLNMErrorCode];
    self.message = [aDecoder decodeObjectForKey:kCLNMMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kCLNMThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kCLNMResponse];
    [aCoder encodeObject:_messageData forKey:kCLNMMessageData];
    [aCoder encodeObject:_errorStatus forKey:kCLNMErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kCLNMErrorCode];
    [aCoder encodeObject:_message forKey:kCLNMMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kCLNMThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLNMBaseClass *copy = [[CLNMBaseClass alloc] init];
    
    if (copy) {

        copy.response = [self.response copyWithZone:zone];
        copy.messageData = [self.messageData copyWithZone:zone];
        copy.errorStatus = [self.errorStatus copyWithZone:zone];
        copy.errorCode = self.errorCode;
        copy.message = [self.message copyWithZone:zone];
        copy.throttleSeconds = self.throttleSeconds;
    }
    
    return copy;
}


@end

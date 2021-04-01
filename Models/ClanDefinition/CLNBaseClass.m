//
//  CLN.m
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "CLNBaseClass.h"
#import "Response.h"
#import "MessageData.h"


NSString *const kCLNResponse = @"Response";
NSString *const kCLNMessageData = @"MessageData";
NSString *const kCLNErrorStatus = @"ErrorStatus";
NSString *const kCLNErrorCode = @"ErrorCode";
NSString *const kCLNMessage = @"Message";
NSString *const kCLNThrottleSeconds = @"ThrottleSeconds";


@interface CLNBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CLNBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kCLNResponse,@"Response",
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
            self.response = [Response modelObjectWithDictionary:[dict objectForKey:kCLNResponse]];
            self.messageData = [MessageData modelObjectWithDictionary:[dict objectForKey:kCLNMessageData]];
            self.errorStatus = [self objectOrNilForKey:kCLNErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kCLNErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kCLNMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kCLNThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kCLNResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kCLNMessageData];
    [mutableDict setValue:self.errorStatus forKey:kCLNErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kCLNErrorCode];
    [mutableDict setValue:self.message forKey:kCLNMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kCLNThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kCLNResponse];
    self.messageData = [aDecoder decodeObjectForKey:kCLNMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kCLNErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kCLNErrorCode];
    self.message = [aDecoder decodeObjectForKey:kCLNMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kCLNThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kCLNResponse];
    [aCoder encodeObject:_messageData forKey:kCLNMessageData];
    [aCoder encodeObject:_errorStatus forKey:kCLNErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kCLNErrorCode];
    [aCoder encodeObject:_message forKey:kCLNMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kCLNThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    CLNBaseClass *copy = [[CLNBaseClass alloc] init];
    
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

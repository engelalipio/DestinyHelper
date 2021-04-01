//
//  INVCBaseClass.m
//
//  Created by Engel Alipio on 3/13/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVCBaseClass.h"
#import "INVCResponse.h"
#import "INVCMessageData.h"


NSString *const kINVCBaseClassResponse = @"Response";
NSString *const kINVCBaseClassMessageData = @"MessageData";
NSString *const kINVCBaseClassErrorStatus = @"ErrorStatus";
NSString *const kINVCBaseClassErrorCode = @"ErrorCode";
NSString *const kINVCBaseClassMessage = @"Message";
NSString *const kINVCBaseClassThrottleSeconds = @"ThrottleSeconds";


@interface INVCBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVCBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kINVCBaseClassResponse,@"Response",
                         kINVCBaseClassMessageData,@"MessageData",
                         kINVCBaseClassErrorStatus,@"ErrorStatus",
                         kINVCBaseClassErrorCode,@"ErrorCode",
                         kINVCBaseClassThrottleSeconds,@"ThrottleSeconds",
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
            self.response = [INVCResponse modelObjectWithDictionary:[dict objectForKey:kINVCBaseClassResponse]];
            self.messageData = [INVCMessageData modelObjectWithDictionary:[dict objectForKey:kINVCBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kINVCBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kINVCBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kINVCBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kINVCBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kINVCBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kINVCBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kINVCBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kINVCBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kINVCBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kINVCBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kINVCBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kINVCBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kINVCBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kINVCBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kINVCBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kINVCBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kINVCBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kINVCBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kINVCBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kINVCBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kINVCBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kINVCBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVCBaseClass *copy = [[INVCBaseClass alloc] init];
    
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

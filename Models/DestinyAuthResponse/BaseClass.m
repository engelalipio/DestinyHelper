//
//  BaseClass.m
//
//  Created by Engel Alipio on 4/27/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "BaseClass.h"
#import "Response.h"
#import "MessageData.h"


NSString *const kBaseClassResponse = @"Response";
NSString *const kBaseClassMessageData = @"MessageData";
NSString *const kBaseClassErrorStatus = @"ErrorStatus";
NSString *const kBaseClassErrorCode = @"ErrorCode";
NSString *const kBaseClassMessage = @"Message";
NSString *const kBaseClassThrottleSeconds = @"ThrottleSeconds";


@interface BaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kBaseClassResponse,@"Response",
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
            self.response = [Response modelObjectWithDictionary:[dict objectForKey:kBaseClassResponse]];
            self.messageData = [MessageData modelObjectWithDictionary:[dict objectForKey:kBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseClass *copy = [[BaseClass alloc] init];
    
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

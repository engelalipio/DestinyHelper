//
//  VAULTBaseClass.m
//
//  Created by Engel Alipio on 5/17/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "VAULTBaseClass.h"
#import "VAULTResponse.h"
#import "VAULTMessageData.h"


NSString *const kVAULTBaseClassResponse = @"Response";
NSString *const kVAULTBaseClassMessageData = @"MessageData";
NSString *const kVAULTBaseClassErrorStatus = @"ErrorStatus";
NSString *const kVAULTBaseClassErrorCode = @"ErrorCode";
NSString *const kVAULTBaseClassMessage = @"Message";
NSString *const kVAULTBaseClassThrottleSeconds = @"ThrottleSeconds";


@interface VAULTBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VAULTBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kVAULTBaseClassResponse,@"Response",
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
            self.response = [VAULTResponse modelObjectWithDictionary:[dict objectForKey:kVAULTBaseClassResponse]];
            self.messageData = [VAULTMessageData modelObjectWithDictionary:[dict objectForKey:kVAULTBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kVAULTBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kVAULTBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kVAULTBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kVAULTBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kVAULTBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kVAULTBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kVAULTBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kVAULTBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kVAULTBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kVAULTBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kVAULTBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kVAULTBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kVAULTBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kVAULTBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kVAULTBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kVAULTBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kVAULTBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kVAULTBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kVAULTBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kVAULTBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kVAULTBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kVAULTBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    VAULTBaseClass *copy = [[VAULTBaseClass alloc] init];
    
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

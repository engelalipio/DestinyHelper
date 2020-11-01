//
//  USRBaseClass.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "USRBaseClass.h"
#import "USRResponse.h"
#import "USRMessageData.h"


NSString *const kUSRBaseClassResponse = @"Response";
NSString *const kUSRBaseClassMessageData = @"MessageData";
NSString *const kUSRBaseClassErrorStatus = @"ErrorStatus";
NSString *const kUSRBaseClassErrorCode = @"ErrorCode";
NSString *const kUSRBaseClassMessage = @"Message";
NSString *const kUSRBaseClassThrottleSeconds = @"ThrottleSeconds";


@interface USRBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation USRBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kUSRBaseClassResponse,@"Response",
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
            self.response = [USRResponse modelObjectWithDictionary:[dict objectForKey:kUSRBaseClassResponse]];
            self.messageData = [USRMessageData modelObjectWithDictionary:[dict objectForKey:kUSRBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kUSRBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kUSRBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kUSRBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kUSRBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kUSRBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kUSRBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kUSRBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kUSRBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kUSRBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kUSRBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kUSRBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kUSRBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kUSRBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kUSRBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kUSRBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kUSRBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kUSRBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kUSRBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kUSRBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kUSRBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kUSRBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kUSRBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    USRBaseClass *copy = [[USRBaseClass alloc] init];
    
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

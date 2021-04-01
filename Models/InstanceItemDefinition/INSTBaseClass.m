//
//  INSTBaseClass.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INSTBaseClass.h"
#import "INSTResponse.h"
#import "INSTMessageData.h"


NSString *const kINSTBaseClassResponse = @"Response";
NSString *const kINSTBaseClassMessageData = @"MessageData";
NSString *const kINSTBaseClassErrorStatus = @"ErrorStatus";
NSString *const kINSTBaseClassErrorCode = @"ErrorCode";
NSString *const kINSTBaseClassMessage = @"Message";
NSString *const kINSTBaseClassThrottleSeconds = @"ThrottleSeconds";


@interface INSTBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INSTBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kINSTBaseClassResponse,@"Response",
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
            self.response = [INSTResponse modelObjectWithDictionary:[dict objectForKey:kINSTBaseClassResponse]];
            self.messageData = [INSTMessageData modelObjectWithDictionary:[dict objectForKey:kINSTBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kINSTBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kINSTBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kINSTBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kINSTBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kINSTBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kINSTBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kINSTBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kINSTBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kINSTBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kINSTBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kINSTBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kINSTBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kINSTBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kINSTBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kINSTBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kINSTBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kINSTBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kINSTBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kINSTBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kINSTBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kINSTBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kINSTBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    INSTBaseClass *copy = [[INSTBaseClass alloc] init];
    
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

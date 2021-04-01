//
//  INVDDestinyInventoryBaseClass.m
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "INVDDestinyInventoryBaseClass.h"
#import "INVDResponse.h"
#import "INVDMessageData.h"


NSString *const kINVDDestinyInventoryBaseClassResponse = @"Response";
NSString *const kINVDDestinyInventoryBaseClassMessageData = @"MessageData";
NSString *const kINVDDestinyInventoryBaseClassErrorStatus = @"ErrorStatus";
NSString *const kINVDDestinyInventoryBaseClassErrorCode = @"ErrorCode";
NSString *const kINVDDestinyInventoryBaseClassMessage = @"Message";
NSString *const kINVDDestinyInventoryBaseClassThrottleSeconds = @"ThrottleSeconds";


@interface INVDDestinyInventoryBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation INVDDestinyInventoryBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;




+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kINVDDestinyInventoryBaseClassResponse,@"Response",
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
            self.response = [INVDResponse modelObjectWithDictionary:[dict objectForKey:kINVDDestinyInventoryBaseClassResponse]];
            self.messageData = [INVDMessageData modelObjectWithDictionary:[dict objectForKey:kINVDDestinyInventoryBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kINVDDestinyInventoryBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kINVDDestinyInventoryBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kINVDDestinyInventoryBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kINVDDestinyInventoryBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kINVDDestinyInventoryBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kINVDDestinyInventoryBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kINVDDestinyInventoryBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kINVDDestinyInventoryBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kINVDDestinyInventoryBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kINVDDestinyInventoryBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kINVDDestinyInventoryBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kINVDDestinyInventoryBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kINVDDestinyInventoryBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kINVDDestinyInventoryBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kINVDDestinyInventoryBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kINVDDestinyInventoryBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kINVDDestinyInventoryBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kINVDDestinyInventoryBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kINVDDestinyInventoryBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kINVDDestinyInventoryBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kINVDDestinyInventoryBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kINVDDestinyInventoryBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    INVDDestinyInventoryBaseClass *copy = [[INVDDestinyInventoryBaseClass alloc] init];
    
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

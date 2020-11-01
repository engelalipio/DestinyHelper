//
//  MBRBaseClass.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MBRBaseClass.h"
#import "MBRResponse.h"
#import "MBRMessageData.h"


NSString *const kMBRBaseClassResponse = @"Response";
NSString *const kMBRBaseClassMessageData = @"MessageData";
NSString *const kMBRBaseClassErrorStatus = @"ErrorStatus";
NSString *const kMBRBaseClassErrorCode = @"ErrorCode";
NSString *const kMBRBaseClassMessage = @"Message";
NSString *const kMBRBaseClassThrottleSeconds = @"ThrottleSeconds";


@interface MBRBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MBRBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kMBRBaseClassResponse,@"Response",
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
            self.response = [MBRResponse modelObjectWithDictionary:[dict objectForKey:kMBRBaseClassResponse]];
            self.messageData = [MBRMessageData modelObjectWithDictionary:[dict objectForKey:kMBRBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kMBRBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kMBRBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kMBRBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kMBRBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kMBRBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kMBRBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kMBRBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kMBRBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kMBRBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kMBRBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kMBRBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kMBRBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kMBRBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kMBRBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kMBRBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kMBRBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kMBRBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kMBRBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kMBRBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kMBRBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kMBRBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kMBRBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    MBRBaseClass *copy = [[MBRBaseClass alloc] init];
    
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

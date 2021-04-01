//
//  VNDBaseClass.m
//
//  Created by Engel Alipio on 2/28/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import "VNDBaseClass.h"
#import "VNDResponse.h"
#import "VNDMessageData.h"


NSString *const kVNDBaseClassResponse = @"Response";
NSString *const kVNDBaseClassMessageData = @"MessageData";
NSString *const kVNDBaseClassErrorStatus = @"ErrorStatus";
NSString *const kVNDBaseClassErrorCode = @"ErrorCode";
NSString *const kVNDBaseClassMessage = @"Message";
NSString *const kVNDBaseClassThrottleSeconds = @"ThrottleSeconds";


@interface VNDBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VNDBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kVNDBaseClassResponse,@"Response",
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
            self.response = [VNDResponse modelObjectWithDictionary:[dict objectForKey:kVNDBaseClassResponse]];
            self.messageData = [VNDMessageData modelObjectWithDictionary:[dict objectForKey:kVNDBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kVNDBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kVNDBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kVNDBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kVNDBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kVNDBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kVNDBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kVNDBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kVNDBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kVNDBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kVNDBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kVNDBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kVNDBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kVNDBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kVNDBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kVNDBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kVNDBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kVNDBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kVNDBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kVNDBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kVNDBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kVNDBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kVNDBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    VNDBaseClass *copy = [[VNDBaseClass alloc] init];
    
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

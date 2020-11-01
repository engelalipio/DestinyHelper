//
//  MNFBaseClass.m
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import "MNFBaseClass.h"
#import "MNFResponse.h"
#import "MNFMessageData.h"


NSString *const kMNFBaseClassResponse = @"MNFResponse";
NSString *const kMNFBaseClassMessageData = @"MNFMessageData";
NSString *const kMNFBaseClassErrorStatus = @"ErrorStatus";
NSString *const kMNFBaseClassErrorCode = @"ErrorCode";
NSString *const kMNFBaseClassMessage = @"Message";
NSString *const kMNFBaseClassThrottleSeconds = @"ThrottleSeconds";


@interface MNFBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MNFBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kMNFBaseClassResponse,@"MNFResponse",
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
            self.response = [MNFResponse modelObjectWithDictionary:[dict objectForKey:kMNFBaseClassResponse]];
            self.messageData = [MNFMessageData modelObjectWithDictionary:[dict objectForKey:kMNFBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kMNFBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kMNFBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kMNFBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kMNFBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kMNFBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kMNFBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kMNFBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kMNFBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kMNFBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kMNFBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kMNFBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kMNFBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kMNFBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kMNFBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kMNFBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kMNFBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kMNFBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kMNFBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kMNFBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kMNFBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kMNFBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kMNFBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    MNFBaseClass *copy = [[MNFBaseClass alloc] init];
    
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

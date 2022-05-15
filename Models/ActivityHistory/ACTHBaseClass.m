//
//  ACTHBaseClass.m
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import "ACTHBaseClass.h"
#import "ACTHResponse.h"
#import "ACTHMessageData.h"


NSString *const kACTHBaseClassResponse = @"Response";
NSString *const kACTHBaseClassMessageData = @"MessageData";
NSString *const kACTHBaseClassErrorStatus = @"ErrorStatus";
NSString *const kACTHBaseClassErrorCode = @"ErrorCode";
NSString *const kACTHBaseClassMessage = @"Message";
NSString *const kACTHBaseClassThrottleSeconds = @"ThrottleSeconds";


@interface ACTHBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ACTHBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;


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
            self.response = [ACTHResponse modelObjectWithDictionary:[dict objectForKey:kACTHBaseClassResponse]];
            self.messageData = [ACTHMessageData modelObjectWithDictionary:[dict objectForKey:kACTHBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kACTHBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kACTHBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kACTHBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kACTHBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kACTHBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kACTHBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kACTHBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kACTHBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kACTHBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kACTHBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kACTHBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kACTHBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kACTHBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kACTHBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kACTHBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kACTHBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kACTHBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kACTHBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kACTHBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kACTHBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kACTHBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kACTHBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    ACTHBaseClass *copy = [[ACTHBaseClass alloc] init];
    
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

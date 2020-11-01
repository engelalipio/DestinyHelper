//
//  GLSBaseClass.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GLSBaseClass.h"
#import "GLSResponse.h"
#import "GLSMessageData.h"


NSString *const kGLSBaseClassResponse = @"Response";
NSString *const kGLSBaseClassMessageData = @"MessageData";
NSString *const kGLSBaseClassErrorStatus = @"ErrorStatus";
NSString *const kGLSBaseClassErrorCode = @"ErrorCode";
NSString *const kGLSBaseClassMessage = @"Message";
NSString *const kGLSBaseClassThrottleSeconds = @"ThrottleSeconds";


@interface GLSBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GLSBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;

+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kGLSBaseClassResponse,@"Response",
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
            self.response = [GLSResponse modelObjectWithDictionary:[dict objectForKey:kGLSBaseClassResponse]];
            self.messageData = [GLSMessageData modelObjectWithDictionary:[dict objectForKey:kGLSBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kGLSBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kGLSBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kGLSBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kGLSBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kGLSBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kGLSBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kGLSBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kGLSBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kGLSBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kGLSBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kGLSBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kGLSBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kGLSBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kGLSBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kGLSBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kGLSBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kGLSBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kGLSBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kGLSBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kGLSBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kGLSBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kGLSBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    GLSBaseClass *copy = [[GLSBaseClass alloc] init];
    
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

//
//  GRDBaseClass.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "GRDBaseClass.h"
#import "GRDResponse.h"
#import "GRDMessageData.h"


NSString *const kGRDBaseClassResponse = @"Response";
NSString *const kGRDBaseClassMessageData = @"MessageData";
NSString *const kGRDBaseClassErrorStatus = @"ErrorStatus";
NSString *const kGRDBaseClassErrorCode = @"ErrorCode";
NSString *const kGRDBaseClassMessage = @"Message";
NSString *const kGRDBaseClassThrottleSeconds = @"ThrottleSeconds";


@interface GRDBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GRDBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;



+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kGRDBaseClassResponse,@"Response",
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
            self.response = [GRDResponse modelObjectWithDictionary:[dict objectForKey:kGRDBaseClassResponse]];
            self.messageData = [GRDMessageData modelObjectWithDictionary:[dict objectForKey:kGRDBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kGRDBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kGRDBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kGRDBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kGRDBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.response dictionaryRepresentation] forKey:kGRDBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kGRDBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kGRDBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kGRDBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kGRDBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kGRDBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kGRDBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kGRDBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kGRDBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kGRDBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kGRDBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kGRDBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kGRDBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kGRDBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kGRDBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kGRDBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kGRDBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kGRDBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    GRDBaseClass *copy = [[GRDBaseClass alloc] init];
    
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

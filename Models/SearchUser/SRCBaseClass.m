//
//  SRCBaseClass.m
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "SRCBaseClass.h"
#import "SRCResponse.h"
#import "SRCMessageData.h"


NSString *const kSRCBaseClassResponse = @"Response";
NSString *const kSRCBaseClassMessageData = @"MessageData";
NSString *const kSRCBaseClassErrorStatus = @"ErrorStatus";
NSString *const kSRCBaseClassErrorCode = @"ErrorCode";
NSString *const kSRCBaseClassMessage = @"Message";
NSString *const kSRCBaseClassThrottleSeconds = @"ThrottleSeconds";

 
@interface SRCBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SRCBaseClass

@synthesize response = _response;
@synthesize messageData = _messageData;
@synthesize errorStatus = _errorStatus;
@synthesize errorCode = _errorCode;
@synthesize message = _message;
@synthesize throttleSeconds = _throttleSeconds;


+ (NSDictionary *)mapping{
    
    
    NSDictionary *map = [[NSDictionary alloc] initWithObjectsAndKeys:
                         kSRCBaseClassResponse,@"Response",
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
    NSObject *receivedSRCResponse = [dict objectForKey:kSRCBaseClassResponse];
    NSMutableArray *parsedSRCResponse = [NSMutableArray array];
    if ([receivedSRCResponse isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedSRCResponse) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedSRCResponse addObject:[SRCResponse modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedSRCResponse isKindOfClass:[NSDictionary class]]) {
       [parsedSRCResponse addObject:[SRCResponse modelObjectWithDictionary:(NSDictionary *)receivedSRCResponse]];
    }

    self.response = [NSArray arrayWithArray:parsedSRCResponse];
            self.messageData = [SRCMessageData modelObjectWithDictionary:[dict objectForKey:kSRCBaseClassMessageData]];
            self.errorStatus = [self objectOrNilForKey:kSRCBaseClassErrorStatus fromDictionary:dict];
            self.errorCode = [[self objectOrNilForKey:kSRCBaseClassErrorCode fromDictionary:dict] doubleValue];
            self.message = [self objectOrNilForKey:kSRCBaseClassMessage fromDictionary:dict];
            self.throttleSeconds = [[self objectOrNilForKey:kSRCBaseClassThrottleSeconds fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForResponse = [NSMutableArray array];
    for (NSObject *subArrayObject in self.response) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForResponse addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForResponse addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForResponse] forKey:kSRCBaseClassResponse];
    [mutableDict setValue:[self.messageData dictionaryRepresentation] forKey:kSRCBaseClassMessageData];
    [mutableDict setValue:self.errorStatus forKey:kSRCBaseClassErrorStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.errorCode] forKey:kSRCBaseClassErrorCode];
    [mutableDict setValue:self.message forKey:kSRCBaseClassMessage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.throttleSeconds] forKey:kSRCBaseClassThrottleSeconds];

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

    self.response = [aDecoder decodeObjectForKey:kSRCBaseClassResponse];
    self.messageData = [aDecoder decodeObjectForKey:kSRCBaseClassMessageData];
    self.errorStatus = [aDecoder decodeObjectForKey:kSRCBaseClassErrorStatus];
    self.errorCode = [aDecoder decodeDoubleForKey:kSRCBaseClassErrorCode];
    self.message = [aDecoder decodeObjectForKey:kSRCBaseClassMessage];
    self.throttleSeconds = [aDecoder decodeDoubleForKey:kSRCBaseClassThrottleSeconds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_response forKey:kSRCBaseClassResponse];
    [aCoder encodeObject:_messageData forKey:kSRCBaseClassMessageData];
    [aCoder encodeObject:_errorStatus forKey:kSRCBaseClassErrorStatus];
    [aCoder encodeDouble:_errorCode forKey:kSRCBaseClassErrorCode];
    [aCoder encodeObject:_message forKey:kSRCBaseClassMessage];
    [aCoder encodeDouble:_throttleSeconds forKey:kSRCBaseClassThrottleSeconds];
}

- (id)copyWithZone:(NSZone *)zone
{
    SRCBaseClass *copy = [[SRCBaseClass alloc] init];
    
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

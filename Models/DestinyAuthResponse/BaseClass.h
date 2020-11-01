//
//  BaseClass.h
//
//  Created by Engel Alipio on 4/27/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Response, MessageData;

@interface BaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Response *response;
@property (nonatomic, strong) MessageData *messageData;
@property (nonatomic, strong) NSString *errorStatus;
@property (nonatomic, assign) double errorCode;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) double throttleSeconds;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

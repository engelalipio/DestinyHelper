//
//  ACTHBaseClass.h
//
//  Created by Engel Alipio on 5/10/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ACTHResponse, ACTHMessageData;

@interface ACTHBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ACTHResponse *response;
@property (nonatomic, strong) ACTHMessageData *messageData;
@property (nonatomic, strong) NSString *errorStatus;
@property (nonatomic, assign) double errorCode;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) double throttleSeconds;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

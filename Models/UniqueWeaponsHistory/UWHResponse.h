//
//  UWHResponse.h
//
//  Created by Engel Alipio on 5/15/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UWHMessageData;

@interface UWHResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSArray *weapons;
@property (nonatomic, strong) UWHMessageData *messageData;
@property (nonatomic, strong) NSString *errorStatus;
@property (nonatomic, assign) double errorCode;
@property (nonatomic, assign) double throttleSeconds;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  INVDDestinyInventoryBaseClass.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class INVDResponse, INVDMessageData;

@interface INVDDestinyInventoryBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) INVDResponse *response;
@property (nonatomic, strong) INVDMessageData *messageData;
@property (nonatomic, strong) NSString *errorStatus;
@property (nonatomic, assign) double errorCode;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) double throttleSeconds;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

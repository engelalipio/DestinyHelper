//
//  MNFBaseClass.h
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MNFResponse, MNFMessageData;

@interface MNFBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) MNFResponse *response;
@property (nonatomic, strong) MNFMessageData *messageData;
@property (nonatomic, strong) NSString *errorStatus;
@property (nonatomic, assign) double errorCode;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) double throttleSeconds;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

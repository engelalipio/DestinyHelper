//
//  SRCBaseClass.h
//
//  Created by Engel Alipio on 4/29/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AbstractModel.h"

@class SRCMessageData;

@interface SRCBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *response;
@property (nonatomic, strong) SRCMessageData *messageData;
@property (nonatomic, strong) NSString *errorStatus;
@property (nonatomic, assign) double errorCode;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, assign) double throttleSeconds;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;



@end

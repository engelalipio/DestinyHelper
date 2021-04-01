//
//  Founder.h
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DestinyUserInfo;

@interface Founder : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *groupId;
@property (nonatomic, strong) NSString *joinDate;
@property (nonatomic, strong) NSString *lastOnlineStatusChange;
@property (nonatomic, assign) BOOL isOnline;
@property (nonatomic, assign) double memberType;
@property (nonatomic, strong) DestinyUserInfo *destinyUserInfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

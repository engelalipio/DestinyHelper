//
//  Results.h
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLNMBungieNetUserInfo, CLNMDestinyUserInfo;

@interface Results : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) CLNMBungieNetUserInfo *bungieNetUserInfo;
@property (nonatomic, strong) CLNMDestinyUserInfo *destinyUserInfo;
@property (nonatomic, strong) NSString *lastOnlineStatusChange;
@property (nonatomic, assign) double memberType;
@property (nonatomic, assign) BOOL isOnline;
@property (nonatomic, strong) NSString *groupId;
@property (nonatomic, strong) NSString *joinDate;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

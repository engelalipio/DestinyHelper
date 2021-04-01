//
//  Detail.h
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ClanInfo, Features;

@interface CLNDetail : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double membershipOption;
@property (nonatomic, strong) NSString *banExpireDate;
@property (nonatomic, strong) NSString *membershipIdCreated;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, assign) BOOL enableInvitationMessagingForAdmins;
@property (nonatomic, strong) NSString *motto;
@property (nonatomic, assign) BOOL allowChat;
@property (nonatomic, assign) double defaultPublicity;
@property (nonatomic, assign) BOOL isDefaultPostPublic;
@property (nonatomic, strong) NSString *bannerPath;
@property (nonatomic, strong) ClanInfo *clanInfo;
@property (nonatomic, assign) BOOL isPublicTopicAdminOnly;
@property (nonatomic, strong) NSString *avatarPath;
@property (nonatomic, strong) NSString *locale;
@property (nonatomic, assign) double homepage;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double avatarImageIndex;
@property (nonatomic, assign) double groupType;
@property (nonatomic, assign) double memberCount;
@property (nonatomic, assign) double chatSecurity;
@property (nonatomic, strong) NSString *modificationDate;
@property (nonatomic, strong) NSString *about;
@property (nonatomic, strong) NSString *theme;
@property (nonatomic, strong) NSString *creationDate;
@property (nonatomic, strong) NSString *groupId;
@property (nonatomic, assign) BOOL isPublic;
@property (nonatomic, strong) NSString *conversationId;
@property (nonatomic, strong) Features *features;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

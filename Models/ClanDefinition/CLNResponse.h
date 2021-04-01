//
//  Response.h
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CLNDetail, CurrentUserMemberMap, Founder, CurrentUserPotentialMemberMap;

@interface CLNResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) CLNDetail *detail;
@property (nonatomic, assign) double allianceStatus;
@property (nonatomic, strong) NSArray *alliedIds;
@property (nonatomic, strong) CurrentUserMemberMap *currentUserMemberMap;
@property (nonatomic, assign) BOOL currentUserMembershipsInactiveForDestiny;
@property (nonatomic, strong) Founder *founder;
@property (nonatomic, assign) double groupJoinInviteCount;
@property (nonatomic, strong) CurrentUserPotentialMemberMap *currentUserPotentialMemberMap;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

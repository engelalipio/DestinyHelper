//
//  CLNMDestinyUserInfo.h
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CLNMDestinyUserInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, assign) double crossSaveOverride;
@property (nonatomic, strong) NSArray *applicableMembershipTypes;
@property (nonatomic, assign) double membershipType;
@property (nonatomic, assign) double lastSeenDisplayNameType;
@property (nonatomic, assign) BOOL isPublic;
@property (nonatomic, strong) NSString *lastSeenDisplayName;
@property (nonatomic, strong) NSString *membershipId;
@property (nonatomic, strong) NSString *iconPath;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

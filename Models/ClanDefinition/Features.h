//
//  Features.h
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Features : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double maximumMembers;
@property (nonatomic, assign) double capabilities;
@property (nonatomic, assign) double joinLevel;
@property (nonatomic, assign) BOOL updateCulturePermissionOverride;
@property (nonatomic, assign) BOOL invitePermissionOverride;
@property (nonatomic, strong) NSArray *membershipTypes;
@property (nonatomic, assign) BOOL updateBannerPermissionOverride;
@property (nonatomic, assign) double hostGuidedGamePermissionOverride;
@property (nonatomic, assign) double maximumMembershipsOfGroupType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

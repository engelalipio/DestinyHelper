//
//  BungieNetUserInfo.h
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface CLNMBungieNetUserInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, assign) double crossSaveOverride;
@property (nonatomic, assign) double membershipType;
@property (nonatomic, strong) NSString *supplementalDisplayName;
@property (nonatomic, strong) NSString *membershipId;
@property (nonatomic, assign) BOOL isPublic;
@property (nonatomic, strong) NSString *iconPath;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

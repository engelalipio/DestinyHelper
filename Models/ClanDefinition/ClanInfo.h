//
//  ClanInfo.h
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ClanBannerData, D2ClanProgressions;

@interface ClanInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ClanBannerData *clanBannerData;
@property (nonatomic, strong) NSString *clanCallsign;
@property (nonatomic, strong) D2ClanProgressions *d2ClanProgressions;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

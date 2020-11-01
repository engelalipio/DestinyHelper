//
//  Response.h
//
//  Created by Engel Alipio on 10/10/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JsonWorldComponentContentPaths, MobileWorldContentPaths, JsonWorldContentPaths, MobileGearCDN;

@interface MNFResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) JsonWorldComponentContentPaths *jsonWorldComponentContentPaths;
@property (nonatomic, strong) MobileWorldContentPaths *mobileWorldContentPaths;
@property (nonatomic, strong) NSString *mobileClanBannerDatabasePath;
@property (nonatomic, strong) NSArray *mobileGearAssetDataBases;
@property (nonatomic, strong) NSString *mobileAssetContentPath;
@property (nonatomic, strong) JsonWorldContentPaths *jsonWorldContentPaths;
@property (nonatomic, strong) NSString *version;
@property (nonatomic, strong) NSArray *iconImagePyramidInfo;
@property (nonatomic, strong) MobileGearCDN *mobileGearCDN;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

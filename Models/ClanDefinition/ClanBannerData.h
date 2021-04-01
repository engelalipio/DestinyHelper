//
//  ClanBannerData.h
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ClanBannerData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double decalId;
@property (nonatomic, assign) double gonfalonId;
@property (nonatomic, assign) double decalBackgroundColorId;
@property (nonatomic, assign) double decalColorId;
@property (nonatomic, assign) double gonfalonColorId;
@property (nonatomic, assign) double gonfalonDetailId;
@property (nonatomic, assign) double gonfalonDetailColorId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

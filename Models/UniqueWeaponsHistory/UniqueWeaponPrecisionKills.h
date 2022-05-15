//
//  UniqueWeaponPrecisionKills.h
//
//  Created by Engel Alipio on 5/15/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UWHBasic;

@interface UniqueWeaponPrecisionKills : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) UWHBasic *basic;
@property (nonatomic, strong) NSString *statId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

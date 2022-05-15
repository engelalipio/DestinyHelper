//
//  UWHValues.h
//
//  Created by Engel Alipio on 5/15/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UniqueWeaponKills, UniqueWeaponPrecisionKills, UniqueWeaponAssists, UniqueWeaponAssistDamage, UniqueWeaponKillsPrecisionKills;

@interface UWHValues : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) UniqueWeaponKills *uniqueWeaponKills;
@property (nonatomic, strong) UniqueWeaponPrecisionKills *uniqueWeaponPrecisionKills;
@property (nonatomic, strong) UniqueWeaponAssists *uniqueWeaponAssists;
@property (nonatomic, strong) UniqueWeaponAssistDamage *uniqueWeaponAssistDamage;
@property (nonatomic, strong) UniqueWeaponKillsPrecisionKills *uniqueWeaponKillsPrecisionKills;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

//
//  INSTData.h
//
//  Created by Engel Alipio on 3/11/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class INSTPrimaryStat;

@interface INSTData : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double damageType;
@property (nonatomic, assign) double damageTypeHash;
@property (nonatomic, assign) double equipRequiredLevel;
@property (nonatomic, strong) NSArray *unlockHashesRequiredToEquip;
@property (nonatomic, assign) BOOL canEquip;
@property (nonatomic, assign) double itemLevel;
@property (nonatomic, assign) double cannotEquipReason;
@property (nonatomic, assign) double quality;
@property (nonatomic, assign) BOOL isEquipped;
@property (nonatomic, strong) INSTPrimaryStat *primaryStat;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

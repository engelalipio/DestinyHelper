//
//  D2ClanProgressions.h
//
//  Created by Engel Alipio on 3/4/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProgressionHashKey;

@interface D2ClanProgressions : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ProgressionHashKey *progressionHashKey;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

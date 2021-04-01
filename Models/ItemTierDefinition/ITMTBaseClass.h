//
//  ITMTBaseClass.h
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DestinyItemTierTypeDefinition;

@interface ITMTBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) DestinyItemTierTypeDefinition *destinyItemTierDefinition;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

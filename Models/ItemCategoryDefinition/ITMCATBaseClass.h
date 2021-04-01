//
//  ITMCATBaseClass.h
//
//  Created by Engel Alipio on 3/10/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DestinyItemCategoryDefinition;

@interface ITMCATBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) DestinyItemCategoryDefinition *destinyItemCategoryDefinition;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

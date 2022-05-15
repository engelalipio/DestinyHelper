//
//  UWHWeapons.h
//
//  Created by Engel Alipio on 5/15/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UWHValues;

@interface UWHWeapons : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) UWHValues *values;
@property (nonatomic, assign) double referenceId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

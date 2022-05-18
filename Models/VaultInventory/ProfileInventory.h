//
//  ProfileInventory.h
//
//  Created by Engel Alipio on 5/17/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VAULTData;

@interface ProfileInventory : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double privacy;
@property (nonatomic, strong) VAULTData *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

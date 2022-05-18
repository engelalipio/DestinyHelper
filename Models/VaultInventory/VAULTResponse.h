//
//  VAULTResponse.h
//
//  Created by Engel Alipio on 5/17/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ProfileInventory;

@interface VAULTResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ProfileInventory *profileInventory;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

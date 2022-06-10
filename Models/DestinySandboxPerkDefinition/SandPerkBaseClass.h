//
//  SandPerkBaseClass.h
//
//  Created by Engel Alipio on 6/9/22
//  Copyright (c) 2022 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SPDisplayProperties;

@interface SandPerkBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double hash;
@property (nonatomic, assign) BOOL blacklisted;
@property (nonatomic, assign) BOOL redacted;
@property (nonatomic, assign) BOOL isDisplayable;
@property (nonatomic, strong) SPDisplayProperties *displayProperties;
@property (nonatomic, assign) double damageType;
@property (nonatomic, assign) double index;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

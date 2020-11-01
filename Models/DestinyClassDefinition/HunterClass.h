//
//  Hunter.h
//  671679327
//  Created by Engel Alipio on 10/11/20
//  Copyright (c) 2020 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GenderedClassNamesByGenderHash, DisplayProperties, GenderedClassNames;

@interface Hunter : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) NSString* className;
@property (nonatomic, assign) double classType;
@property (nonatomic, assign) double hash;
@property (nonatomic, assign) BOOL blacklisted;
@property (nonatomic, strong) GenderedClassNamesByGenderHash *genderedClassNamesByGenderHash;
@property (nonatomic, assign) BOOL redacted;
@property (nonatomic, strong) DisplayProperties *displayProperties;
@property (nonatomic, strong) GenderedClassNames *genderedClassNames;
@property (nonatomic, assign) double index;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end

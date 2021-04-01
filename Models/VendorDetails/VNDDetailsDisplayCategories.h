//
//  DisplayCategories.h
//
//  Created by Engel Alipio on 3/6/21
//  Copyright (c) 2021 Citi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VNDDetailsDisplayProperties;

@interface VNDDetailsDisplayCategories : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double displayCategoryHash;
@property (nonatomic, assign) BOOL displayInBanner;
@property (nonatomic, assign) double sortOrder;
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) VNDDetailsDisplayProperties *displayProperties;
@property (nonatomic, assign) double index;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
